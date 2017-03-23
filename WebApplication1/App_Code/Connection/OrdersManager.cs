using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Bookshop
{
    public class OrdersManager
    {
        private static string _connectionString;

        public OrdersManager()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["BooksDB_CS"].ConnectionString;
        }

        public OrdersManager(string connectionString)
        {
            _connectionString = connectionString;
        }

        public void AddOrders(List<Order> orders)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    conn.Open();
                    using (SqlCommand com = conn.CreateCommand())
                    {
                        com.CommandText = "INSERT INTO orders VALUES (@client, @book, @amount, @price, @date, @orderSent)";
                        foreach (Order order in orders)
                        {
                            com.Parameters.AddWithValue("@client", order.Client);
                            com.Parameters.AddWithValue("@book", order.Book);
                            com.Parameters.AddWithValue("@amount", order.Amount);
                            com.Parameters.AddWithValue("price", order.Price);
                            com.Parameters.AddWithValue("@date", order.Date);
                            com.Parameters.AddWithValue("@orderSent", order.OrderShipped);

                            com.ExecuteNonQuery();
                            com.Parameters.Clear();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
           
               
        }

        public void UpdateOrders(string client, DateTime date)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    conn.Open();
                    using (SqlCommand com = conn.CreateCommand())
                    {
                        com.Parameters.AddWithValue("@client", client);
                        com.Parameters.AddWithValue("@date", date);
                        com.CommandText = "UPDATE orders SET orderShipped = 1 WHERE client = @client AND date = @date";

                        com.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        public List<GroupedOrders> GetGroupedOrders(DateTime currentDate, DateTime endDate, bool shipped)
        {
            List<GroupedOrders> orderList = new List<GroupedOrders>();
            int lastDay;

            if (currentDate.Month == endDate.Month && currentDate.Year == endDate.Year)
            {
                lastDay = endDate.Day;
            }
            else
            {
                lastDay = DateTime.DaysInMonth(currentDate.Year, currentDate.Month);
            }

            DateTime date2 = new DateTime(currentDate.Year, currentDate.Month, lastDay);

            try
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    conn.Open();
                    using (SqlCommand com = conn.CreateCommand())
                    {
                        com.Parameters.AddWithValue("@date1", currentDate);
                        com.Parameters.AddWithValue("@date2", date2);
                        com.Parameters.AddWithValue("@shipped", shipped);

                        com.CommandText = "spGetGroupedOrders";
                        com.CommandType = System.Data.CommandType.StoredProcedure;

                        using (SqlDataReader dr = com.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                string client = dr.GetString(0);
                                DateTime date = dr.GetDateTime(1);
                                double total = dr.GetDouble(2);
                                GroupedOrders groupedOrder = new GroupedOrders(client, date, total);
                                orderList.Add(groupedOrder);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
         
            return orderList;
        }

        public List<Order> GetDetailedOrders(string client, DateTime date)
        {
            List<Order> orderList = new List<Order>();
            try
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    conn.Open();
                    using (SqlCommand com = conn.CreateCommand())
                    {
                        com.Parameters.AddWithValue("@client", client);
                        com.Parameters.AddWithValue("@date", date);

                        com.CommandText = @"SELECT id, book, amount, price, orderShipped
                                           FROM orders
                                           WHERE client = @client
                                           AND date = @date";

                        using (SqlDataReader dr = com.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                int id = dr.GetInt32(0);
                                string book = dr.GetString(1);
                                int amount = dr.GetInt32(2);
                                double price = dr.GetDouble(3);
                                bool orderShipped = dr.GetBoolean(4);

                                Order order = new Order(id, client, book, amount, price, date, orderShipped);
                                orderList.Add(order);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

            return orderList;
        }
      
    }
    }
