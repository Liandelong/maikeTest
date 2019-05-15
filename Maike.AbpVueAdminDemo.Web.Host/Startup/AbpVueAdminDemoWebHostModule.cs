using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Abp.Modules;
using Abp.Reflection.Extensions;
using Maike.AbpVueAdminDemo.Configuration;

namespace Maike.AbpVueAdminDemo.Web.Host.Startup
{
    [DependsOn(
       typeof(AbpVueAdminDemoWebCoreModule))]
    public class AbpVueAdminDemoWebHostModule: AbpModule
    {
        private readonly IHostingEnvironment _env;
        private readonly IConfigurationRoot _appConfiguration;

        public AbpVueAdminDemoWebHostModule(IHostingEnvironment env)
        {
            _env = env;
            _appConfiguration = env.GetAppConfiguration();
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(AbpVueAdminDemoWebHostModule).GetAssembly());
        }
    }
}
