using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace MITComputerWebForm.Pages
{
    public partial class Category : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Khai báo mở kết nối đến CSDL
            using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
            {
                string querystring = "SELECT * FROM DANHMUC";
                SqlCommand command = new SqlCommand(querystring,connection);
                connection.Open();
                //Khai báo đối tượng đọc dữ liệu từ kết quả câu truy vấn 
                SqlDataReader datareader = command.ExecuteReader();
                //Đọc dữ liệu từ đối tượng DataReader


            }

        }
    }
}