using Microsoft.EntityFrameworkCore;
using Abp.Zero.EntityFrameworkCore;
using Maike.AbpVueAdminDemo.Authorization.Roles;
using Maike.AbpVueAdminDemo.Authorization.Users;
using Maike.AbpVueAdminDemo.BasEntities;
using Maike.AbpVueAdminDemo.MultiTenancy;

namespace Maike.AbpVueAdminDemo.EntityFrameworkCore
{
    public class AbpVueAdminDemoDbContext : AbpZeroDbContext<Tenant, Role, User, AbpVueAdminDemoDbContext>
    {
        /* Define a DbSet for each entity of the application */
        public DbSet<BasDepartment> BasDepartments { get; set; }

        public AbpVueAdminDemoDbContext(DbContextOptions<AbpVueAdminDemoDbContext> options)
            : base(options)
        {
        }
    }
}
