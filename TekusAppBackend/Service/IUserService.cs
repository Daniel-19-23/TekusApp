using TekusAppBackend.Entities.Entities;

namespace TekusAppBackend.Service
{
    public interface IUserService
    {
        //public Task<List<TA_User>> Get();
        public bool IsUser(string email, string pass);
    }
}
