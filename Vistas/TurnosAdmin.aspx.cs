using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class TurnosAdmin : System.Web.UI.Page
    {
        NegocioTurnosJunio nj = new NegocioTurnosJunio();
        NegocioEspecialidades ne = new NegocioEspecialidades();
        NegocioPacientes np = new NegocioPacientes();
        RegistroTurno turno = new RegistroTurno();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(IsPostBack))
            {
                lblNombre.Text = Application["login"].ToString();
                CargarEspecialidades();
            }
        }
        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Application["login"] = null;
            Response.Redirect("~/Login.aspx");
        }
        private void CargarEspecialidades()
        {
            ddl_especialidades.DataSource = ne.getEspecialidadesTurno();
            ddl_especialidades.DataValueField = "codEspecialidad_e";
            ddl_especialidades.DataTextField = "descripcion_e";
            ddl_especialidades.DataBind();
            ddl_especialidades.Items.Insert(0, new ListItem("-Seleccione una Especialidad-", "0"));
        }
        protected void ddl_especialidades_SelectedIndexChanged(object sender, EventArgs e)
        {
            limpiarddlMedicos();
            limpiarddlDias();
            limpiarddlHorarios();
            string codEspecialidad = ddl_especialidades.SelectedValue;
            DataTable medicosEspecialidad = nj.getTurnosJunioGRID(codEspecialidad);
            ddl_medicos.DataSource = medicosEspecialidad;
            ddl_medicos.DataTextField = "NombreCompleto";
            ddl_medicos.DataValueField = "Legajo_TJ";
            ddl_medicos.DataBind();
            ddl_medicos.Items.Insert(0, new ListItem("-Seleccione un Medico-", "0"));
        }
        private void limpiarddlEspecialidades()
        {
            ddl_especialidades.SelectedIndex = 0;
        }
        private void limpiarddlMedicos()
        {
            ddl_medicos.Items.Clear();
        }
        private void limpiarddlDias()
        {
            ddl_dias.Items.Clear();
        }
        private void limpiarddlHorarios()
        {
            ddl_horarios.Items.Clear();
        }
        protected void ddl_medicos_SelectedIndexChanged(object sender, EventArgs e)
        {
            limpiarddlHorarios();


            turno.Legajo = Convert.ToInt32(ddl_medicos.SelectedValue);
            DataTable dias = nj.getTurnosJunioGRID("", turno);
            ddl_dias.DataSource = dias;
            ddl_dias.DataTextField = "Dias";
            ddl_dias.DataValueField = "CodDia_TJ";
            ddl_dias.DataBind();
            ddl_dias.Items.Insert(0, new ListItem("-Seleccione un Día-", "0"));
        }
        protected void ddl_dias_SelectedIndexChanged(object sender, EventArgs e)
        {
            turno.Legajo = Convert.ToInt32(ddl_medicos.SelectedValue);
            turno.CodDia = ddl_dias.SelectedValue;
            DataTable Horarios = nj.getTurnosJunioGRID("", turno);
            ddl_horarios.DataSource = Horarios;
            ddl_horarios.DataTextField = "CodHorario_TJ";
            ddl_horarios.DataValueField = "CodHorario_TJ";
            ddl_horarios.DataBind();
            ddl_horarios.Items.Insert(0, new ListItem("-Seleccione un Horario-", "0"));
        }
        protected void btnFiltrarTurnos_Click(object sender, EventArgs e)
        {
            string CodEspe = ddl_especialidades.SelectedValue;
            turno.Legajo = Convert.ToInt32(ddl_medicos.SelectedValue);
            turno.CodDia = ddl_dias.SelectedValue;
            turno.CodHorario = ddl_horarios.SelectedValue;
            CargarTurnos(true, CodEspe, turno);
        }
        private void CargarTurnos(bool filtrado = false, string codEspe = "", RegistroTurno turno = null)
        {
            if (!(filtrado)) grdTurnos.DataSource = nj.getTurnosJunioGRID();
            else grdTurnos.DataSource = nj.getTurnosJunioGRIDFiltrado(codEspe, turno);
            grdTurnos.DataBind();
            grdTurnos.Visible = true;
        }
        protected void btnBuscarPaciente_Click(object sender, EventArgs e)
        {
            DataTable pacientes = np.getPacientesFiltrados(txt_nom_ape.Text);
            ddl_pacientes.Items.Clear(); //para que siempre limpie el ddl antes de cargarla con cada busqueda

            if (pacientes.Rows.Count == 0)
            {
                ddl_pacientes.Items.Insert(0, new ListItem("---Sin coincidencias---", "0"));
                ddl_pacientes.DataBind();
            }
            else
            {

                ddl_pacientes.DataSource = pacientes;
                ddl_pacientes.DataValueField = "DNI";
                ddl_pacientes.DataTextField = "Nombre Completo";
                ddl_pacientes.DataBind();
                ddl_pacientes.Items.Insert(0, new ListItem("-Seleccione un Paciente-", "0"));

            }
        }
        protected void btnTomarTurno_Command(object sender, CommandEventArgs e)
        {

            if (e.CommandName == "eventoTomarTurno")
            {
                
                if(ddl_pacientes.SelectedValue == "---Sin coincidencias---")
                {
                    ShowAlert("Busque otro paciente","","error");
                    return;
                    
                }

                string argumentoCompleto = e.CommandArgument.ToString();
                int Idturno = Convert.ToInt32(argumentoCompleto.Split(';')[0]);
                string nombreMedico = argumentoCompleto.Split(';')[1];
                string diaYhora = argumentoCompleto.Split(';')[2] + " a las " + argumentoCompleto.Split(';')[3];
                string fecha = argumentoCompleto.Split(';')[4];
                string nombrePaciente = ddl_pacientes.SelectedItem.ToString(); //me guardo el nombre del paciente para el mensaje
                string dniPaciente = ddl_pacientes.SelectedValue; //me guardo el dni del paciente para la tabla turnosJunio

                RegistroTurno turno = new RegistroTurno();
                turno.Id_Turno = Idturno;
                turno.Dni_paciente = dniPaciente;


                if (nj.tomarTurno(turno))
                {
                    string mensaje2 = " <p> Turno NRO: " + Idturno + " </p> <br> <p> Medico: " + nombreMedico + " </p> <br> <p> Dia y hora: " + diaYhora + " </p> <br> <p> Fecha: " + fecha + " </p> ";
                    string mensaje = " Turno NRO: " + Idturno  + " Medico: " + nombreMedico + " Dia y hora: " + diaYhora + " Fecha: " + fecha ;
                    ShowAlert("Turno Confirmado para el Paciente: " + nombrePaciente + "", mensaje2, "success");
                }
                //se vuelve a actualizar el grid con todos turnos
                CargarTurnos();
                limpiarddlEspecialidades();
                limpiarddlMedicos();
                limpiarddlDias();
                limpiarddlHorarios();
                txt_nom_ape.Text = "";
                ddl_pacientes.Items.Clear();
            }
        }

        private void ShowAlert(string title, string message, string icon)
        {
            string script = "swal.fire({ title: '" + title + "', html: '" + message + "', icon: '" + icon + "' });";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alertScript", script, true);
        }
    }
}