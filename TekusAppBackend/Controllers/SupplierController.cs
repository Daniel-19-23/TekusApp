using TekusAppBackend.Entities.Entities;
using TekusAppBackend.Entities.Business;
using Microsoft.AspNetCore.Mvc;
using TekusAppBackend.Contexts;
using Microsoft.EntityFrameworkCore;

namespace TekusAppBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class SupplierController : ControllerBase
    {
        private readonly ConnectionSQLServer _context;

        public SupplierController(ConnectionSQLServer context)
        {
            _context = context;
        }

        //GET: api/<SupplierController>
        [HttpGet("GetAllSupplier")]
        public async Task<ActionResult<IEnumerable<TA_Supplier>>> GetAllSupplier()
        {
            var repoSupplier = _context.TA_Suppliers;

            return await repoSupplier.ToListAsync();
        }

        // GET api/<SupplierController>/5
        [HttpGet("GetSupplier/{id}")]
        public async Task<ActionResult<TA_Supplier>> GetSupplier(int id)
        {
            var repoSupplier = _context.TA_Suppliers;

            var supplier = await repoSupplier.FindAsync(id);

            if (supplier == null)
            {
                return NotFound();
            }

            return supplier;
        }

        [HttpGet("GetSupplierActiveInServicesAndCountry/{id}")]
        public async Task<ActionResult<SupplierWrapper>> GetSupplierActiveInServicesAndCountry(int id)
        {
            // Repositorios
            var repoSupplier = _context.TA_Suppliers;
            var repoService = _context.TA_Services;
            var repoCountry = _context.TA_Countries;

            // Tablas secundarias
            var repoSupplierAndService = _context.TA_FK_Supplier_Service;
            var repoSupplierAndCountry = _context.TA_FK_Supplier_Country;

            // Validación si existe
            var supplier = await repoSupplier.FindAsync(id);
            if (supplier == null)
            {
                return NotFound();
            }

            // Creo un nuevo objeto
            var supplierWrapper = new SupplierWrapper();
            var listService = new List<TA_Service>();
            var listCountry = new List<TA_Country>();

            // Agrego ID y nombre
            supplierWrapper.Id_Supplier = supplier.Id_Supplier;
            supplierWrapper.Name_Supplier = supplier.Name_Supplier;

            // Filtro los servicios y ciudades que tiene el proveedor activos
            var idServices = repoSupplierAndService.Where(s => s.fk_Id_Supplier == id).ToList();
            var idCountries = repoSupplierAndCountry.Where(s => s.fk_Id_Supplier == id).ToList();

            // Listo los servicio disponibles
            for (int i = 0; i < idServices.Count; i++)
            {
                var service = new TA_Service();

                service = await repoService.FindAsync(idServices[i].fk_Id_Service);

                listService.Add(service);
            }

            // Listo los paises disponibles
            for (int i = 0; i < idCountries.Count; i++)
            {
                var country = new TA_Country();

                country = await repoCountry.FindAsync(idCountries[i].fk_Id_Country);

                listCountry.Add(country);
            }

            // Agrego los listados al Wrapper
            supplierWrapper.Services = listService;
            supplierWrapper.Countries = listCountry;

            return supplierWrapper;
        }


        // POST api/<SupplierController>
        [HttpPost("SaveSupplier")]
        public async Task<IActionResult> SaveSupplier([FromBody] TA_Supplier supplier)
        {
            var repoSupplier = _context.TA_Suppliers;

            if (supplier == null)
            {
                return BadRequest();
            }

            // Agrego y guardo el proveedor
            repoSupplier.Add(supplier);
            await _context.SaveChangesAsync();

            return CreatedAtRoute("GetById", new { id = supplier.Id_Supplier }, supplier);
        }

        // PUT api/<SupplierController>/5
        [HttpPut("UpdateSupplier/{id}")]
        public async Task<IActionResult> UpdateSupplier(int id, [FromBody] TA_Supplier supplier)
        {
            var repoSupplier = _context.TA_Suppliers;

            supplier.Id_Supplier = id;

            if (supplier == null || id != supplier.Id_Supplier)
            {
                return BadRequest();
            }

            // Compruebo si el Proveedor existe
            var existingSupplier = await repoSupplier.FindAsync(id);
            if (existingSupplier == null)
            {
                return NotFound();
            }

            // Remplazo la informació
            existingSupplier.Nit_Supplier = supplier.Nit_Supplier;
            existingSupplier.Name_Supplier = supplier.Name_Supplier;
            existingSupplier.Email_Supplier = supplier.Email_Supplier;

            // Actualizo el usuario
            repoSupplier.Update(existingSupplier);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        // DELETE api/<SupplierController>/5
        [HttpDelete("DeleteSupplier/{id}")]
        public async Task<IActionResult> DeleteSupplier(int id)
        {
            var repoSupplier = _context.TA_Suppliers;

            // Valido si el usuario existe
            var supplier = await repoSupplier.FindAsync(id);
            if (supplier == null)
            {
                return NotFound();
            }

            // Elimino el usuario
            repoSupplier.Remove(supplier);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
