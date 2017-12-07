using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WebApplication1.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";
            
            return View();
        }

        public ActionResult Logout()
        {
            return Redirect("/.auth/logout");
        }

        public ActionResult LoginAd()
        {
            return Redirect("/.auth/login/aad");
        }

        public ActionResult LoginGoogle()
        {
            return Redirect("/.auth/login/google");
        }

        public ActionResult EditProfile()
        {
            return Redirect("{B2CEditProfilePolicyUrl}");
        }
    }
}
