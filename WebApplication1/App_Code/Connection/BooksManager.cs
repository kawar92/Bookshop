using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using Bookshop;

namespace Bookshop
{
    public class BooksManager
    {
        private static string _connectionString;

        public BooksManager()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["BooksDB_CS"].ConnectionString;
        }

        public BooksManager(string connectionString)
        {
            _connectionString = connectionString;
        }

        public List<Book> GetBooksByGenre(string bookGenre)
        {
            List<Book> list = new List<Book>();
            string query = string.Format("SELECT * FROM book WHERE genre LIKE '{0}'", bookGenre);

            try
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    conn.Open();
                    using (SqlCommand com = conn.CreateCommand())
                    {
                        com.Parameters.AddWithValue("@bookGenre", bookGenre);
                        com.CommandText = "SELECT * FROM book WHERE genre LIKE @bookGenre";
                        using (SqlDataReader dr = com.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                int id = dr.GetInt32(0);
                                string name = dr.GetString(1);
                                string author = dr.GetString(2);
                                double price = dr.GetDouble(3);
                                string genre = dr.GetString(4);
                                string country = dr.GetString(5);
                                string image = dr.GetString(6);
                                string review = dr.GetString(7);

                                Book book = new Book(id, name, author, price, genre, country, image, review);
                                list.Add(book);
                            }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            return list;

        }

        public Book GetBookById(int id)
        {
            Book book = null;
            try
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    conn.Open();
                    using (SqlCommand com = conn.CreateCommand())
                    {
                        com.Parameters.AddWithValue("@id", id);
                        com.CommandText = "SELECT * FROM book WHERE id = @id";

                        using (SqlDataReader dr = com.ExecuteReader())
                        {
                            while (dr.Read())
                            {
                                string name = dr.GetString(1);
                                string author = dr.GetString(2);
                                double price = dr.GetDouble(3);
                                string genre = dr.GetString(4);
                                string country = dr.GetString(5);
                                string image = dr.GetString(6);
                                string review = dr.GetString(7);

                                book = new Book(name, author, price, genre, country, image, review);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            
            return book;
        }

        public void AddBook(Book book)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    conn.Open();
                    using (SqlCommand com = conn.CreateCommand())
                    {
                        com.Parameters.AddWithValue("@name", book.Name);
                        com.Parameters.AddWithValue("@author", book.Author);
                        com.Parameters.AddWithValue("@price", book.Price);
                        com.Parameters.AddWithValue("@genre", book.Genre);
                        com.Parameters.AddWithValue("@country", book.Country);
                        com.Parameters.AddWithValue("@image", book.Image);
                        com.Parameters.AddWithValue("@review", book.Review);

                        com.CommandText =
                            "INSERT INTO book VALUES (@name, @author, @price, @genre, @country, @image, @review)";

                        com.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }


    }
}