using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PetsApplication.Models;
using System.Web.Security;
using System.Threading;
using System.Data.Entity;
namespace PetsApplication.Controllers
{
    [Authorize]
    public class ProductsController : Controller
    {
        private CustomerDbContext context = new CustomerDbContext();
        // GET: Products
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ListofPetDogs()
        {
            return View();
        }
        public ActionResult PetDogs()
        {
            var data = context.Products.Where(x => x.name == "dog").ToList();

            return View(data);
        }

        public ActionResult CustomerOrders()
        {
            string cookieName = FormsAuthentication.FormsCookieName; //Find cookie name
            HttpCookie authCookie = HttpContext.Request.Cookies[cookieName]; //Get the cookie by it's name
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value); //Decrypt it
            string UserName = ticket.Name;
            int UserID = context.Registers.Where(x => x.name == UserName).Select(x => x.id).FirstOrDefault();
            var data = (from i in context.Registers.Where(x => x.id == UserID)
                        join
                         c in context.Orders on i.id equals c.customer_id
                        into egroup
                        from k in egroup
                        join p in context.Products
                        on k.product_id equals p.product_id
                        select new Petshop
                        {
                            customer_id = i.id,
                            price = p.price,
                            ImageUrl = p.ImageUrl,
                            description = p.description,
                            product_id = p.product_id,
                            ProductName = p.ProductName

                        }).AsEnumerable().Select(x => new Products
                        {
                            product_id = x.product_id,
                            ProductName = x.ProductName,
                            price = x.price,
                            ImageUrl = x.ImageUrl,
                            description = x.description
                        });
            return View(data);

        }

        public ActionResult OrderDetails()
        {
            string cookieName = FormsAuthentication.FormsCookieName; //Find cookie name
            HttpCookie authCookie = HttpContext.Request.Cookies[cookieName]; //Get the cookie by it's name
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value); //Decrypt it
            string UserName = ticket.Name;
            ViewBag.name = UserName;
            int UserID = context.Registers.Where(x => x.name == UserName).Select(x => x.id).FirstOrDefault();
            var data = (from i in context.Registers.Where(x => x.id == UserID)
                        join
                         c in context.Orders on i.id equals c.customer_id
                        into egroup
                        from k in egroup
                        join p in context.Products
                        on k.product_id equals p.product_id
                        select new Petshop
                        {
                            order_id = k.order_id,
                            customer_id = i.id,
                            price = p.price,
                            ImageUrl = p.ImageUrl,
                            description = p.description,

                            ProductName = p.ProductName

                        }).AsEnumerable().Select(x => new OrderDetails
                        {
                            ProductName = x.ProductName,
                            qty = x.ProductName.Count(),
                            Imageurl = x.ImageUrl,
                            order_id = x.order_id
                        }); ;
            foreach (var item in data)
            {
                OrderDetails or = new OrderDetails();
                or.order_id = item.order_id;
                or.qty = item.ProductName.Count();
                or.ProductName = item.ProductName;
                or.Imageurl = item.Imageurl;
                context.OrderDetails.Add(or);
            }
            context.SaveChanges();
            return View(data);

        }

        public ActionResult BuyItems(int id)
        {

            string cookieName = FormsAuthentication.FormsCookieName; //Find cookie name
            HttpCookie authCookie = HttpContext.Request.Cookies[cookieName]; //Get the cookie by it's name
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value); //Decrypt it
            string UserName = ticket.Name;
            int UserID = context.Registers.Where(x => x.name == UserName).Select(x => x.id).FirstOrDefault();

            var data = from i in context.Products.Where(x => x.product_id == id)
                       from j in context.Registers.Where(x => x.id == UserID)
                       select new
                       {
                           i.product_id,
                           i.price,
                           j.id
                       };

            foreach (var item in data)
            {
                Orders or = new Orders();
                or.order_total = Convert.ToInt32(item.price);
                or.customer_id = item.id;
                or.product_id = item.product_id;
                context.Orders.Add(or);

            }
            context.SaveChanges();
            return RedirectToAction("CustomerOrders","Products");
        }

        [HttpGet]
        public ActionResult Delete(int id)
        {
            var data = context.Products.Where(x => x.product_id == id).ToList();

            return View(data);
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [ActionName("Delete")]
        public ActionResult Delete_post(int id)
        {
            
           // c.ProRel.RemoveRange(db.ProRel.Where(c => c.ProjectId == Project_id));
            context.Products.Where(p => p.product_id == id)
                .ToList().ForEach(p => context.Products.Remove(p));
           // context.SaveChanges();
            context.Products.RemoveRange(context.Products.Where(x => x.product_id == id));
            Products products = context.Products.Find(id);
            context.Products.Remove(products);
            context.SaveChanges();
            return RedirectToAction("CustomerOrders","Products");

        }
        public PartialViewResult Load(int id)
        {
            
            string cookieName = FormsAuthentication.FormsCookieName; //Find cookie name
            HttpCookie authCookie = HttpContext.Request.Cookies[cookieName]; //Get the cookie by it's name
            FormsAuthenticationTicket ticket = FormsAuthentication.Decrypt(authCookie.Value); //Decrypt it
            string UserName = ticket.Name;
            int UserID = context.Registers.Where(x => x.name == UserName).Select(x => x.id).FirstOrDefault();

            var data = from i in context.Products.Where(x => x.product_id == id)
                       from j in context.Registers.Where(x => x.id == UserID)
                       select new
                       {
                           i.product_id,
                           i.price,
                           j.id
                       };

            foreach (var item in data)
            {
                Orders or = new Orders();
                or.order_total = Convert.ToInt32(item.price);
                or.customer_id = item.id;
                or.product_id = item.product_id;
                context.Orders.Add(or);

            }
            context.SaveChanges();
            return PartialView("_SuccesView");
        }

        public PartialViewResult Load1()
        {
            return PartialView("_SuccesView");
        }

    }
}