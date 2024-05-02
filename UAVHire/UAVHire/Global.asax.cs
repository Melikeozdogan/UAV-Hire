using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace UAVHire
{
    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }



        protected void Application_Error(object sender, EventArgs e)
        {
            // Hatanın nesnesini al
            Exception exception = Server.GetLastError();

            // Hata sayfasına yönlendirme
            Response.Clear();
            Server.ClearError();
            Response.Redirect("~/Error/Index");
        }
    }
}
