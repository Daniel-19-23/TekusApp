using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TekusAppBackend.Entities.Entities;

namespace TekusAppBackend.Entities.Business
{
    public class SupplierWrapper
    {
        public int Id_Supplier { get; set; }
        public string Name_Supplier { get; set; }
        public List<TA_Service> Services { get; set; }
        public List<TA_Country> Countries { get; set; }
    }
}
