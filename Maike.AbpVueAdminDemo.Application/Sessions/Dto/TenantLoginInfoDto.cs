using Abp.Application.Services.Dto;
using Abp.AutoMapper;
using Maike.AbpVueAdminDemo.MultiTenancy;

namespace Maike.AbpVueAdminDemo.Sessions.Dto
{
    [AutoMapFrom(typeof(Tenant))]
    public class TenantLoginInfoDto : EntityDto
    {
        public string TenancyName { get; set; }

        public string Name { get; set; }
    }
}
