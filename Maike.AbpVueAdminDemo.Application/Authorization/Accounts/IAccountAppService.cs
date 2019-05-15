using System.Threading.Tasks;
using Abp.Application.Services;
using Maike.AbpVueAdminDemo.Authorization.Accounts.Dto;

namespace Maike.AbpVueAdminDemo.Authorization.Accounts
{
    public interface IAccountAppService : IApplicationService
    {
        Task<IsTenantAvailableOutput> IsTenantAvailable(IsTenantAvailableInput input);

        Task<RegisterOutput> Register(RegisterInput input);
    }
}
