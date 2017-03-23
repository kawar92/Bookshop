using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Text;



namespace Bookshop.Pages
{
    public partial class Books : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillPage();
        }

        private void FillPage()
        {
            if (!IsPostBack)
            {
                DropDownList1.DataBind();
                DropDownList1.Items.Add(new ListItem("All", "%"));
            }

            string genre = DropDownList1.SelectedValue;
            HtmlGenerator html = new HtmlGenerator();
            lblOutput.Text = html.GenerateBooksByGenre(genre);
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            FillPage();
        }
    }
}