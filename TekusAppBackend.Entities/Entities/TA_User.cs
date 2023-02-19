﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TekusAppBackend.Entities.Entities
{
    public class TA_User
    {
        [Key]
        public int Id_User { get; set; }
        public string? Name_User { get; set; }
        public string? Email_User { get; set; }
        public string? Password_User { get; set; }
    }
}
