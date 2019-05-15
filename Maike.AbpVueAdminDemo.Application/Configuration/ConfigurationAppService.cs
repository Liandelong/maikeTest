using System.Threading.Tasks;
using Abp.Authorization;
using Abp.Runtime.Session;
using Maike.AbpVueAdminDemo.Configuration.Dto;

namespace Maike.AbpVueAdminDemo.Configuration
{
    [AbpAuthorize]
    public class ConfigurationAppService : AbpVueAdminDemoAppServiceBase, IConfigurationAppService
    {
        public async Task ChangeUiTheme(ChangeUiThemeInput input)
        {
            await SettingManager.ChangeSettingForUserAsync(AbpSession.ToUserIdentifier(), AppSettingNames.UiTheme, input.Theme);
        }
    }
}
