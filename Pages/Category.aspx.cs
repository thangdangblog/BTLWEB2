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
    public partial class Category : System.Web.UI.Page
    {
        private bool isSucces = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }
        
        
        public void setIsSucces(bool status)
        {
            this.isSucces = status;
        }

        public bool getIsSucces( )
        {
            return this.isSucces;
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

        protected void btnAddCat_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCategory.aspx");


        }
    }
}