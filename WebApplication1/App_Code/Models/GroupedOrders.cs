using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace Bookshop
{
    public class GroupedOrders
    {
        public string Client {get; set;}
        public DateTime Date { get; set; }
        public double Total { get; set; }

        public GroupedOrders(string client, DateTime date, double total)
        {
            Client = client;
            Date = date;
            Total = total;
        }
    }
}