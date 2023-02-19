using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TekusAppBackend.Entities.Entities
{
    public class TA_FK_Service_Country
    {
        [Key]
        public int id_Id_fk_Service_Country { get; set; }
        public int fk_Id_Service { get; set; }
        public int fk_Id_Country { get; set; }
    }
}
