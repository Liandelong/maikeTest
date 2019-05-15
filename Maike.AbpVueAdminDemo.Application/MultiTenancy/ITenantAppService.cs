using Abp.Application.Services;
using Abp.Application.Services.Dto;
using Maike.AbpVueAdminDemo.MultiTenancy.Dto;

namespace Maike.AbpVueAdminDemo.MultiTenancy
{
    public interface ITenantAppService : IAsyncCrudAppService<TenantDto, int, PagedTenantResultRequestDto, CreateTenantDto, TenantDto>
    {
    }
}

