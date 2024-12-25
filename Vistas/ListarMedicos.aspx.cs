using Entidades;
using Negocio;
using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class ListarMedicos : System.Web.UI.Page
    {
        NegocioNacionalidades nn = new NegocioNacionalidades();
        NegocioEspecialidades ne = new NegocioEspecialidades();
        NegocioTurnosJunio ntj = new NegocioTurnosJunio();
        NegocioDiasMedicos ndm = new NegocioDiasMedicos();
        NegocioFechasJunio nfj = new NegocioFechasJunio();
        NegocioLocalidades nl = new NegocioLocalidades();
        NegocioProvincias np = new NegocioProvincias();
        NegocioHorarios nh = new NegocioHorarios();
        NegocioMedicos nm = new NegocioMedicos();
        Nacionalidades na = new Nacionalidades();
        Especialidades es = new Especialidades();
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
            grdListadoMed.DataSource = nm.getMedicosModificar();
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

            string legajo = ((Label)grdListadoMed.Rows[e.RowIndex].FindControl("lbl_eit_legajo")).Text;
            string dni = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_dni")).Text;
            string nombre = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_nombre")).Text;
            string apellido = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_apellido")).Text;
            string sexo = ((RadioButtonList)grdListadoMed.Rows[e.RowIndex].FindControl("rbl_eit_Sexo")).SelectedValue;
            string fechaNacimiento = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_fechaNacimiento")).Text;
            string direccion = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_direccion")).Text;
            string codProvincia = ((DropDownList)grdListadoMed.Rows[e.RowIndex].FindControl("ddl_eit_provincia")).SelectedValue;
            string codLocalidad = ((DropDownList)grdListadoMed.Rows[e.RowIndex].FindControl("ddl_eit_localidad")).SelectedValue;
            string email = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_correo")).Text;
            string rangoHorario = ((Label)grdListadoMed.Rows[e.RowIndex].FindControl("lbl_eit_Horario")).Text;
            string usuario = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_usuario")).Text;
            string contraseña = ((TextBox)grdListadoMed.Rows[e.RowIndex].FindControl("txt_eit_contraseña")).Text;
            string idNacionalidad = ((DropDownList)grdListadoMed.Rows[e.RowIndex].FindControl("ddl_eit_nacionalidad")).SelectedValue;
            string codEspec = ((DropDownList)grdListadoMed.Rows[e.RowIndex].FindControl("ddl_eit_especialidad")).SelectedValue;
            



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
            med.Especialidad.CodEspecialidad_e = codEspec;
            med.Nacionalidad = new Nacionalidades();
            med.Nacionalidad.IdNacionalidad_N1 = idNacionalidad;
            med.RangoHorario_M = Convert.ToChar(rangoHorario);
            med.User_M = usuario;
            med.Password_M = contraseña;
            med.Estado = 1;


            //Me traigo los datos que tenia el medico antes de que este edit sea cargado en la db       
            DataTable registroMedico = nm.filtrarMedicoPorLegajo(med);
            DataRow registro = registroMedico.Rows[0];


            //Me fijo cual era el nombre de User del medico antes del Edit (xq no puede repetirse el user):
            //si el nombre de user es modificado, me fije que no exista en otro registro. Pero si el user es igual al que ya tenia el registro sigo de largo
            if (registro[11].ToString() != med.User_M)
            {
                if (nm.existeUser(med))
                {
                    ShowAlert("El nombre de usuario ya esta en uso!!", "", "warning");
                    return;
                }
            }

            //Si el DNI que estabá en el registro de la db es igual al que está en el textbox del formulario
            //quiere decir que no lo cambío y permito que el mismo dni sea ingresado.
            if (registro[1].ToString() == med.Dni_m)
            {
                nm.updateMedico(med);
            }
            else
            {
                //si el DNI se modificó, me fijo que ya no exista en otro registro
                if (!(nm.existeDNI(med)))
                {
                    nm.updateMedico(med);
                }
                else
                {
                    ShowAlert("Este DNI esta en uso!!", "", "warning");
                    return;
                }
            }

            ShowAlert("Medico modificado con exito!!", "", "success");
            grdListadoMed.EditIndex = -1;

            if (ViewState["RegistroMedicoFiltrado"] != null)
            {
                DataTable dt = nm.getMedicoModificarPorLegajo(med); //traigo el registro que acabo de modificar
                ViewState["RegistroMedicoFiltrado"] = dt;
                grdListadoMed.DataSource = ViewState["RegistroMedicoFiltrado"];
                grdListadoMed.DataBind();
            }
            else cargarTablaMedicos();

        }

        public void checkeoDarDeBaja(String rbEstado, String BDEstado, String legajo)
        {
            NegocioTurnosJunio tj = new NegocioTurnosJunio();
            NegocioDiasMedicos dm = new NegocioDiasMedicos();

            if (rbEstado == "0" && BDEstado != "0")
            {
                Application["legajo"] = legajo;
                Response.Redirect("~/Admin/ABML Medicos/DarBajaMedico.aspx");
            }
            else if (rbEstado == "1" && BDEstado == "0")
            {
                tj.cambiarEstadoAactivoTJ(Convert.ToInt32(legajo));
                dm.cambiarEstadoAactivoDM(Convert.ToInt32(legajo));
            }
        }

        protected void grdListadoMed_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdListadoMed.PageIndex = e.NewPageIndex;
            cargarTablaMedicos();
        }

        protected void grdListadoMed_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string leg = ((Label)grdListadoMed.Rows[e.RowIndex].FindControl("lbl_it_legajo")).Text;
            int legajo = Convert.ToInt32(leg);
            med.Legajo_M = legajo;

            if (nm.existeLegajo(med))
            {
                if ((ntj.bajaLogicaTurnosJunio(legajo) && ndm.bajaLogicaDiasMedicos(legajo) && nm.bajaLogica(legajo))
                    || (ndm.bajaLogicaDiasMedicos(legajo) && nm.bajaLogica(legajo)))
                {
                    ShowAlert("El médico con legajo " + legajo + " fue dado de baja.", "", "Success");
                }
                else
                {
                }
            }
            cargarTablaMedicos();
        }

        private void ShowAlert(string title, string message, string icon)
        {
            string script = "swal.fire({ " + "title: '" + title + "', text: '" + message + "', icon: '" + icon + "' " +
                "});";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alertScript", script, true);
        }

        protected void grdListadoMed_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    //Esto es para que aparezca seleccionado El sexo. Traigo el valor que tenia guardado
                    RadioButtonList rblSexo = (RadioButtonList)e.Row.FindControl("rbl_eit_Sexo");
                    if (rblSexo != null)
                    {
                        rblSexo.SelectedValue = DataBinder.Eval(e.Row.DataItem, "Sexo_M").ToString();
                    }

                    //Provincia
                    DropDownList ddlProv = (DropDownList)e.Row.FindControl("ddl_eit_provincia");
                    if (ddlProv != null)
                    {
                        ddlProv.DataSource = np.getProvincias();
                        ddlProv.DataTextField = "descripcion_P";
                        ddlProv.DataValueField = "codProv_P";
                        ddlProv.DataBind();

                        string codigoProvincia = DataBinder.Eval(e.Row.DataItem, "codProv_M").ToString();
                        ddlProv.SelectedValue = codigoProvincia;

                    }

                    //Esto es para que aparezca seleccionada la localidad que esta en el registro de medicos
                    DropDownList ddlLoc = (DropDownList)e.Row.FindControl("ddl_eit_localidad");
                    if (ddlLoc != null)
                    {
                        string IdProvincia = ddlProv.SelectedValue;
                        ddlLoc.DataSource = nl.getLocalidades(IdProvincia);
                        ddlLoc.DataValueField = "codLoc_L";
                        ddlLoc.DataTextField = "descripcion_L";
                        ddlLoc.DataBind();

                        string codigoLocalidad = DataBinder.Eval(e.Row.DataItem, "codLoc_M").ToString();
                        ddlLoc.SelectedValue = codigoLocalidad;
                    }

                    //Nacionalidad
                    DropDownList ddlNac = (DropDownList)e.Row.FindControl("ddl_eit_nacionalidad");
                    if (ddlNac != null)
                    {
                        ddlNac.DataSource = nn.getNacionalidades();
                        ddlNac.DataTextField = "descripcion_N";
                        ddlNac.DataValueField = "IdNacionalidad_N";
                        ddlNac.DataBind();

                        string codigoNacionalidad = DataBinder.Eval(e.Row.DataItem, "IdNacionalidad_M").ToString();
                        ddlNac.SelectedValue = codigoNacionalidad;
                    }

                    DropDownList ddlEsp = (DropDownList)e.Row.FindControl("ddl_eit_especialidad");
                    if (ddlEsp != null)
                    {
                        ddlEsp.DataSource = ne.getEspecialidades();
                        ddlEsp.DataTextField = "descripcion_e";
                        ddlEsp.DataValueField = "codEspecialidad_e";
                        ddlEsp.DataBind();

                        string codEspecialidad = DataBinder.Eval(e.Row.DataItem, "codEspecialidad_M").ToString();
                        ddlEsp.SelectedValue = codEspecialidad;
                    }

                    //Esto es para que aparezca seleccionado el Estado. Traigo el valor que tenia guardado
                    RadioButtonList rblEstado = (RadioButtonList)e.Row.FindControl("rbl_eit_Estado");
                    if (rblEstado != null)
                    {
                        rblEstado.SelectedValue = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Estado_M")).ToString();
                    }

                }
            }
        }

        protected void ddl_eit_provincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlProv = (DropDownList)sender;
            GridViewRow row = (GridViewRow)ddlProv.NamingContainer;
            DropDownList ddlLoc = (DropDownList)row.FindControl("ddl_eit_localidad");

            if (ddlLoc != null)
            {
                string IdProvincia = ddlProv.SelectedValue;
                NegocioLocalidades neg = new NegocioLocalidades();
                ddlLoc.DataSource = neg.getLocalidades(IdProvincia);
                ddlLoc.DataValueField = "codLoc_L";
                ddlLoc.DataTextField = "descripcion_L";
                ddlLoc.DataBind();
            }
        }
    }
}