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
    public partial class AddCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void btnAddCategory_Click(object sender, EventArgs e)
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
                cmd.CommandText = "proInsertCat";
                cmd.CommandType = System.Data.CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Name", txtCatName.Text);

                try
                {
                    string sql = "Select Count(*) from DANHMUC where Name ='" + txtCatName.Text + "'";
                    SqlCommand cmd2 = new SqlCommand(sql, conn);
                    int dem = (int)cmd2.ExecuteScalar();
                    if (dem > 0)
                    {
                        Response.Write("Danh mục đã tồn tại!");
                        txtCatName.Text = "";
                        txtCatName.Focus();
                    }
                    else
                    {
                        cmd.ExecuteNonQuery();
                        Response.Write("<script LANGUAGE='JavaScript'> alert('Thêm danh mục thành công)</script>");
                        Response.Redirect("Category.aspx")
                    }
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