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
    public partial class TurnosMed : System.Web.UI.Page
    {
        NegocioTurnosJunio neg = new NegocioTurnosJunio();
        NegocioDiasMedicos ndm = new NegocioDiasMedicos();
        RegistroTurno reg = new RegistroTurno();
        DataTable dt = new DataTable();
        Medico med = new Medico();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblNombre.Text = Application["login"].ToString();
                cargarGrdVerTurnos();
                cargarDdlFiltrosDia();
            }

        }

        public void cargarGrdVerTurnos()
        {
            string legajo = Application["legajo"].ToString();
            med.Legajo_M = Convert.ToInt32(legajo);
            grdTurnosMed.DataSource = neg.traerTurnosJunioPorLegajo(med);
            grdTurnosMed.DataBind();
        }

        public void cargarDdlFiltrosDia()
        {//Carga el ddl con los dias que trabaja el médico que se encuentra utilizando el sistema

            med.Legajo_M = Convert.ToInt32(Application["legajo"]);
            ddlFiltrosDia.DataSource = ndm.getDiasMedico(med);
            ddlFiltrosDia.DataTextField = "Dia";
            ddlFiltrosDia.DataValueField = "CodigoDia";
            ddlFiltrosDia.DataBind();
            ddlFiltrosDia.Items.Insert(0, new ListItem("--Seleccionar--", "0"));
        }

        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Application["login"] = null;
            Application["legajo"] = null;
            Response.Redirect("~/Login.aspx");
        }

        protected void grdVerTurnos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdTurnosMed.EditIndex = e.NewEditIndex;

            if (ViewState["RegistroFiltrado"] != null)
            {
                grdTurnosMed.DataSource = (DataTable)ViewState["RegistroFiltrado"];
                grdTurnosMed.DataBind();
            }
            else
            {
                cargarGrdVerTurnos();
            }
        }

        protected void grdVerTurnos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdTurnosMed.EditIndex = -1;
            if (ViewState["RegistroFiltrado"] != null)
            {
                grdTurnosMed.DataSource = (DataTable)ViewState["RegistroFiltrado"];
                grdTurnosMed.DataBind();
            }
            else
            {
                cargarGrdVerTurnos();
            }
        }

        protected void grdVerTurnos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            if (((Label)grdTurnosMed.Rows[e.RowIndex].FindControl("lbl_it_Disponibilidad")).Text == "Disponible")
            {
                ShowAlert("Cuidado!", "No se puede editar un turno no asignado. Presione Cancelar", "error");
                e.Cancel = true;
                return;
            }
            int asistio = Convert.ToInt32(((RadioButtonList)grdTurnosMed.Rows[e.RowIndex].FindControl("rbl_eit_Asistio")).SelectedValue);
            string observacion = "Paciente no asistió";
            int nroTurno = Convert.ToInt32(((Label)grdTurnosMed.Rows[e.RowIndex].FindControl("lbl_eit_Turno")).Text);
            if (asistio == 1)
            {
                observacion = ((TextBox)grdTurnosMed.Rows[e.RowIndex].FindControl("txt_eit_Observacion")).Text;
            }

            reg.Id_Turno = nroTurno;
            reg.Asistio = asistio;
            reg.Observacion = observacion;
            if (neg.AsistenciaPaciente(reg)) ShowAlert("Perfecto!!", "Turno actualizado con exito!", "success");
            grdTurnosMed.EditIndex = -1;
            if (ViewState["RegistroFiltrado"] != null)
            {
                grdTurnosMed.DataSource = (DataTable)ViewState["RegistroFiltrado"];
                grdTurnosMed.DataBind();
            }

            LimpiarFiltros();
        }

        protected void grdVerTurnos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //Radio button marcado con lo que tenga el registro en la BD
                RadioButtonList rblAsistio = (RadioButtonList)e.Row.FindControl("rbl_eit_Asistio");
                TextBox observacion = (TextBox)e.Row.FindControl("txt_eit_Observacion");
                if (rblAsistio != null)
                {
                    if (Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Disponibilidad")) == 0) //Turno tomado
                    {
                        if (!(DataBinder.Eval(e.Row.DataItem, "Asistio") is DBNull)) //si el campo 'Asistio' no está nulo en la DB es porque algo ya le cargó el medico
                        //traigo lo que el medico cargó en el campo 'Asistio' y se lo mando al RadioButton
                        {
                            rblAsistio.SelectedValue = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "Asistio")).ToString();
                        }
                        else
                        {
                            //si el campo 'Asistio' estaba null, le pongo por defecto 'No'
                            rblAsistio.SelectedValue = "0";
                        }

                        observacion.Text = DataBinder.Eval(e.Row.DataItem, "Observacion").ToString();
                    }
                    else //el turno no está tomado. En el RowUpdating no va a permitir la carga.
                    {
                        ShowAlert("Cuidado!!", "No se puede editar un turno no asignado", "warning");
                        grdTurnosMed.EditIndex = -1;
                        return;
                    }
                }
            }
        }

        protected void btnFiltrarTurnos_Click(object sender, EventArgs e)
        {
            if(txt_num_turno.Text == "")
            {
                ShowAlert("No te olvides de ingresar el número de turno", "", "error");
            }
            else
            {
                med.Legajo_M = Convert.ToInt32(Application["legajo"]);
                reg.Id_Turno = Convert.ToInt32(txt_num_turno.Text);
                DataTable dt = neg.traerTurnosJunioPorSuNumero(med, reg);
                grdTurnosMed.DataSource = dt;
                grdTurnosMed.DataBind();
                txt_num_turno.Text = "";
                ViewState["RegistroFiltrado"] = dt; //El ViewState funciona como una session pero a nivel local del formulario
                ddlFiltrosDia.SelectedIndex = 0;
            }
            if (ViewState["RegistroFiltrado"] != dt)
            {
                ShowAlert("El Número de turno " + txt_num_turno.Text + " no existe", "", "error");
                cargarGrdVerTurnos();
            }

        }

        protected void btnTodosTurnos_Click(object sender, EventArgs e)
        {
            LimpiarFiltros();
            cargarGrdVerTurnos();
        }

        protected void ddlFiltrosDia_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlFiltrosDia.SelectedValue != "---Seleccionar---")
            {
                string dia = ddlFiltrosDia.SelectedValue.ToString();

                med.Legajo_M = Convert.ToInt32(Application["legajo"]);
                reg.CodDia = dia;
                DataTable dt = neg.traerTurnosJunioPorDia(med, reg);
                grdTurnosMed.DataSource = dt;
                grdTurnosMed.DataBind();
                ViewState["RegistroFiltrado"] = dt;
            }
            else
            {   //La opción ---Seleccionar--- por defecto volvería a cargar el gridview
                cargarGrdVerTurnos();
            }
        }

        public void LimpiarFiltros()
        {
            ViewState["RegistroFiltrado"] = null;
            cargarGrdVerTurnos();
            ddlFiltrosDia.SelectedIndex= 0;
            txt_num_turno.Text = "";
        }

        protected void btnTurnosActivos_Click1(object sender, EventArgs e)
        {
            med.Legajo_M = Convert.ToInt32(Application["legajo"]);
            if (ddlFiltrosDia.SelectedIndex == 0) //NO tiene ningún día seleccionado la DDL 
            {
                dt = neg.traerTurnosJunioNoDisponibles(med);
                grdTurnosMed.DataSource = dt;
                grdTurnosMed.DataBind();
            }
            else //SI tiene seleccionado un día la DDL
            {

                string dia = ddlFiltrosDia.SelectedValue.ToString();
                reg.CodDia = dia;
                dt = neg.traerTurnosJunioNoDisponiblesPorDia(med, reg);
                grdTurnosMed.DataSource = dt;
                grdTurnosMed.DataBind();
            }
            ViewState["RegistroFiltrado"] = dt;

        }

        private void ShowAlert(string title, string message, string icon)
        {
            string script = "swal.fire({ title: '" + title + "', html: '" + message + "', icon: '" + icon + "' });";
            ScriptManager.RegisterStartupScript(this, typeof(Page), "alertScript", script, true);
        }

        protected void grdTurnosMed_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdTurnosMed.PageIndex = e.NewPageIndex;
            if (ddlFiltrosDia.SelectedIndex > 0)
            {
                string dia = ddlFiltrosDia.SelectedValue.ToString();

                med.Legajo_M = Convert.ToInt32(Application["legajo"]);
                reg.CodDia = dia;
                DataTable dt = neg.traerTurnosJunioPorDia(med, reg);
                grdTurnosMed.DataSource = dt;
                grdTurnosMed.DataBind();
                ViewState["RegistroFiltrado"] = dt;
            }
            else
            {   //La opción ---Seleccionar--- por defecto volvería a cargar el gridview
                cargarGrdVerTurnos();
            }
        }
    }
}