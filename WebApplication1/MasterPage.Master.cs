using System;


namespace Bookshop
{

    public partial class MasterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] != null)
            {
                //lblLogin.Text = "Hi, " + Session["login"].ToString();
                //lblLogin.Visible = true;
                LinkButton1.Text = string.Format("logout {0}", Session["login"]);
            }
            else
            {
                //lblLogin.Visible = false;
                LinkButton1.Text = "login";
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (LinkButton1.Text == "login")
            {
                Response.Redirect("~/Pages/Account/Login.aspx");
            }
            else
            {
                Session.Clear();
                Response.Redirect("~/Pages/Home.aspx");
            }
        }
    }
}

