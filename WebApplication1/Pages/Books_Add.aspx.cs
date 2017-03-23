using System;

using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Collections;

namespace Bookshop.Pages
{
    public partial class Book_Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string selectedValue = ddlImage.SelectedValue;
            ShowImages();
            ddlImage.SelectedValue = selectedValue;
            
            lbtBrowse.Attributes.Add("onclick",
                "document.getElementById('" + FileUpload1.ClientID + "').click(); return false");
        }

        private void ShowImages()
        {
            string[] images = Directory.GetFiles(Server.MapPath("~/Images/Book/"));

            ArrayList imageList = new ArrayList();

            foreach(string image in images)
            {
                string imageName = image.Substring(image.LastIndexOf(@"\") + 1);
                imageList.Add(imageName);
            }

            ddlImage.DataSource = imageList;
            ddlImage.DataBind();
           

        }

        private void ClearTextFields()
        {
            txtCountry.Text = "";
            txtName.Text = "";
            txtPrice.Text = "";
            txtReview.Text = "";
            txtGenre.Text = "";
            txtAuthor.Text = "";
        }

        protected void btnUploadImage_Click(object sender, EventArgs e)
        {
            try
            {
                string fileName = Path.GetFileName(FileUpload1.FileName);
                FileUpload1.SaveAs(Server.MapPath("~/Images/Book/") + fileName);
                lblResult.Text = fileName + " succesfully uploaded!";
                Page_Load(sender, e);
            }
            catch (Exception ex)
            {
                lblResult.Text = "Uploade failed!!!  " + ex.ToString();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                double price;
                
                
                string image = "../Images/Book/" + ddlImage.SelectedValue;

               
                if (Double.TryParse(txtPrice.Text, out price))
                {
                    Book book = new Book(txtName.Text, txtAuthor.Text, price, txtGenre.Text, txtCountry.Text, image, txtReview.Text);

                    BooksManager bm = new BooksManager();
                    bm.AddBook(book);
                    lblResult.Text = "Upload succesful!!!";
                    ClearTextFields();
                }
                else
                {
                    lblResult.Text = "Wrong price!";
                }
                
            }
            catch (Exception ex)
            {
                lblResult.Text = "Upload failed!!! " + ex.ToString();
                
            }
        }
    }
}