using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bookshop;

namespace Bookshop.Pages
{
    public partial class OrdersDetailed : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AuthenticateAdministrator();
            lblTitle.Text = string.Format("<h2>Client: {0}<br />Date: {1}</h2>",
                Request.QueryString["client"], Request.QueryString["date"]);
        }

        private void AuthenticateAdministrator()
        {
            if ((string) Session["type"] != "administrator")
            {
                Response.Redirect("~/Pages/Account/Login.aspx");
            }            
        }

        protected void btnShip_Click(object sender, EventArgs e)
        {
            string client = Request.QueryString["client"];
            DateTime date = Convert.ToDateTime(Request.QueryString["date"]);

            UsersManager um = new UsersManager();
            User user = um.GetUserDetails(client);

            OrdersManager om = new OrdersManager();
            List<Order> orderList = om.GetDetailedOrders(client, date);
            om.UpdateOrders(client, date);
            
            SendEmail(user.Name, user.Email, orderList);
            Response.Redirect("~/Pages/Orders.aspx");
        }

        private void SendEmail(string client, string email, List<Order> orderList)
        {
            MailAddress mailTo = new MailAddress(email);
            MailAddress mailFrom = new MailAddress("mailtest@gmail.com");


            string body = string.Format(@"Hi {0},
                                       

                                        your order:
                                        {1}

                                        has been shipped {2}.

                                        Regards,
                                        Robert Kawa", client, GenerateOrderedItems(orderList), Request.QueryString["date"]); 

            MailMessage mailMsg = new MailMessage(mailFrom, mailTo);

            mailMsg.Body = body;
            mailMsg.Subject = "Antykwariat zrealizowal twoje zamowienie";

            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.Port = 587;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("mailtest@gmail.com", "passtest");
            smtp.EnableSsl = true;

            smtp.Send(mailMsg);
        }

        private string GenerateOrderedItems(List<Order> orderList)
        {
            string result = "";
            double totalAmount = 0;

            foreach (Order order in orderList)
            {
                result += string.Format(@"
                                        - {0} ({1} zl)         X {2}         = {3} zl",
                    order.Book, order.Price, order.Amount, (order.Amount * order.Price));
                totalAmount += (order.Amount * order.Price);
            }

            result += string.Format(@"

                                    Total amount: {0} zl", totalAmount);
            return result;
        }

       
    }
}
