using TekusAppBackend.Entities.Entities;
using Microsoft.AspNetCore.Mvc;
using TekusAppBackend.Contexts;
using Microsoft.EntityFrameworkCore;
using System.Globalization;

namespace TekusAppBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ServiceController : ControllerBase
    {
        private readonly ConnectionSQLServer _context;

        public ServiceController(ConnectionSQLServer context)
        {
            _context = context;
        }

        // GET: api/<ServiceController>
        [HttpGet("GetAllService")]
        public async Task<ActionResult<IEnumerable<TA_Service>>> GetAllService()
        {
            var repoService = _context.TA_Services;

            var service = new List<TA_Service>();

            service = await repoService.ToListAsync();

            for (int i = 0; i < service.Count; i++)
            {
                service[i].HourValue_Service = ConvertToUSD(service[i].HourValue_Service);
            }

            return service;
        }

        // GET api/<ServiceController>/5
        [HttpGet("GetService/{id}")]
        public async Task<ActionResult<TA_Service>> GetService(int id)
        {
            var repoService = _context.TA_Services;

            var service = await repoService.FindAsync(id);

            if (service == null)
            {
                return NotFound();
            }

            service.HourValue_Service = ConvertToUSD(service.HourValue_Service);

            return service;
        }

        // POST api/<ServiceController>
        [HttpPost("SaveService")]
        public async Task<IActionResult> SaveService([FromBody] TA_Service service)
        {
            var repoService = _context.TA_Services;

            if (service == null)
            {
                return BadRequest();
            }

            repoService.Add(service);
            await _context.SaveChangesAsync();

            return CreatedAtRoute("GetById", new { id = service.Id_Service }, service);
        }

        // PUT api/<ServiceController>/5
        [HttpPut("UpdateUser/{id}")]
        public async Task<IActionResult> UpdateUser(int id, [FromBody] TA_Service service)
        {
            var repoService = _context.TA_Services;

            service.Id_Service = id;

            if (service == null || id != service.Id_Service)
            {
                return BadRequest();
            }

            // Compruebo si el servicio existe
            var existingService = await repoService.FindAsync(id);
            if (existingService == null)
            {
                return NotFound();
            }

            // Remplazo la informació
            existingService.Name_Service = service.Name_Service;
            existingService.HourValue_Service = service.HourValue_Service;

            // Actualizo el servicio
            repoService.Update(existingService);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        // DELETE api/<ServiceController>/5
        [HttpDelete("DeleteService/{id}")]
        public async Task<IActionResult> DeleteService(int id)
        {
            var repoService = _context.TA_Services;

            // Valido si el servicio existe
            var service = await repoService.FindAsync(id);
            if (service == null)
            {
                return NotFound();
            }

            // Elimino el servicio
            repoService.Remove(service);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private string ConvertToUSD(string hourValue)
        {
            // Para marcar tipo de moneda
            var specifier = "C";
            var culture = CultureInfo.CreateSpecificCulture("en-US");
            var data = Int32.Parse(hourValue);
            var valueUSD = data.ToString(specifier, culture);

            hourValue = valueUSD;

            return hourValue;
        }
    }
}
