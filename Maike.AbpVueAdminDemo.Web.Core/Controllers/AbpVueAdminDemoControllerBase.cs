using Abp.AspNetCore.Mvc.Controllers;
using Abp.IdentityFramework;
using Microsoft.AspNetCore.Identity;

namespace Maike.AbpVueAdminDemo.Controllers
{
    public abstract class AbpVueAdminDemoControllerBase: AbpController
    {
        protected AbpVueAdminDemoControllerBase()
        {
            LocalizationSourceName = AbpVueAdminDemoConsts.LocalizationSourceName;
        }

        protected void CheckErrors(IdentityResult identityResult)
        {
            identityResult.CheckErrors(LocalizationManager);
        }
    }
}
