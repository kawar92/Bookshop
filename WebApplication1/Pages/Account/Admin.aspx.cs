using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop.Pages.Account
{
    public partial class Admin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            AuthenticateAdministrator();
            lblResult.Text = "";
        }
        
   

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (e.Exception == null)
            {
                if (e.AffectedRows == 1)
                {
                    e.KeepInInsertMode = true;
                    lblResult.Text = "User added";
                    
                }
                else
                {
                    e.KeepInInsertMode = true;
                    lblResult.Text = "Username already exists";
                }
            }
            else
            {
                lblResult.Text = e.Exception.Message;
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
        }

        private void AuthenticateAdministrator()
        {

            if ((string)Session["type"] != "administrator")
                Response.Redirect("~/Pages/Account/Login.aspx");
        }
    }
}