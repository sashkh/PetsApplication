//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace PetsApplication.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Orders
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Orders()
        {
            this.customer_OrderDetails = new HashSet<OrderDetails>();
        }
    
        public int order_id { get; set; }
        public Nullable<int> product_id { get; set; }
        public Nullable<int> customer_id { get; set; }
        public Nullable<int> order_total { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetails> customer_OrderDetails { get; set; }
        public virtual Register customer_Register { get; set; }
        public virtual Products customer_Products { get; set; }
    }
}