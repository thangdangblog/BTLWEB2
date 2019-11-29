using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MITComputerWebForm.Pages
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["page"] = "dashboard";
        }

        public int getNewOrder()
        {
            int newOrder = 0;

            string queryString = "SELECT COUNT(*) FROM DONHANG";

            using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
            {

                SqlCommand command = new SqlCommand(queryString, connection);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        int.TryParse(reader[0].ToString(),out newOrder);
                    }
                }

                connection.Close();
            }

            return newOrder;
        }

        public int getNhanVien()
        {
            int nhanvien = 0;

            string queryString = "SELECT COUNT(*) FROM NHANVIEN";

            using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
            {

                SqlCommand command = new SqlCommand(queryString, connection);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        int.TryParse(reader[0].ToString(), out nhanvien);
                    }
                }

                connection.Close();
            }

            return nhanvien - 1 ;
        }

        public int getProduct()
        {
            int product = 0;

            string queryString = "SELECT COUNT(*) FROM SANPHAM";

            using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
            {

                SqlCommand command = new SqlCommand(queryString, connection);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        int.TryParse(reader[0].ToString(), out product);
                    }
                }

                connection.Close();
            }

            return product;
        }

    }
}