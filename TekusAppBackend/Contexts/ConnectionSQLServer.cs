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
    }
}
