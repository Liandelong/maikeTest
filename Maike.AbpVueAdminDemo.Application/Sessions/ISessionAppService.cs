using System.Threading.Tasks;
using Abp.Application.Services;
using Maike.AbpVueAdminDemo.Sessions.Dto;

namespace Maike.AbpVueAdminDemo.Sessions
{
    public interface ISessionAppService : IApplicationService
    {
        Task<GetCurrentLoginInformationsOutput> GetCurrentLoginInformations();
    }
}
