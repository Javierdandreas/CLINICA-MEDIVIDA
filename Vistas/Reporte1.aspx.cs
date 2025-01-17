using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;
using System.Data;
using System.Data.SqlClient;
using Entidades;
using System.Text.RegularExpressions;


namespace Vistas
{
    public partial class Reporte1 : System.Web.UI.Page
    {
        NegocioReportes nr = new NegocioReportes();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!(IsPostBack))
            {
                lblNombre.Text = Application["login"].ToString();
            }
        }

        public string ObtenerDatos()
        {
            SqlConnection con = new SqlConnection("Data Source=localhost\\sqlexpress; Initial Catalog = CLINICA; Integrated Security = True");

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT descripcion_e, Cantidad_e FROM Especialidades";
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            con.Open();

            DataTable dt = new DataTable();
            dt.Load(cmd.ExecuteReader());
            con.Close();

            string strDatos;

            strDatos = "[['Especialidad', 'Cantidad']";

            foreach (DataRow dr in dt.Rows)
            {
                strDatos += $",['{dr[0]}', {dr[1]}]";
            }

            strDatos = strDatos + "]";

            return strDatos;

        }
    }
}