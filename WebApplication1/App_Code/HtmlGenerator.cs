using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI.WebControls;
using Bookshop;

namespace Bookshop
{
    public class HtmlGenerator
    {
        public string GenerateBooksByGenre(string genre)
        {
            BooksManager bm = new BooksManager();
            List<Book> booksList = bm.GetBooksByGenre(genre);
            StringBuilder sb = new StringBuilder();
            foreach (Book book in booksList)
            {
                sb.Append(
                    string.Format(
                        @"<table class='bookTable'>
                        <tr>
                            <th rowspan='6' width='150px'><img runat='server' src='{6}' /></th>
                            <th width='50px'>Name: </td>
                            <td>{0}</td>
                        </tr>

                        <tr>
                            <th>Author: </th>
                            <td>{1}</td>
                        </tr>

                        <tr>
                            <th>Price: </th>
                            <td>{2} zl</td>
                        </tr>

                        <tr>
                            <th>Genre: </th>
                            <td>{3}</td>
                        </tr>

                        <tr>
                            <th>Country: </th>
                            <td>{4}</td>
                        </tr>

                        <tr>
                            <td colspan='2'>{5}</td>
                        </tr>           

                      </table>", book.Name, book.Author, book.Price, book.Genre, book.Country, book.Review, book.Image));
            }

            return sb.ToString();
        }

        public string GenerateOrderReview(List<Order> orderList)
        {
            double totalAmount = 0;
            
           
            StringBuilder sb = new StringBuilder();

            sb.Append("<table>");
            sb.Append("<h3>Review order</h3>");



            foreach (Order order in orderList)
            {
                double totalRow = order.Price * order.Amount;
                sb.Append(string.Format(@"<tr>
                                            <td width = '50px'>{0} X </td>
                                            <td width = '200px'>{1} ({2})</td>
                                            <td>{3}</td><td> zl</td>
                                        </tr>", order.Amount, order.Book, order.Price,
                    string.Format("{0:0.00}", totalRow)));
                totalAmount += totalRow;
            }
            sb.Append(string.Format(@"<tr>
                                        <td><b>Total: </b></td>
                                        <td><b>{0} zl </b></td>
                                           </tr>", totalAmount));

            sb.Append("</table>");

            return sb.ToString();
        }

        public string GenerateOrdersSummary(bool shipped, string beginDate, string endDate)
        {
            StringBuilder sb = new StringBuilder();
            DateTimeFormatInfo info = new CultureInfo("en-US", false).DateTimeFormat;
            string shippedString = shipped ? "Completed" : "Open";


            DateTime date1 = Convert.ToDateTime(beginDate, info);
            DateTime date2 = Convert.ToDateTime(endDate, info);
            DateTime incrementalDate = date1;


            while (incrementalDate <= date2)
            {
                sb.Append(string.Format(@"<b>{0} orders for {1} {2}</b><br />", shippedString, info.GetMonthName(incrementalDate.Month), incrementalDate.Year));
                List<GroupedOrders> orderList = new List<GroupedOrders>();


                OrdersManager om = new OrdersManager();
                orderList = om.GetGroupedOrders(incrementalDate, date2, shipped);

                if (orderList.Count == 0)
                {
                    sb.Append("No orders for this period<br/><br/>");
                }
                else
                {
                    sb.Append(@"<table class='orderTable'>
                                <tr><th>Date</th><th>Client</th><th>Total</th></tr>");

                    foreach (GroupedOrders groupedOrder in orderList)
                    {
                        sb.Append(string.Format("<tr><td>{0}</td><td>{1}</td><td>$ {2}</td><td>{3}</td></tr>",
                                                groupedOrder.Date, groupedOrder.Client, groupedOrder.Total,
                                                string.Format("<a href='OrdersDetailed.aspx?client={0}&date={1}'>Click for detail</a>", groupedOrder.Client, groupedOrder.Date)));
                    }
                    sb.Append("</table>");
                }

                incrementalDate = incrementalDate.AddMonths(1);
                incrementalDate = new DateTime(incrementalDate.Year, incrementalDate.Month, 1);
            }

            return sb.ToString();
        }

       
    }
}