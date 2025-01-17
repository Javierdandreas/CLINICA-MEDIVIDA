using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dao
{
    public class DaoReportes
    {

        AccesoDatos ad = new AccesoDatos();

        public DataTable ObtenerCantEspecialidades()
        {
            DataTable dt = ad.obtenerTabla("Medicos", "SELECT E.descripcion_e AS Especialidad, COUNT(M.legajo_M) AS CantidadMedicos FROM Especialidades E LEFT JOIN Medicos M ON E.codEspecialidad_e = M.codEspecialidad_M GROUP BY E.descripcion_e;");
            return dt;
        }
    }

}
