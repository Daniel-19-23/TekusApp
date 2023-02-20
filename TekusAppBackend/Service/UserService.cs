using TekusAppBackend.Entities.Entities;

namespace TekusAppBackend.Service
{
    public class UserService : IUserService
    {

        List<TA_User> users = new List<TA_User>();

        public bool IsUser(string email, string password) =>
            users.Where(s => s.Email_User == email && s.Password_User == password).Count() > 0;

        //string path = "";

        //public async Task<List<TA_User>> Get()
        //{
        //    string content = await File.ReadAllTextAsync(path);
        //    var users = new List<TA_User>();
        //    return users;
        //}
    }
}
