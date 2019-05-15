using System.Threading.Tasks;
using Maike.AbpVueAdminDemo.Configuration.Dto;

namespace Maike.AbpVueAdminDemo.Configuration
{
    public interface IConfigurationAppService
    {
        Task ChangeUiTheme(ChangeUiThemeInput input);
    }
}
