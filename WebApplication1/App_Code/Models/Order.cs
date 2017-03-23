using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Bookshop
{
    public class Order
    {
        
        public int Id { get; set; }
        public string Client { get; set; }
        public string Book { get; set; }
        public int Amount { get; set; }
        public double Price { get; set; }
        public DateTime Date { get; set; }
        public bool OrderShipped { get; set; }

        public Order(int id, string client, string book, int amount, double price, DateTime date, bool orderShipped)
        {
            Id = id;
            Client = client;
            Book = book;
            Amount = amount;
            Price = price;
            Date = date;
            OrderShipped = orderShipped;
        }

        public Order(string client, string book, int amount, double price, DateTime date, bool orderShipped)
        {
            Client = client;
            Book = book;
            Amount = amount;
            Price = price;
            Date = date;
            OrderShipped = orderShipped;
        }
    }
}

