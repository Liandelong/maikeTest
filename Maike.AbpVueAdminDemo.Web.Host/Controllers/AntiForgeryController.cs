using Microsoft.AspNetCore.Antiforgery;
using Maike.AbpVueAdminDemo.Controllers;

namespace Maike.AbpVueAdminDemo.Web.Host.Controllers
{
    public class AntiForgeryController : AbpVueAdminDemoControllerBase
    {
        private readonly IAntiforgery _antiforgery;

        public AntiForgeryController(IAntiforgery antiforgery)
        {
            _antiforgery = antiforgery;
        }

        public void GetToken()
        {
            _antiforgery.SetCookieTokenAndHeader(HttpContext);
        }
    }
}
