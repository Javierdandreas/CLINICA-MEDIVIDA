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
    public partial class AgregarMedico : System.Web.UI.Page
    {
        NegocioNacionalidades nn = new NegocioNacionalidades();
        NegocioEspecialidades ne = new NegocioEspecialidades();
        NegocioDiasMedicos dm = new NegocioDiasMedicos();
        NegocioFechasJunio fj = new NegocioFechasJunio();
        NegocioTurnosJunio tj = new NegocioTurnosJunio();
        NegocioLocalidades nl = new NegocioLocalidades();
        NegocioProvincias np = new NegocioProvincias();
        NegocioHorarios nh = new NegocioHorarios();
        NegocioMedicos nm = new NegocioMedicos();
        NegocioDias nd = new NegocioDias();
        Medico med = new Medico();
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(IsPostBack))
            {
                CargarProvincias();
                CargarEspecialidades();
                CargarDias();
                cargarNacionalidades();
                lblNombre.Text = Application["login"].ToString();
            }
        }
        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarLocalidades();
        }
        protected void CargarLocalidades()
        {
            if (ddlProvincias.SelectedIndex > 0)
            {
                string IdProv = ddlProvincias.SelectedValue;
                ddlLocalidades.DataSource = nl.getLocalidades(IdProv);
                ddlLocalidades.DataTextField = "descripcion_L";
                ddlLocalidades.DataValueField = "codLoc_L";
                ddlLocalidades.DataBind();
                ddlLocalidades.Items.Insert(0, new ListItem("--Seleccione una Localidad--", "0"));
            }
            else { ddlLocalidades.Items.Insert(0, new ListItem("--Seleccione una Localidad--", "0")); }
        }
        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            //verifica que haya por lo menos un dia seleccionado en el cblist
            if (verificarCheckBoxList() == false) {
                ShowAlert("Precaución", "Selecciona por lo menos un dia de trabajo!", "warning");
                return;
            }
            else { 
                lblDiasSeleccionados.Text = "";
            }

            CargarMedico(ref med);
            bool existeDni = nm.existeDNI(med);
            bool existeUser = nm.existeUser(med);
            lblAgregado.Text = "";
            if (existeUser) { 
                ShowAlert("Precaución", "Este nombre de usuario ya esta en uso", "warning");
                return;
            }
            if (existeDni) { 
                ShowAlert("Precaución", "Este DNI ya esta en uso", "warning");
                return;
            }
            if (lblAgregado.Text != "") {
                return; 
            }

            //SE INSERTA UN MEDICO EN TABLA MEDICOS
            nm.addMedico(med);
            //como el Legajo es autonumerico, me traigo el numero de legajo generado en la db y se lo cargo al medico que recien cree. Esto me va a permitir generar los registro de la tabla DIASMEDICOS
            med.Legajo_M = nm.GetLegajoMedicoPorDNI(med);
            
            ShowAlert("Medico agregado con éxito!!", "Genera los turnos al respectivo medico", "success");
            cargarTablaDiasMedicos(med);
            limpiarControles();
            btnGenerarTurnos.Visible = true;
        }
        private void CargarMedico(ref Medico m)
        {
            m.Dni_m = txtDni.Text;

            m.Nombre_M = txtNombre.Text;

            m.Apellido_M = txtApellido.Text;

            m.Sexo_M = Convert.ToChar(rblSexo.SelectedValue);

            m.FechaNacimiento_M = txtFechaNacimiento.Text;

            m.Direccion_M = txtDireccion.Text;

            m.Localidad = new Localidades();
            m.Localidad.CodLoc_L = ddlLocalidades.SelectedValue;

            m.Provincia = new Provincias();
            m.Provincia.CodProv_P = ddlProvincias.SelectedValue;

            m.Nacionalidad = new Nacionalidades();
            m.Nacionalidad.IdNacionalidad_N1 = ddlNacionalidades.SelectedValue;

            m.Especialidad = new Especialidades();
            m.Especialidad.CodEspecialidad_e = ddlEspecialidades.SelectedValue;

            m.CorreoElectronico_M = txtCorreo.Text;

            m.RangoHorario_M = Convert.ToChar(rblHorario.SelectedValue);

            m.User_M = txtNombreUsua.Text;

            m.Password_M = txtContraConfir.Text;

            m.Estado = 1;
        }
        private void CargarProvincias()
        {
            ddlProvincias.DataSource = np.getProvincias();
            ddlProvincias.DataValueField = "codProv_P";
            ddlProvincias.DataTextField = "descripcion_P";
            ddlProvincias.DataBind();
            ddlProvincias.Items.Insert(0, new ListItem("--Seleccione una Provincia--", "0"));
            ddlLocalidades.Items.Insert(0, new ListItem("--Seleccione una Localidad--", "0"));
        }
        private void CargarEspecialidades()
        {
            ddlEspecialidades.DataSource = ne.getEspecialidades();
            ddlEspecialidades.DataValueField = "codEspecialidad_e";
            ddlEspecialidades.DataTextField = "descripcion_e";
            ddlEspecialidades.DataBind();
            ddlEspecialidades.Items.Insert(0, new ListItem("--Seleccione una Especialidad--", "0"));
        }
        private void CargarDias()
        {
            cblDias.DataSource = nd.getDias();
            cblDias.DataValueField = "codDia_d";
            cblDias.DataTextField = "descripcion_d";
            cblDias.DataBind();
        }
        private void cargarNacionalidades()
        {
            ddlNacionalidades.DataSource = nn.getNacionalidades();
            ddlNacionalidades.DataValueField = "IdNacionalidad_N";
            ddlNacionalidades.DataTextField = "Descripcion_N";
            ddlNacionalidades.DataBind();
            ddlNacionalidades.Items.Insert(0, new ListItem("--Seleccione una Nacionalidad--", "0"));
        }
        private void cargarTablaDiasMedicos(Medico med)
        {
            //Para poder dividir los turnos por hora  ME AYUDO CON el 'HORARIO' QUE ELIGÍO EL MEDICO (El Value de Tarde es 'T' y el de Mañana es 'M')
            //ESTA 'T' Y 'M' ES LA QUE TAMBIEN SE ENCUENTRAN EN CADA REGISTRO DE LA TABLA HORARIOS. ENTONCES:
            //ME TRAIGO DE LA TABLA HORARIOS, DIVIDIDA EN DOS:
            //UNA TABLA CON LOS HORARIOS QUE PERTENCEN AL TURNO MAÑANA 'M'

            DataTable TM = nh.getHorarios('M'); //08.00,09.00,10.00...
            //LOS HORARIOS QUE PERTENECEN AL TURNO TARDE 'T
            DataTable TT = nh.getHorarios('T');

            NegocioDiasMedicos ndm = new NegocioDiasMedicos(); //negocio para hacer el insert en tabla DiasMedicos

            //PARA SABER QUE DIAS TRABAJA EL MEDICO AGARRO LOS ITEMS SELECCIONADOS DEL CHECKBOXLISTDIAS.
            foreach (ListItem diaSeleccionado in cblDias.Items)
            {
                if (diaSeleccionado.Selected) //si el dia fue seleccionado..
                {
                    //me fijo en que 'Horario' trabajara el medico
                    if (med.RangoHorario_M == 'M')
                    {
                        //si eligío el turno mañana...
                        //A este medico, en este diaSeleccionado, le voy a generar todas horas que trabajará
                        foreach (DataRow hora in TM.Rows)
                        {
                            ndm.agregarDiaHoraALegajo(med.Legajo_M, diaSeleccionado.Value, hora["codHorario_h"].ToString());
                        }
                    }
                    else //quiere decir que el medico trabjará en turno tarde
                    {
                        //A este medico, en este diaSeleccionado, le voy a generar todas horas que trabajará
                        foreach (DataRow hora in TT.Rows)
                        {
                            ndm.agregarDiaHoraALegajo(med.Legajo_M, diaSeleccionado.Value, hora["codHorario_h"].ToString());
                        }

                    }
                }
            }
        }
        private bool verificarCheckBoxList()
        {
            bool porLoMenosUnDiaSeleccionado = false;
            foreach (ListItem item in cblDias.Items)
            {
                if (item.Selected)
                {
                    porLoMenosUnDiaSeleccionado = true;
                    return porLoMenosUnDiaSeleccionado;
                }
            }
            return porLoMenosUnDiaSeleccionado;
        }
        private void limpiarControles()
        {
            txtDni.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtFechaNacimiento.Text = "";
            rblSexo.SelectedItem.Selected = false;
            ddlNacionalidades.SelectedIndex = 0; 

            txtCorreo.Text = "";
            ddlProvincias.SelectedIndex = 0;
            ddlLocalidades.Items.Clear();
            txtDireccion.Text = "";
            ddlEspecialidades.SelectedIndex = 0;
            rblHorario.SelectedItem.Selected = false;
            foreach (ListItem item in cblDias.Items)
            {
                if (item.Selected) item.Selected = false;
            }
            txtNombreUsua.Text = "";
            txtContra.Text = "";
            txtContraConfir.Text = "";
        }
        private void ShowAlert(string title, string message, string icon)
        {
            string script = "swal.fire({ title: '" + title + "', text: '" + message + "', icon: '" + icon + "' });";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alertScript", script, true);
        }
        protected void btnGenerarTurnos_Click(object sender, EventArgs e)
        {
            //GENERO LOS DIAS Y HORAS QUE VA A TRABAJAR EL MEDICO EN LA CLINICA. ESTOS REGISTROS APARECERAN EN LA TABLA DIASMEDICOS. 
            DataTable tablaDiasMedico = dm.getTodosLosDiasMedicos(); //traigo tabla DiasMedicos
            DataTable tablaFechasJunio = fj.getFechasJunio(); //traigo tabla FechasJunio


            foreach (DataRow registro in tablaDiasMedico.Rows) //Por cada registro de la tabla DiasMedicos, recorro toda la tabla FechasJunio
            {
                DiasMedicos regDM = new DiasMedicos();
                regDM.Legajo_DM = Convert.ToInt32(registro["legajo_DM"]);
                regDM.CodDia_DM = registro["codDia_DM"].ToString();
                regDM.CodHorario_DM = registro["codHorario_DM"].ToString();

                foreach (DataRow fecha in tablaFechasJunio.Rows)
                {
                    FechasJunio regFJ = new FechasJunio();
                    regFJ.CodFecha_F = fecha["codFecha_f"].ToString();
                    regFJ.CodDia_F = fecha["codDia_f"].ToString();

                    if (regDM.CodDia_DM == regFJ.CodDia_F) //Si los codigos de dia coinciden, se genera el turno;
                    {
                        RegistroTurno nuevoTurno = new RegistroTurno();
                        nuevoTurno.Legajo = regDM.Legajo_DM;
                        nuevoTurno.CodDia = regDM.CodDia_DM;
                        nuevoTurno.CodHorario = regDM.CodHorario_DM;
                        nuevoTurno.CodFecha = regFJ.CodFecha_F;

                        //verifico que este medico no tenga ese turno generado en la tabla turnosJunio, de lo contrario se duplicaria.
                        //esto sirve para que solo agregué los turnos de los medicos nuevos. No vuelve a cargar los que ya tienen los turnos generados!!
                        if (!(tj.existeTurno(nuevoTurno)))
                        {
                            tj.agregarTurno(nuevoTurno);
                            ShowAlert("¡Perfecto!", "Turnos generados con exito con éxito!!", "success");
                        }
                    }
                }
            }
        }
    }
}