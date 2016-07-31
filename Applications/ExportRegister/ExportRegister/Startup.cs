using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ExportRegister.Startup))]
namespace ExportRegister
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
