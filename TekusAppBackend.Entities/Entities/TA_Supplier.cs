using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TekusAppBackend.Entities.Entities
{
    public class TA_Supplier
    {
        [Key]
        public int Id_Supplier { get; set; }
        public string? Nit_Supplier { get; set; }
        public string? Name_Supplier { get; set; }
        public string? Email_Supplier { get; set; }
    }
}
