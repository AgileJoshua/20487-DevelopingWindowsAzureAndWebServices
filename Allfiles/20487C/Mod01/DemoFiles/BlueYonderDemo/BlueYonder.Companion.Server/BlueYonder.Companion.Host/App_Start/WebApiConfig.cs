using BlueYonder.Companion.Controllers;
using BlueYonder.Companion.Controllers.Formatters;
using Newtonsoft.Json.Converters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Routing;

namespace BlueYonder.Companion.Host
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            config.DependencyResolver = new BlueYonderResolver();
            config.MapHttpAttributeRoutes();
            config.Formatters.Add(new AtomFormatter());

            config.IncludeErrorDetailPolicy = IncludeErrorDetailPolicy.Always;

            config.Routes.MapHttpRoute(
                 name: "FilesApi",
                 routeTemplate: "api/files/{action}/{id}",
                 defaults: new
                 {
                     controller = "Files",
                     id = RouteParameter.Optional
                 }
             );

            config.Routes.MapHttpRoute(
                name: "DefaultApi",
                routeTemplate: "api/{controller}/{id}",
                defaults: new { id = RouteParameter.Optional }
            );

            config.Formatters.JsonFormatter.SerializerSettings.Converters.Add(
                new StringEnumConverter());
            config.EnsureInitialized();
        }
    }
}
