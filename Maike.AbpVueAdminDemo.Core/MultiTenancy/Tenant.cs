using Abp.MultiTenancy;
using Maike.AbpVueAdminDemo.Authorization.Users;

namespace Maike.AbpVueAdminDemo.MultiTenancy
{
    public class Tenant : AbpTenant<User>
    {
        public Tenant()
        {            
        }

        public Tenant(string tenancyName, string name)
            : base(tenancyName, name)
        {
        }
    }
}
