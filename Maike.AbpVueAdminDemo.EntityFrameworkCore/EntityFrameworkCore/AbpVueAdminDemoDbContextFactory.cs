using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using Microsoft.Extensions.Configuration;
using Maike.AbpVueAdminDemo.Configuration;
using Maike.AbpVueAdminDemo.Web;

namespace Maike.AbpVueAdminDemo.EntityFrameworkCore
{
    /* This class is needed to run "dotnet ef ..." commands from command line on development. Not used anywhere else */
    public class AbpVueAdminDemoDbContextFactory : IDesignTimeDbContextFactory<AbpVueAdminDemoDbContext>
    {
        public AbpVueAdminDemoDbContext CreateDbContext(string[] args)
        {
            var builder = new DbContextOptionsBuilder<AbpVueAdminDemoDbContext>();
            var configuration = AppConfigurations.Get(WebContentDirectoryFinder.CalculateContentRootFolder());

            AbpVueAdminDemoDbContextConfigurer.Configure(builder, configuration.GetConnectionString(AbpVueAdminDemoConsts.ConnectionStringName), null);

            return new AbpVueAdminDemoDbContext(builder.Options);
        }
    }
}
