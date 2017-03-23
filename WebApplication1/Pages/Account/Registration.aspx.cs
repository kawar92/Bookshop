using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Bookshop.Pages.Account
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                User user = new User(txtName.Text, txtPassword.Text, txtEmail.Text, "user");

                UsersManager um = new UsersManager();
                lblResult.Text = um.RegisterUser(user);
            }
            
        }
    }
}