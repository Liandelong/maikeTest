using Abp.Authorization;
using Maike.AbpVueAdminDemo.Authorization.Roles;
using Maike.AbpVueAdminDemo.Authorization.Users;

namespace Maike.AbpVueAdminDemo.Authorization
{
    public class PermissionChecker : PermissionChecker<Role, User>
    {
        public PermissionChecker(UserManager userManager)
            : base(userManager)
        {
        }
    }
}
