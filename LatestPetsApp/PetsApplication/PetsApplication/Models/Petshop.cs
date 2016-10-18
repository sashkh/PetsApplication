using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace PetsApplication.Models
{
    public class Petshop
    {
        public int order_id { get; set; }
        public Nullable<int> product_id { get; set; }
        public Nullable<int> customer_id { get; set; }
        public Nullable<int> order_total { get; set; }

        public string name { get; set; }
        public string description { get; set; }
        public string ImageUrl { get; set; }
        public Nullable<int> price { get; set; }
        public string ProductName { get; set; }
        public int id { get; set; }

        public string password { get; set; }
        public string email { get; set; }
        public string city { get; set; }
    }
}