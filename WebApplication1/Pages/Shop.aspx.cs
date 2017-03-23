using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.Design;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bookshop;



namespace Bookshop.Pages
{
    public partial class Shop : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            GenerateControls();
        }

        private void GenerateControls()
        {
            BooksManager bm = new BooksManager();
            List<Book> booksList = bm.GetBooksByGenre("%");

            foreach (Book book in booksList)
            {
                Panel booksPanel = new Panel();
                Image image = new Image {ImageUrl = book.Image, CssClass = "ProductsImage"};
                Literal literal = new Literal {Text = "<br />"};
                Literal literal2 = new Literal {Text = "<br />"};
                Label lblName = new Label {Text = book.Name, CssClass = "ProductsName"};
                Label lblPrice = new Label
                {
                    Text = string.Format("{0:0.00}", book.Price + "<br />"),
                    CssClass = "ProductsPrice"
                };
                TextBox textBox = new TextBox()
                {
                    ID = book.Id.ToString(),
                    CssClass = "ProductsTextBox",
                    Width = 60,
                    Text = "0"
                };

                RegularExpressionValidator regex = new RegularExpressionValidator
                {
                    ValidationExpression = "^[0-9]*",
                    ControlToValidate = textBox.ID,
                    ErrorMessage = "Enter a number",
                    ForeColor = System.Drawing.Color.Red
                };

                booksPanel.Controls.Add(image);
                booksPanel.Controls.Add(literal);
                booksPanel.Controls.Add(lblName);
                booksPanel.Controls.Add(literal2);
                booksPanel.Controls.Add(lblPrice);
                booksPanel.Controls.Add(textBox);
                booksPanel.Controls.Add(regex);

                pnlProducts.Controls.Add(booksPanel);
            }
        }

        private List<Order> GetOrders()
        {
            ContentPlaceHolder cph = (ContentPlaceHolder) Master.FindControl("ContentPlaceHolder1");
            ControlFinder<TextBox> cf = new ControlFinder<TextBox>();
            cf.FindChildControlsRecursive(cph);

            var textBoxList = cf.FoundControls;

            List<Order> orderList = new List<Order>();


            foreach (TextBox textBox in textBoxList)
            {
                if (textBox.Text != "")
                {
                    int amountOfOrders = Convert.ToInt32(textBox.Text);

                    if (amountOfOrders > 0)
                    {
                        BooksManager bm = new BooksManager();
                        Book book = bm.GetBookById(Convert.ToInt32(textBox.ID));
                        Order order = new Order(Session["login"].ToString(), book.Name, amountOfOrders, book.Price, DateTime.Now, false);

                        orderList.Add(order);
                    }
                }
            }
            return orderList;
        }

        private void ClearPriceFields()
        {
            ContentPlaceHolder cph = (ContentPlaceHolder)Master.FindControl("ContentPlaceHolder1");
            ControlFinder<TextBox> cf = new ControlFinder<TextBox>();
            cf.FindChildControlsRecursive(cph);

            var textBoxList = cf.FoundControls;
            
            foreach (TextBox textBox in textBoxList)
            {
                textBox.Text = "0";
            }
        }

        private void GenerateReview()
        {
            
            List<Order> orderList = GetOrders();
            Session["orders"] = orderList;

            HtmlGenerator html = new HtmlGenerator();


            lblResult.Text = html.GenerateOrderReview(orderList);
            lblResult.Visible = true;
                
        }

        private void SendOrder()
        {
            List<Order> orderList = (List<Order>)Session["orders"];

            OrdersManager om = new OrdersManager();
            om.AddOrders(orderList);
            Session["orders"] = null;
        }

        private void Authenticate()
        {
            if (Session["login"] == null)
            {
                Response.Redirect("~/Pages/Account/Login.aspx");
            }
        } 
        
        

      

        protected void CommandButton_Click(object sender, CommandEventArgs e)
        {
            switch (e.CommandName)
            {
                case "Ok":
                {
                        Authenticate();
                        SendOrder();

                        lblResult.Text = "Your order has been placed";
                        btnOk.Visible = false;
                        btnCancel.Visible = false;
                        btnNewOrder.Visible = true;
                } break;
                case "Order":
                {
                        
                        Authenticate();
                        GenerateReview();
                        btnOk.Visible = true;
                        btnCancel.Visible = true;
                        btnOrder.Visible = false;
                } break;
                case "NewOrder":
                {
                        Response.Redirect(Request.RawUrl);
                        btnNewOrder.Visible = false;
                } break;
                case "Cancel":
                {

                        Session["orders"] = null;
                        lblResult.Text = "";
                        lblResult.Visible = false;
                        btnOk.Visible = false;
                        btnOrder.Visible = true;
                        btnCancel.Visible = false;
                        ClearPriceFields();
                } break;

                default: MessageBox.Show("Wrong command name");
                    break;
            }
        }
    }
}