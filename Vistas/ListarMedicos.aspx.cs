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
    public partial class ListarMedicos : System.Web.UI.Page
    {
        NegocioNacionalidades nn = new NegocioNacionalidades();
        NegocioEspecialidades ne = new NegocioEspecialidades();
        NegocioLocalidades nl = new NegocioLocalidades();
        NegocioProvincias np = new NegocioProvincias();
        NegocioHorarios nh = new NegocioHorarios();
        NegocioMedicos nm = new NegocioMedicos();
        Nacionalidades na = new Nacionalidades();
        Medico med = new Medico();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(IsPostBack))
            {
                lblNombre.Text = Application["login"].ToString();
                cargarTablaMedicos();
            }
        }

        public void cargarTablaMedicos()
        {
            NegocioMedicos neg = new NegocioMedicos();
            grdListadoMed.DataSource = neg.getMedicosModificar();
            grdListadoMed.DataBind();
        }

        protected void grdListadoMed_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdListadoMed.EditIndex = e.NewEditIndex;
            cargarTablaMedicos();
        }

        protected void grdListadoMed_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdListadoMed.EditIndex = -1;
            cargarTablaMedicos();
        }

        protected void grdListadoMed_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            /*
            string legajo = ((Label)grdListadoMed.Rows[e.RowIndex].FindControl("lbl_eit_legajo")).Text;
            string dni = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_dni")).Text;
            string nombre = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_nombre")).Text;
            string apellido = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_apellido")).Text;
            string sexo = ((DropDownList)grdListadoMed.Rows[e.RowIndex].FindControl("ddl_eit_Sexo")).SelectedValue;
            string fechaNacimiento = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_fechaNacimiento")).Text;
            string direccion = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_direccion")).Text;
            string codProvincia = ((DropDownList)grdListadoMed.Rows[e.RowIndex].FindControl("ddl_eit_provincia")).SelectedValue;
            string codLocalidad = ((DropDownList)grdListadoMed.Rows[e.RowIndex].FindControl("ddl_eit_localidad")).SelectedValue;
            string email = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_Email")).Text;
            string rangoHorario = ((Label)grdListadoMed.Rows[e.RowIndex].FindControl("lbl_eit_Horario")).Text;
            string usuario = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_usuario")).Text;
            string contraseña = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_contraseña")).Text;
            string idNacionalidad = ((DropDownList)grdListadoMed.Rows[e.RowIndex].FindControl("ddl_eit_nacionalidad")).SelectedValue;
            especialidad.Descripcion_e = ((Label)grdListadoMed.Rows[e.RowIndex].FindControl("lbl_eit_Especialidad")).Text;
            DataTable registroEspe = ne.getEspecialidad(especialidad.Descripcion_e);
            DataRow filaEspe = registroEspe.Rows[0];
            especialidad.CodEspecialidad_e = filaEspe[0].ToString();

            med.Legajo_M = Convert.ToInt32(legajo);
            med.Dni_m = dni;
            med.Nombre_M = nombre;
            med.Apellido_M = apellido;
            med.Sexo_M = Convert.ToChar(sexo);
            med.FechaNacimiento_M = fechaNacimiento;
            med.Direccion_M = direccion;
            med.Localidad = new Localidades();
            med.Localidad.CodLoc_L = codLocalidad;
            med.Provincia = new Provincias();
            med.Provincia.CodProv_P = codProvincia;
            med.CorreoElectronico_M = email;
            med.Especialidad = new Especialidades();
            med.Especialidad.CodEspecialidad_e = especialidad.CodEspecialidad_e;
            med.Nacionalidad = new Nacionalidades();
            med.Nacionalidad.IdNacionalidad_N1 = idNacionalidad;
            med.RangoHorario_M = Convert.ToChar(rangoHorario);
            med.User_M = usuario;
            med.Password_M = contraseña;


            //Me traigo los datos que tenia el medico antes de que este edit sea cargado en la db       
            DataTable registroMedico = neg.filtrarMedicoPorLegajo(m);
            DataRow registro = registroMedico.Rows[0];

            string rbEstado = ((RadioButtonList)grdListadoMed.Rows[e.RowIndex].FindControl("rbl_eit_Estado")).SelectedValue;


            //Me fijo cual era el nombre de User del medico antes del Edit (xq no puede repetirse el user):
            //si el nombre de user es modificado, me fije que no exista en otro registro. Pero si el user es igual al que ya tenia el registro sigo de largo
            if (registro[11].ToString() != med.User_M)
            {
                if (neg.existeUser(med)) { lblNotificacion.Text = "El nombre de Usuario ya existe en los registros"; return; };
            }

            //Si el DNI que estabá en el registro de la db es igual al que está en el textbox del formulario
            //quiere decir que no lo cambío y permito que el mismo dni sea ingresado.
            if (registro[1].ToString() == m.Dni_m)
            {
                checkeoDarDeBaja(rbEstado, registro[14].ToString(), legajo);
                neg.updateMedico(med);
            }
            else
            {
                //si el DNI se modificó, me fijo que ya no exista en otro registro
                if (!(neg.existeDNI(med)))
                {
                    checkeoDarDeBaja(rbEstado, registro[14].ToString(), legajo);
                    neg.updateMedico(med);
                }
                else
                {
                    lblNotificacion.Text = "El número de DNI ya existe en los registros";
                    return;
                }
            }

            lblNotificacion.Text = "Medico Modificado con éxito";
            grdListadoMed.EditIndex = -1;

            if (ViewState["RegistroMedicoFiltrado"] != null)
            {
                DataTable dt = neg.getMedicoModificarPorLegajo(m); //traigo el registro que acabo de modificar
                ViewState["RegistroMedicoFiltrado"] = dt;
                grdListadoMed.DataSource = ViewState["RegistroMedicoFiltrado"];
                grdListadoMed.DataBind();
            }
            else cargarTablaMedicos();
            */
        }

        protected void grdListadoMed_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdListadoMed.PageIndex = e.NewPageIndex;
            cargarTablaMedicos();
        }
    }
}