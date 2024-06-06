using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(VASR_WEB.Startup))]
namespace VASR_WEB
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
