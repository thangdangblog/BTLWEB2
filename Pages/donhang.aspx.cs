using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MITComputerWebForm.Pages
{
    public partial class donhang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["page"] = "donhang";
        }


        public ArrayList getAllDH()
        {
            string queryString = "SELECT * FROM DONHANG";

            ArrayList Donhangs = new ArrayList();



            using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
            {


                SqlCommand command = new SqlCommand(queryString, connection);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string[] donhang = new string[10];
                        donhang[0] = reader[0].ToString();
                        donhang[1] = reader[1].ToString();
                        donhang[2] = reader[2].ToString();
                        donhang[3] = reader[3].ToString();
                        donhang[4] = reader[4].ToString();
                        donhang[5] = reader[5].ToString();
                        donhang[6] = reader[6].ToString();

                        Donhangs.Add(donhang);
                    }

                }

                connection.Close();

            }

            return Donhangs;
        }


        public bool getCurrentRole()
        {
            string username = Session["username"].ToString();

            string queryString = "SELECT isadmin FROM NHANVIEN WHERE email = '" + username + "'";

            using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
            {


                SqlCommand command = new SqlCommand(queryString, connection);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        if (reader[0].ToString() == "True")
                        {
                            return true;
                        }
                        return false;
                    }
                }

                connection.Close();

            }
            return false;
        }

        public string getNameProduct(string masanpham)
        {
            string nameProduct = "";
            string queryString = "SELECT tensanpham FROM SANPHAM WHERE masanpham = '" + masanpham + "'";

            using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
            {


                SqlCommand command = new SqlCommand(queryString, connection);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        nameProduct = reader[0].ToString();
                    }
                }

                connection.Close();
            }

            return nameProduct;
        }

        public string getNameNhanVien(string manhanvien)
        {
            string fullname = "";
            string queryString = "SELECT fullname FROM NHANVIEN WHERE Id = '" + manhanvien + "'";

            using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
            {


                SqlCommand command = new SqlCommand(queryString, connection);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        fullname = reader[0].ToString();
                    }
                }

                connection.Close();
            }

            return fullname;
        }

        public ArrayList getSanPham()
        {
            string queryString = "SELECT Id,masanpham,tensanpham,giasanpham FROM SANPHAM";

            ArrayList Sanphams = new ArrayList();

            using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
            {

                SqlCommand command = new SqlCommand(queryString, connection);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string[] sanpham = new string[10];
                        sanpham[0] = reader[0].ToString();
                        sanpham[1] = reader[1].ToString();
                        sanpham[2] = reader[2].ToString();
                        sanpham[3] = reader[3].ToString();

                        Sanphams.Add(sanpham);
                    }

                }

                connection.Close();

            }

            return Sanphams;
        }

    }


}
