using PetsApplication.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace PetsApplication.Controllers
{
    public class CommonController : Controller
    {
        
        
        public ActionResult Index()
        {
            return View();
        }

        //public static int currentUserID()
        //{
        //    CustomerDbContext context = new CustomerDbContext();
        //    int UserId = 0;
        //    string cookieName = FormsAuthentication.FormsCookieName; //Find cookie name
        //    HttpCookie authCookie = HttpContext.Request.Cookies[cookieName]; //Get the cookie by it's name
        //    FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value); //Decrypt it
        //    string UserName = ticket.Name;
        //    UserId = context.Registers.Where(x => x.name == UserName).Select(x => x.id).FirstOrDefault();
        //    return UserId;
        //}
    }
}