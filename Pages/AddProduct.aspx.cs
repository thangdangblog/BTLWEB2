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
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddProduct_Click(object sender, EventArgs e)
        {
            using (SqlConnection conn = new SqlConnection())
            {
                conn.ConnectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=D:\BTL-qlibanhangweb2\BTLWEB2\App_Data\QLMIT.mdf;Integrated Security=True";
                conn.Open();
                //string sql = "insert into DANHMUC values(";
                //sql += "N'" + txtCatName.Text + "')";
                //SqlCommand cmd = new SqlCommand(sql, conn);
                //cmd.ExecuteNonQuery();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "proInsertPrd";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@masanpham", txtPrdCode.Text);
                cmd.Parameters.AddWithValue("@tensanpham", txtPrdName.Text);
                cmd.Parameters.AddWithValue("@danhmuc", txtPrdCat.Text);
                cmd.Parameters.AddWithValue("@soluong", txtPrdNumber.Text);
                cmd.Parameters.AddWithValue("@giasanpham", txtPrdPrice.Text);

                try
                {
                    
                    cmd.ExecuteNonQuery();
                    Response.Redirect("Product.aspx");
                }
                catch (Exception)
                {
                    Response.Write("Thêm mới thất bại");
                }
                conn.Close();

            }
        }
    }
}