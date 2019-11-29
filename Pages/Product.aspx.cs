using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Collections;


namespace MITComputerWebForm.Pages
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected static ArrayList getAllProduct()
        {
            ArrayList Product = new ArrayList();
            //Khai báo mở kết nối đến CSDL
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\BTL-qlibanhangweb2\BTLWEB2\App_Data\QLMIT.mdf;Integrated Security=True";
                conn.Open();
                string querystring = "SELECT * FROM SANPHAM";
                SqlCommand command = new SqlCommand(querystring, conn);

                //Khai báo đối tượng đọc dữ liệu từ kết quả câu truy vấn 

                using (SqlDataReader datareader = command.ExecuteReader())
                {
                    //Đọc dữ liệu từ đối tượng DataReader
                    while (datareader.Read())
                    {
                        String[] strProduct = new string[6];
                        for (int i = 0; i < 6; i++)
                        {
                            strProduct[i] = datareader[i].ToString();
                        }


                        Product.Add(strProduct);
                    }

                }


                conn.Close();
            }
            return Product;
        }
        public static string getStatus(string sl)
        {
            int soluong;
            string status;
            int.TryParse(sl,out soluong);
            if (soluong > 0)
            {
                status = "<span class='label label-success'>Còn hàng</span>";
            }
            else
            {
                status = "<span class='label label-danger'>Hết hàng</span>";
            }

            return status;
        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddProduct.aspx");
        }
    }
}