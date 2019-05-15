using Abp.AutoMapper;
using Maike.AbpVueAdminDemo.Authentication.External;

namespace Maike.AbpVueAdminDemo.Models.TokenAuth
{
    [AutoMapFrom(typeof(ExternalLoginProviderInfo))]
    public class ExternalLoginProviderInfoModel
    {
        public string Name { get; set; }

        public string ClientId { get; set; }
    }
}
