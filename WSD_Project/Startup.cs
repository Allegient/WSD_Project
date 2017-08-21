using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(WSD_Project.Startup))]
namespace WSD_Project
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
