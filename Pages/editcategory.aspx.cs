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
    public partial class editcategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtCatName.Text = this.nameCate();
            }
        }

        public string idCate()
        {
            return Request.QueryString["id"];
        }

        public string nameCate()
        {
            string name = "";
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = share.Share.connectionString;
                conn.Open();
                string querystring = "SELECT name FROM DANHMUC WHERE Id = '"+ this.idCate() + "'";
                SqlCommand command = new SqlCommand(querystring, conn);

                //Khai báo đối tượng đọc dữ liệu từ kết quả câu truy vấn 

                using (SqlDataReader datareader = command.ExecuteReader())
                {
                    //Đọc dữ liệu từ đối tượng DataReader
                    while (datareader.Read())
                    {
                        name = datareader[0].ToString();
                    }

                }

                conn.Close();
            }
            return name;
        }
         public string nameupdate()
        {
            string nameup = "";
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = share.Share.connectionString;
                conn.Open();
                string querystring = "UPDATE DANHMUC SET'" + txtCatName.Text+ "' Name= WHERE Id = '" + this.idCate() + "'";
                SqlCommand command = new SqlCommand(querystring, conn);

                //Khai báo đối tượng đọc dữ liệu từ kết quả câu truy vấn 

                using (SqlDataReader datareader = command.ExecuteReader())
                {
                    //Đọc dữ liệu từ đối tượng DataReader
                    while (datareader.Read())
                    {
                        nameup = datareader[0].ToString();
                    }

                }

                conn.Close();
            }
            return nameup;
        }
        public static ArrayList getAllCategories()
        {
            ArrayList Category = new ArrayList();

            //Khai báo mở kết nối đến CSDL
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\BTL-qlibanhangweb2\BTLWEB2\App_Data\QLMIT.mdf;Integrated Security=True";
                conn.Open();
                string querystring = "SELECT * FROM DANHMUC";
                SqlCommand command = new SqlCommand(querystring, conn);

                //Khai báo đối tượng đọc dữ liệu từ kết quả câu truy vấn 

                using (SqlDataReader datareader = command.ExecuteReader())
                {
                    //Đọc dữ liệu từ đối tượng DataReader
                    while (datareader.Read())
                    {
                        String[] strCategory = new string[2];
                        strCategory[0] = datareader[0].ToString();
                        strCategory[1] = datareader[1].ToString();

                        Category.Add(strCategory);
                    }

                }


                conn.Close();
            }

            return Category;
        }

        protected void btnSaveCategory_Click(object sender, EventArgs e)
        {
            this.nameupdate();
            Response.Redirect("Category.aspx");
        }

        protected void btnDetroyCategory_Click(object sender, EventArgs e)
        {
            Response.Redirect("Category.aspx");
        }
    }


}

