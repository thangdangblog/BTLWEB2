using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MITComputerWebForm.Ajax
{
    public partial class addNV : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string addNVHandle()
        {
            if (Request.QueryString["action"] != null && Request.QueryString["action"].ToString() == "addnv")
            {

                string email = Request.QueryString["email"].ToString();

                string fullname = Request.QueryString["fullname"].ToString();

                string password = share.Share.getMd5Hash(Request.QueryString["password"].ToString());

                if (this.existEmail(email))
                {
                    return "exist";
                }

                string queryString = "INSERT INTO NHANVIEN (email,password,fullname,isadmin) VALUES ('" + email + "','" + password + "',N'" + fullname + "','false') ";

                using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
                {
                    SqlCommand command = new SqlCommand(queryString, connection);

                    connection.Open();

                    string result = command.ExecuteNonQuery().ToString();

                    connection.Close();

                    return result;
                }
            }

            if (Request.QueryString["action"] != null && Request.QueryString["action"].ToString() == "deleteNV")
            {

                string id_user = Request.QueryString["id_user"].ToString();

                string queryString = "DELETE FROM NHANVIEN WHERE Id ='"+ id_user + "'";

                using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
                {
                    SqlCommand command = new SqlCommand(queryString, connection);

                    connection.Open();

                    string result = command.ExecuteNonQuery().ToString();

                    connection.Close();

                    return result;
                }
            }

            if (Request.QueryString["action"] != null && Request.QueryString["action"].ToString() == "updateNV")
            {

                string id_user = Request.QueryString["id_user"].ToString();
                string name_user = Request.QueryString["name_user"].ToString();
                string user_role = Request.QueryString["user_role"].ToString();
                string password = Request.QueryString["password"].ToString();
                string queryString = "";

                if (password == "")
                {
                    queryString = "UPDATE NHANVIEN SET fullname = N'" + name_user + "',isadmin = '" + user_role + "' WHERE Id ='" + id_user + "'";
                }
                else
                {
                    password = share.Share.getMd5Hash(Request.QueryString["password"].ToString());
                    queryString = "UPDATE NHANVIEN SET fullname = N'" + name_user + "',isadmin = '" + user_role + "',password = '"+ password + "' WHERE Id ='" + id_user + "'";
                }
                

                using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
                {
                    SqlCommand command = new SqlCommand(queryString, connection);

                    connection.Open();

                    string result = command.ExecuteNonQuery().ToString();

                    connection.Close();

                    return result;
                }
            }

            return "false";
        }

        private bool existEmail(string email)
        {

            string queryString = "SELECT COUNT(*) FROM NHANVIEN WHERE email = '" + email + "'";

            using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
            {
                SqlCommand command = new SqlCommand(queryString, connection);

                connection.Open();

                int isExistEmail = (int)command.ExecuteScalar();

                connection.Close();

                if (isExistEmail >= 1 )
                {
                    return true;
                }

                return false;
            }
        }
    }
}