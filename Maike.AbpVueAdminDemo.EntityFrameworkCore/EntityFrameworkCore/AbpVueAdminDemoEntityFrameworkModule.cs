using Abp.EntityFrameworkCore.Configuration;
using Abp.Modules;
using Abp.Reflection.Extensions;
using Abp.Zero.EntityFrameworkCore;
using Maike.AbpVueAdminDemo.EntityFrameworkCore.Logger;
using Maike.AbpVueAdminDemo.EntityFrameworkCore.Seed;

namespace Maike.AbpVueAdminDemo.EntityFrameworkCore
{
    [DependsOn(
        typeof(AbpVueAdminDemoCoreModule), 
        typeof(AbpZeroCoreEntityFrameworkCoreModule))]
    public class AbpVueAdminDemoEntityFrameworkModule : AbpModule
    {
        /* Used it tests to skip dbcontext registration, in order to use in-memory database of EF Core */
        public bool SkipDbContextRegistration { get; set; }

        public bool SkipDbSeed { get; set; }

        public override void PreInitialize()
        {
            if (!SkipDbContextRegistration)
            {
                Configuration.Modules.AbpEfCore().AddDbContext<AbpVueAdminDemoDbContext>(options =>
                {
                    if (options.ExistingConnection != null)
                    {
                        AbpVueAdminDemoDbContextConfigurer.Configure(options.DbContextOptions, options.ExistingConnection, DbLoggerFactory);
                    }
                    else
                    {
                        AbpVueAdminDemoDbContextConfigurer.Configure(options.DbContextOptions, options.ConnectionString, DbLoggerFactory);
                    }
                });
            }
        }

        public override void Initialize()
        {
            IocManager.RegisterAssemblyByConvention(typeof(AbpVueAdminDemoEntityFrameworkModule).GetAssembly());
        }

        public override void PostInitialize()
        {
            if (!SkipDbSeed)
            {
                SeedHelper.SeedHostDb(IocManager);
            }
        }

        //记录数据库日志
        private static Microsoft.Extensions.Logging.LoggerFactory _loggerFactory;

        private Microsoft.Extensions.Logging.LoggerFactory DbLoggerFactory
        {
            get
            {
                if (null == _loggerFactory)
                {
                    _loggerFactory = new Microsoft.Extensions.Logging.LoggerFactory();
                    _loggerFactory.AddProvider(new EfLoggerProvider(Logger));
                }

                return _loggerFactory;
            }
        }
    }
}
