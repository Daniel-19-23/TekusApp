using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TekusAppBackend.Entities.Entities
{
    public class TA_Service
    {
        [Key]
        public int Id_Service { get; set; }
        public string? Name_Service { get; set; }
        public string? HourValue_Service { get; set; }
    }
}
