using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dao;

namespace Negocio
{
    public class NegocioReportes
    {
        DaoReportes dao = new DaoReportes();

        public DataTable ObtenerCantEspecialidades()
        {
            return dao.ObtenerCantEspecialidades();
        }
    }

}

