using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop.Pages
{
    public partial class Books_Overview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AuthenticateAdministrator();
        }

        private void AuthenticateAdministrator()
        {
            if ((string)Session["type"] != "administrator")
            {
                Response.Redirect("~/Pages/Account/Login.aspx");
            }
        }
    }
}