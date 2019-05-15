using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.DependencyInjection;
using Maike.AbpVueAdminDemo.Authorization;
using Maike.AbpVueAdminDemo.Authorization.Roles;
using Maike.AbpVueAdminDemo.Authorization.Users;
using Maike.AbpVueAdminDemo.Editions;
using Maike.AbpVueAdminDemo.MultiTenancy;

namespace Maike.AbpVueAdminDemo.Identity
{
    public static class IdentityRegistrar
    {
        public static IdentityBuilder Register(IServiceCollection services)
        {
            services.AddLogging();

            return services.AddAbpIdentity<Tenant, User, Role>()
                .AddAbpTenantManager<TenantManager>()
                .AddAbpUserManager<UserManager>()
                .AddAbpRoleManager<RoleManager>()
                .AddAbpEditionManager<EditionManager>()
                .AddAbpUserStore<UserStore>()
                .AddAbpRoleStore<RoleStore>()
                .AddAbpLogInManager<LogInManager>()
                .AddAbpSignInManager<SignInManager>()
                .AddAbpSecurityStampValidator<SecurityStampValidator>()
                .AddAbpUserClaimsPrincipalFactory<UserClaimsPrincipalFactory>()
                .AddPermissionChecker<PermissionChecker>()
                .AddDefaultTokenProviders();
        }
    }
}
