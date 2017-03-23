using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Bookshop
{
    public class UsersManager
    {
        private static string _connectionString;

        public UsersManager()
        {
            _connectionString = ConfigurationManager.ConnectionStrings["BooksDB_CS"].ConnectionString;
        }

        public UsersManager(string connectionString)
        {
            _connectionString = connectionString;
        }

        public User LoginUser(string login, string password)
        {
            User user = null;
            try
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    conn.Open();
                    using (SqlCommand com = conn.CreateCommand())
                    {
                        com.Parameters.AddWithValue("@name", login);
                        com.CommandText = "SELECT COUNT(id) FROM users WHERE name = @name";

                        int amountOfUsers = (int) com.ExecuteScalar();
                        if (amountOfUsers == 1)
                        {

                            com.CommandText = "SELECT password FROM users WHERE name = @name";

                            string dbPassword = com.ExecuteScalar().ToString();

                            if (dbPassword == password)
                            {
                                com.CommandText = "SELECT email, user_type FROM users WHERE name = @name";

                                using (SqlDataReader dr = com.ExecuteReader())
                                {
                                    while (dr.Read())
                                    {
                                        string email = dr.GetString(0);
                                        string type = dr.GetString(1);

                                        user = new User(login, password, email, type);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

            return user;
        }

        public string RegisterUser(User user)
        {
            string registrationMessage = "";
            try
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    conn.Open();
                    using (SqlCommand com = conn.CreateCommand())
                    {
                        com.Parameters.AddWithValue("@name", user.Name);
                        com.CommandText = "SELECT COUNT(id) from users WHERE name=@name";

                        int amountOfUsers = (int)com.ExecuteScalar();

                        if (amountOfUsers < 1)
                        {
                            com.Parameters.AddWithValue("@password", user.Password);
                            com.Parameters.AddWithValue("@email", user.Email);
                            com.Parameters.AddWithValue("@type", user.Type);

                            com.CommandText = "INSERT INTO users VALUES (@name, @password, @email, @type)";

                            com.ExecuteNonQuery();

                            registrationMessage = "Registration successful";
                        }
                        else
                        {
                            registrationMessage = "Registration failed, username already exists";
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }


            return registrationMessage;
        }

        public User GetUserDetails(string userName)
        {
            User user = null;
            try
            {
                using (SqlConnection conn = new SqlConnection(_connectionString))
                {
                    conn.Open();
                    using (SqlCommand com = conn.CreateCommand())
                    {
                        com.Parameters.AddWithValue("@userName", userName);
                        com.CommandText = "SELECT * FROM users WHERE name = @userName";

                        using (SqlDataReader dr = com.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                
                                int id = dr.GetInt32(0);
                                string name = dr.GetString(1);
                                string password = dr.GetString(2);
                                string email = dr.GetString(3);
                                string userType = dr.GetString(4);

                                user = new User(id, name, password, email, userType);
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

            return user;
        }
    }
}