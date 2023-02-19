using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TekusAppBackend.Entities.Entities
{
    public class TA_FK_Supplier_Country
    {
        [Key]
        public int Id_fk_Supplier_Country { get; set; }
        public int fk_Id_Supplier { get; set; }
        public int fk_Id_Country { get; set; }
    }
}
