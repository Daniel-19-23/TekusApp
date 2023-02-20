using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Moq;
using TekusAppBackend.Contexts;
using TekusAppBackend.Controllers;
using TekusAppBackend.Entities.Entities;

namespace TekusAppTest
{
    public class UserTest
    {

        // Método de prueba para verificar que el registro correcto se recupera por ID
        [Fact]
        public async Task GetUserById()
        {
            // Crear una lista de registros de prueba
            var registerTest = new List<TA_User>()
            {
                new TA_User() { Id_User = 1, Name_User = "Registro1", Email_User = "registro@gmail.com", Password_User = "abc123" },
                new TA_User() { Id_User = 2, Name_User = "Registro2", Email_User = "registro@gmail.com", Password_User = "abc123" },
                new TA_User() { Id_User = 3, Name_User = "Registro3", Email_User = "registro@gmail.com", Password_User = "abc123" },
            };

            // Crear un objeto Mock de DbSet para la clase de contexto de Entity Framework
            var mockDbSet = new Mock<DbSet<TA_User>>();

            // Configurar el objeto Mock de DbSet para devolver registros de prueba
            mockDbSet.As<IQueryable<TA_User>>().Setup(m => m.Provider).Returns(registerTest.AsQueryable().Provider);
            mockDbSet.As<IQueryable<TA_User>>().Setup(m => m.Expression).Returns(registerTest.AsQueryable().Expression);
            mockDbSet.As<IQueryable<TA_User>>().Setup(m => m.ElementType).Returns(registerTest.AsQueryable().ElementType);
            mockDbSet.As<IQueryable<TA_User>>().Setup(m => m.GetEnumerator()).Returns(registerTest.AsQueryable().GetEnumerator());

            // Crear un objeto Mock de DbContext para la clase de contexto de Entity Framework
            var mockDbContext = new Mock<ConnectionSQLServer>();

            // Configurar el objeto Mock de DbContext para devolver el objeto Mock de DbSet
            mockDbContext.Setup(c => c.TA_Users).Returns(mockDbSet.Object);

            // Crear un objeto del controlador a probar, pasándole el objeto Mock de DbContext como argumento
            var controller = new UserController(mockDbContext.Object);

            // Llamar al método GET del controlador para recuperar un registro por ID
            var result = await controller.GetUser(2);

            // Verificar que el resultado es un objeto JsonResult
            Assert.IsType<JsonResult>(result);

            // Verificar que el resultado contiene el registro con ID 2
            var resultRegister = (TA_User)(result).Value;
            Assert.Equal(2, resultRegister.Id_User);
        }


        //[Fact]
        //public void Validate_GetAllUserQuatity()
        //{
        //    // Arrange


        //    // Act
        //    var result = (OkObjectResult)_user.GetAllUser();

        //    // Assert
        //    var users = Assert.IsType<List<TA_User>>(result.Value);

        //    Assert.True(users.Count);
        //}
    }
}