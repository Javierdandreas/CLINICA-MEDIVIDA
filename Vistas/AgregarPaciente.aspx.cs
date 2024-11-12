using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class AgregarPaciente : System.Web.UI.Page
    {
        NegocioNacionalidades nn = new NegocioNacionalidades();
        NegocioLocalidades nl = new NegocioLocalidades();
        NegocioPacientes np = new NegocioPacientes();
        Paciente p = new Paciente();

        NegocioProvincias npr = new NegocioProvincias();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProvincias();
                cargarNacionalidades();
                lblNombre.Text = Application["login"].ToString();
            }
        }


        protected void btnCerrarSesion_Click(object sender, EventArgs e)
        {
            Application["login"] = null;
            Response.Redirect("~/Login.aspx");
        }

        private void CargarProvincias()
        {

            ddlProvincias.DataSource = npr.getProvincias();
            ddlProvincias.DataValueField = "codProv_P";
            ddlProvincias.DataTextField = "descripcion_P";
            ddlProvincias.DataBind();
            ddlProvincias.Items.Insert(0, new ListItem("--Seleccione una Provincia--", "0"));
            ddlLocalidades.Items.Insert(0, new ListItem("--Seleccione una Localidad--", "0"));
        }
        private void cargarNacionalidades()
        {
            ddlNacionalidades.DataSource = nn.getNacionalidades();
            ddlNacionalidades.DataValueField = "IdNacionalidad_N";
            ddlNacionalidades.DataTextField = "Descripcion_N";
            ddlNacionalidades.DataBind();
            ddlNacionalidades.Items.Insert(0, new ListItem("--Seleccione una Nacionalidad--", "0"));
        }

        protected void cargarLocalidades()
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

            p.DNI_Pac = txtDni.Text; //me fijo si el dni existe en registros
            if (!(np.existeDNI(p)))
            {
                CargarPaciente(ref p);
                if (np.addPaciente(p)) lblResultado.Text = "Paciente agregado con éxito";
                limpiarControles();
            }
            else
            {
                lblResultado.Text = "El DNI ya existe en los registros"; return;
            }
        }


        private void CargarPaciente(ref Paciente p)
        {
            p.DNI_Pac = txtDni.Text;
            p.Nombre_Pac = txtNombre.Text;
            p.Apellido_Pac = txtApellido.Text;
            p.Sexo_Pac = Convert.ToChar(rblSexo.SelectedValue);
            p.Nacionalidad = new Nacionalidades();
            p.Nacionalidad.IdNacionalidad_N1 = ddlNacionalidades.SelectedValue;
            p.FechaNacimiento_Pac = txtFechaNacimiento.Text;
            p.Direccion_Pac = txtDireccion.Text;
            p.Localidad = new Localidades();
            p.Localidad.CodLoc_L = ddlLocalidades.SelectedValue;
            p.Provincia = new Provincias();
            p.Provincia.CodProv_P = ddlProvincias.SelectedValue;
            p.CorreoElectronico_Pac = txtCorreo.Text;
            p.telefono_Pac = txtTelefono.Text;
            p.Estado_Pac = 1;
        }

        private void limpiarControles()
        {
            txtDni.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtFechaNacimiento.Text = "";
            txtCorreo.Text = "";
            txtDireccion.Text = "";
            txtTelefono.Text = "";
            rblSexo.SelectedItem.Selected = false;
            ddlNacionalidades.SelectedIndex = 0;
            ddlProvincias.SelectedIndex = 0;
            ddlLocalidades.Items.Clear();
        }

        protected void ddlProvincias_SelectedIndexChanged(object sender, EventArgs e)
        {
            cargarLocalidades();
        }
    }
}