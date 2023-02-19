using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TekusAppBackend.Entities.Entities
{
    public class TA_Country
    {
        [Key]
        public int Id_Country { get; set; }
        public string? Name_Country { get; set; }
    }
}
