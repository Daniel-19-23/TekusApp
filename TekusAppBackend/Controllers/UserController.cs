using TekusAppBackend.Entities.Entities;
using Microsoft.AspNetCore.Mvc;
using TekusAppBackend.Contexts;
using Microsoft.EntityFrameworkCore;
using System.Xml;


// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace TekusAppBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly ConnectionSQLServer _context;

        public UserController(ConnectionSQLServer context)
        {
            _context = context;
        }

        //public ConnectionSQLServer GetContext()
        //{
        //    return _context;
        //}

        //GET: api/<UserController>
        [HttpGet("GetAllUser/{IdUser}")]
        public async Task<ActionResult<IEnumerable<TA_User>>> GetAllUser(int idUser)
        {
            var repoUser = _context.TA_Users;

            return await repoUser.ToListAsync(); 
        }

        //GET: api/<UserController>
        [HttpGet("GetUser/{IdUser}")]
        public async Task<ActionResult<TA_User>> GetUser(int idUser)
        {
            var repoUser = _context.TA_Users;

            var entity = await repoUser.FindAsync(idUser); 

            if (entity == null)
            {
                return NotFound();
            }

            return entity;
        }

        //POST api/<UserController>
        // Guardar usuario
        [HttpPost("SaveUser")]
        public async Task<IActionResult> SaveUser([FromBody] TA_User user)
        {
            var repoUser = _context.TA_Users;

            if (user == null)
            {
                return BadRequest();
            }

            repoUser.Add(user);
            await _context.SaveChangesAsync();

            return CreatedAtRoute("GetById", new { id = user.Id_User }, user);
        }

        [HttpPut("UpdateUser/{id}/{userData}")]
        public async Task<IActionResult> Update(int id, [FromBody] TA_User user)
        {
            var repoUser = _context.TA_Users;

            if (user == null || id != user.Id_User)
            {
                return BadRequest();
            }

            // Compruebo si el usuario existe
            var existingUser = await repoUser.FindAsync(id);
            if (existingUser == null)
            {
                return NotFound();
            }

            // Remplazo la informació
            existingUser.Email_User = user.Email_User;
            existingUser.Password_User = user.Password_User;
            existingUser.Name_User = user.Name_User;

            // Actualizo el usuario
            repoUser.Update(existingUser);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        // DELETE api/<UserController>/5
        // Eliminar Usuario
        [HttpDelete("DeleteUser/{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var repoUser = _context.TA_Users;

            // Valido si el usuario existe
            var user = await repoUser.FindAsync(id);
            if (user == null)
            {
                return NotFound();
            }

            // Elimino el usuario
            repoUser.Remove(user);
            await _context.SaveChangesAsync();

            return NoContent();
        }
    }
}
