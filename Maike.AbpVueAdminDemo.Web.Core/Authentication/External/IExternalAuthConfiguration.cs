using System.Collections.Generic;

namespace Maike.AbpVueAdminDemo.Authentication.External
{
    public interface IExternalAuthConfiguration
    {
        List<ExternalLoginProviderInfo> Providers { get; }
    }
}
