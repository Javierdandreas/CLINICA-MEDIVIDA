using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
namespace Dao
{
    public class DaoEspecialidades
    {
        AccesoDatos ad = new AccesoDatos();
        public DataTable obtenerTodasLasEspecialidades()
        {
            DataTable dt = ad.obtenerTabla("Especialidades", "select * from Especialidades order by descripcion_e asc");
            return dt;
        }

        public DataTable obtenerEspecialidad(string descripcion)
        {
            DataTable dt = ad.obtenerTabla("Especialidades", "select * from Especialidades where descripcion_e = '"+ descripcion + "'");
            return dt;
        }

        public DataTable obtenerEspecialidadTurno() {
            DataTable dt = ad.obtenerTabla("Especialidades", "SELECT DISTINCT E.codEspecialidad_e, E.descripcion_e FROM Especialidades E INNER JOIN Medicos M ON    E.codEspecialidad_e = M.codEspecialidad_M WHERE M.codEspecialidad_M IS NOT NULL AND M.Estado_M = 1;");
            return dt;
        }

    }
}
