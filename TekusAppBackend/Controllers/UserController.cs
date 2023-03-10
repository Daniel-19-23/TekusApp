using TekusAppBackend.Entities.Entities;
using Microsoft.AspNetCore.Mvc;
using TekusAppBackend.Contexts;
using Microsoft.EntityFrameworkCore;
using TekusAppBackend.Service;
using Microsoft.AspNetCore.Authorization;

namespace TekusAppBackend.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    [Authorize]
    public class UserController : ControllerBase
    {
        private readonly ConnectionSQLServer _context;
        //private readonly IUserService _userService;

        //public UserController(ConnectionSQLServer context, IUserService userService)
        public UserController(ConnectionSQLServer context)
        {
            _context = context;
            //_userService = userService;
        }

        //GET: api/<UserController>
        [HttpGet("GetAllUser")]
        public async Task<ActionResult<IEnumerable<TA_User>>> GetAllUser()
        {
            var repoUser = _context.TA_Users;

            return await repoUser.ToListAsync(); 
        }

        //GET: api/<UserController>
        [HttpGet("GetUser/{idUser}")]
        public async Task<ActionResult<TA_User>> GetUser(int idUser)
        {
            var repoUser = _context.TA_Users;

            var user = await repoUser.FindAsync(idUser); 

            if (user == null)
            {
                return NotFound();
            }

            return user;
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

        //POST api/<UserController>
        // Actualizar usuario
        [HttpPut("UpdateUser/{id}")]
        public async Task<IActionResult> UpdateUser(int id, [FromBody] TA_User user)
        {
            var repoUser = _context.TA_Users;

            user.Id_User = id;

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
