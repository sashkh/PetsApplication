using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin.Security;
using PetsApplication.Models;
using System.Web.Security;
using System.Net;

namespace PetsApplication.Controllers
{
    
    public class AccountController : Controller
    {

        // GET: Account
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(AccountViewModel.LoginViewModel m, string returnUrl = "")
        {
            if (ModelState.IsValid)
            {
                using (CustomerDbContext cust = new CustomerDbContext())
                {
                    var status = cust.Registers.Where(x => x.email == m.Email && x.password == m.Password).FirstOrDefault();
                    if (status != null)
                    {
                        FormsAuthentication.SetAuthCookie(status.name,m.RememberMe);
                        if (Url.IsLocalUrl(returnUrl))
                        {
                            return Redirect(returnUrl);
                        }
                        else
                        {
                            return RedirectToAction("Home", "Customer");
                        }
                      
                    }

                    else
                    {
                        ViewBag.message = "username / password wrong";
                    }

                }

               
            }
            return View();


        }

        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        [ActionName("Register")]
        public ActionResult Register_post(AccountViewModel.RegisterViewModel model)
        {
            if (ModelState.IsValid)
            {
                using (CustomerDbContext context = new CustomerDbContext())
                {

                    Register reg = new Register();
                    reg.city = model.City;
                    reg.email = model.Email;
                    reg.name = model.Name;
                    reg.password = model.Password;

                    context.Registers.Add(reg);
                    context.SaveChanges();
                    ModelState.Clear();
                    ViewBag.message = "Succesfully Registration Done";

                    return RedirectToAction("Login", "Account");

                }

            }
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult LogOff()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Index", "Home");
        }
    }
}