using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Apl.UI.Startup))]
namespace Apl.UI
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
