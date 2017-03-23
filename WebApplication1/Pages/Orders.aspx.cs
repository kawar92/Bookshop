using System;
using System.Collections;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.Ajax.Utilities;

namespace Bookshop.Pages.Account
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
            CheckIfAdministrator();

            if (IsPostBack)
            {
                Session["date1Open"] = null;
                Session["date2Open"] = null;
            }

            if (Session["date1Open"] != null && Session["date2Open"] != null)
            {
                txtOpenOrder1.Text = Session["date1Open"].ToString();
                txtOpenOrder2.Text = Session["date2Open"].ToString();
            }

            if (txtOpenOrder1.Text != "" && txtOpenOrder2.Text != "")
            {
                HtmlGenerator html = new HtmlGenerator();
                lblOpenOrders.Text = html.GenerateOrdersSummary(false, txtOpenOrder1.Text, txtOpenOrder2.Text);

                Session["date1Open"] = txtOpenOrder1.Text;
                Session["date2Open"] = txtOpenOrder2.Text;
            }
            if (txtClosedOrders1.Text != "" && txtClosedOrders2.Text != "")
            {
               HtmlGenerator html = new HtmlGenerator();
               lblClosedOrders.Text = html.GenerateOrdersSummary(true, txtClosedOrders1.Text, txtClosedOrders2.Text);
            }
            

        }

        private void CheckIfAdministrator()
        {
            if ((string)Session["type"] != "administrator")
                Response.Redirect("~/Pages/Account/Login.aspx");
        }

        

    }
}