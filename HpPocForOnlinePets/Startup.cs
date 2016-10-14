using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HpPocForOnlinePets.Startup))]
namespace HpPocForOnlinePets
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
