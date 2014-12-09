using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Agendamento.Startup))]
namespace Agendamento
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
