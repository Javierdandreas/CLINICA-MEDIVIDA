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
    public partial class ListarPacientes : System.Web.UI.Page
    {
        NegocioTurnosJunio tpa = new NegocioTurnosJunio();
        NegocioNacionalidades nn = new NegocioNacionalidades();
        NegocioLocalidades nl = new NegocioLocalidades();
        NegocioProvincias npr = new NegocioProvincias();
        NegocioPacientes np = new NegocioPacientes();
        Nacionalidades na = new Nacionalidades();
        Paciente pa = new Paciente();


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(IsPostBack))
            {
                lblNombre.Text = Application["login"].ToString();
                cargarGrdPacientes();
            }
        }

        public void cargarGrdPacientes()
        {
            grdListadoPacientes.DataSource = np.getPacientesModificar();
            grdListadoPacientes.DataBind();
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Application["login"] = null;
            Response.Redirect("~/Login.aspx");
        }

        protected void grdListadoPacientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string dni = ((Label)grdListadoPacientes.Rows[e.RowIndex].FindControl("lbl_eit_DNI")).Text;
            string nombre = ((TextBox)grdListadoPacientes.Rows[e.RowIndex].FindControl("txt_eit_Nombre")).Text;
            string apellido = ((TextBox)grdListadoPacientes.Rows[e.RowIndex].FindControl("txt_eit_Apellido")).Text;
            string sexo = ((RadioButtonList)grdListadoPacientes.Rows[e.RowIndex].FindControl("rbl_eit_Sexo")).SelectedValue;
            string fechaNacimiento = ((TextBox)grdListadoPacientes.Rows[e.RowIndex].FindControl("txt_eit_FechaNacimiento")).Text;
            string direccion = ((TextBox)grdListadoPacientes.Rows[e.RowIndex].FindControl("txt_eit_Direccion")).Text;
            string codProvincia = ((DropDownList)grdListadoPacientes.Rows[e.RowIndex].FindControl("ddl_eit_Provincias")).SelectedValue;
            string codLocalidad = ((DropDownList)grdListadoPacientes.Rows[e.RowIndex].FindControl("ddl_eit_Localidades")).SelectedValue;
            string idNacionalidad = ((DropDownList)grdListadoPacientes.Rows[e.RowIndex].FindControl("ddl_eit_Nacionalidades")).SelectedValue;
            string email = ((TextBox)grdListadoPacientes.Rows[e.RowIndex].FindControl("txt_eit_Email")).Text;
            string telefono = ((TextBox)grdListadoPacientes.Rows[e.RowIndex].FindControl("txt_eit_Telefono")).Text;


            pa.DNI_Pac = dni;
            pa.Nombre_Pac = nombre;
            pa.Apellido_Pac = apellido;
            pa.Sexo_Pac = Convert.ToChar(sexo);
            pa.FechaNacimiento_Pac = fechaNacimiento;
            pa.Direccion_Pac = direccion;
            pa.Provincia = new Provincias();
            pa.Provincia.CodProv_P = codProvincia;
            pa.Localidad = new Localidades();
            pa.Localidad.CodLoc_L = codLocalidad;
            pa.CorreoElectronico_Pac = email;
            pa.Nacionalidad = new Nacionalidades();
            pa.Nacionalidad.IdNacionalidad_N1 = idNacionalidad;
            pa.telefono_Pac = telefono;

            if (np.updatePaciente(pa))
            {
                ShowAlert("Paciente modificado con éxito!!", "", "success");
            }
            else
            {
                ShowAlert("Error al modificar el paciente", "", "error");
            }
            grdListadoPacientes.EditIndex = -1;
            if (ViewState["RegistroPacienteFiltrado"] != null)
            {
                DataTable dt = np.getPacienteModificar(pa);
                ViewState["RegistroPacienteFiltrado"] = dt;
                cargarGrdConRegistroPacienteFiltrado();
            }
            else cargarGrdPacientes(); //si la actualizacion se hizo sin un ViewState actualiza el grid como siempre


        }

        private void cargarGrdConRegistroPacienteFiltrado()
        {
            grdListadoPacientes.DataSource = (DataTable)ViewState["RegistroPacienteFiltrado"];
            grdListadoPacientes.DataBind();
        }

        protected void grdListadoPacientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Esto es para que aparezca seleccionado El sexo. Traigo el valor que tenia guardado
                    RadioButtonList rblSexo = (RadioButtonList)e.Row.FindControl("rbl_eit_Sexo");
                    if (rblSexo != null)
                    {
                        rblSexo.SelectedValue = DataBinder.Eval(e.Row.DataItem, "Sexo_Pac").ToString();
                    }

                    //Provincia
                    DropDownList ddlProv = (DropDownList)e.Row.FindControl("ddl_eit_Provincias");
                    if (ddlProv != null)
                    {
                        ddlProv.DataSource = npr.getProvincias();
                        ddlProv.DataTextField = "descripcion_P";
                        ddlProv.DataValueField = "codProv_P";
                        ddlProv.DataBind();

                        string codigoProvincia = DataBinder.Eval(e.Row.DataItem, "codProv_Pac").ToString();
                        ddlProv.SelectedValue = codigoProvincia;

                    }

                    //Esto es para que aparezca seleccionada la localidad que esta en el registro de medicos
                    DropDownList ddlLoc = (DropDownList)e.Row.FindControl("ddl_eit_Localidades");
                    if (ddlLoc != null)
                    {
                        string IdProvincia = ddlProv.SelectedValue;
                        ddlLoc.DataSource = nl.getLocalidades(IdProvincia);
                        ddlLoc.DataValueField = "codLoc_L";
                        ddlLoc.DataTextField = "descripcion_L";
                        ddlLoc.DataBind();

                        string codigoLocalidad = DataBinder.Eval(e.Row.DataItem, "codLoc_Pac").ToString();
                        ddlLoc.SelectedValue = codigoLocalidad;
                    }

                    //Nacionalidad
                    DropDownList ddlNac = (DropDownList)e.Row.FindControl("ddl_eit_Nacionalidades");
                    if (ddlNac != null)
                    {
                        ddlNac.DataSource = nn.getNacionalidades();
                        ddlNac.DataTextField = "descripcion_N";
                        ddlNac.DataValueField = "IdNacionalidad_N";
                        ddlNac.DataBind();

                        string codigoNacionalidad = DataBinder.Eval(e.Row.DataItem, "IdNacionalidad_Pac").ToString();
                        ddlNac.SelectedValue = codigoNacionalidad;
                    }

                }
            }
        }

        protected void grdListadoPacientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdListadoPacientes.EditIndex = -1;
            cargarGrdPacientes();
        }

        protected void grdListadoPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdListadoPacientes.PageIndex = e.NewPageIndex;
            cargarGrdPacientes();
        }

        private void ShowAlert(string title, string message, string icon)
        {
            string script = "swal.fire({ title: '" + title + "', text: '" + message + "', icon: '" + icon + "' });";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alertScript", script, true);
        }

        protected void grdListadoPacientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdListadoPacientes.EditIndex = e.NewEditIndex;
            cargarGrdPacientes();
        }

        protected void grdListadoPacientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Paciente p = new Paciente();
            string dni = ((Label)grdListadoPacientes.Rows[e.RowIndex].FindControl("lbl_it_DNI")).Text;
            p.DNI_Pac = dni;

            if (np.existeDNI(p))
            {
                if ((np.bajaLogicaPaciente(dni) && tpa.bajaLogicaPacienteTurnosJunio(dni)) ||
                    np.bajaLogicaPaciente(dni))
                    {
                    ShowAlert("El paciente con DNI " + dni + " fue dado de baja", "", "success");
                    }
                else
                {
                }
            }
            cargarGrdPacientes();
        }
    }

}