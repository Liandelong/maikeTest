using Abp.Application.Services.Dto;

namespace Maike.AbpVueAdminDemo.Roles.Dto
{
    public class PagedRoleResultRequestDto : PagedResultRequestDto
    {
        public string Keyword { get; set; }
    }
}

