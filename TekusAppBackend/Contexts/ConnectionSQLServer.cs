using TekusAppBackend.Entities.Entities;
using Microsoft.EntityFrameworkCore;

namespace TekusAppBackend.Contexts
{
    public class ConnectionSQLServer:DbContext
    {
        // Conecto mi base de datos y tablas correspondientes
        public ConnectionSQLServer(DbContextOptions<ConnectionSQLServer> options) : base(options) { }
        public DbSet<TA_Service> TA_Services { get; set; } // Servicion
        public DbSet<TA_Supplier> TA_Suppliers { get; set; } // proveedor
        public DbSet<TA_User> TA_Users { get; set; } // Usuarios
        public DbSet<TA_Country> TA_Countries { get; set; } // Pais
        public DbSet<TA_FK_Supplier_Service> TA_FK_Supplier_Service { get; set; } // Proveedor con servicio
        public DbSet<TA_FK_Supplier_Country> TA_FK_Supplier_Country { get; set; } // Proveedor con ciudad
        public DbSet<TA_FK_Service_Country> TA_FK_Service_Country { get; set; } // Servicio con ciudad
    }
}
