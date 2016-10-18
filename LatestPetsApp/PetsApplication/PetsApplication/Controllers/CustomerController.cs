using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PetsApplication;
using PetsApplication.Models;
using Microsoft.AspNet.Identity;
using System.Web.Security;
using PetsApplication.Controllers;

namespace PetsApplication.Controllers
{
    [Authorize]
    public class CustomerController : Controller
    {
        private CustomerDbContext context = new CustomerDbContext();
        public ActionResult Home()
        {
            return View();
        }

        public ActionResult Index()
        {
            return View();
        }

        [Authorize]
        public ActionResult Details()
        {
            string cookieName = FormsAuthentication.FormsCookieName; //Find cookie name
            HttpCookie authCookie = HttpContext.Request.Cookies[cookieName]; //Get the cookie by it's name
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value); //Decrypt it
            string UserName = ticket.Name;

            using (CustomerDbContext context = new CustomerDbContext())
            {
                int UserID = context.Registers.Where(x => x.name == UserName).Select(x => x.id).FirstOrDefault();

                string name = HttpContext.Profile.UserName;
                var data = context.Registers.Where(x => x.id == UserID).ToList();

                return View(data);
            }
        }

        public int Current_UserID()
        {
            CustomerDbContext context = new CustomerDbContext();
            int UserId = 0;
            string cookieName = FormsAuthentication.FormsCookieName; //Find cookie name
            HttpCookie authCookie = HttpContext.Request.Cookies[cookieName]; //Get the cookie by it's name
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value); //Decrypt it
            string UserName = ticket.Name;
            UserId = context.Registers.Where(x => x.name == UserName).Select(x => x.id).FirstOrDefault();
            return UserId;
        }

        public ActionResult Edit(int id)
        {

            using (CustomerDbContext context = new CustomerDbContext())
            {
                Register r = context.Registers.Find(id);
                if (r == null)
                {
                    return HttpNotFound();
                }
                return View(r);

            }
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Exclude = "name")]Register register)
        {
            Register registerFromDb = context.Registers.Single(x => x.id == register.id);
            registerFromDb.city = register.city;
            registerFromDb.email = register.email;
            registerFromDb.password = register.password;
            register.name = registerFromDb.name;
            if (ModelState.IsValid)
            {
                context.Entry(registerFromDb).State = System.Data.Entity.EntityState.Modified;
                context.SaveChanges();
                return RedirectToAction("Details");


            }
            return View(register);
        }


    }
}