using Abp.AutoMapper;
using Abp.Modules;
using Abp.Reflection.Extensions;
using Maike.AbpVueAdminDemo.Authorization;
using Maike.AbpVueAdminDemo.BasEntities.Department.Dtos;

namespace Maike.AbpVueAdminDemo
{
    [DependsOn(
        typeof(AbpVueAdminDemoCoreModule),
        typeof(AbpAutoMapperModule))]
    public class AbpVueAdminDemoApplicationModule : AbpModule
    {
        public override void PreInitialize()
        {
            Configuration.Authorization.Providers.Add<AbpVueAdminDemoAuthorizationProvider>();
        }

        public override void Initialize()
        {
            var thisAssembly = typeof(AbpVueAdminDemoApplicationModule).GetAssembly();

            IocManager.RegisterAssemblyByConvention(thisAssembly);

            Configuration.Modules.AbpAutoMapper().Configurators.Add(
                // Scan the assembly for classes which inherit from AutoMapper.Profile
                cfg =>
                {
                    cfg.AddProfiles(thisAssembly);
                    BasDepartmentMapper.CreateMappings(cfg);
                });
        }
    }
}
