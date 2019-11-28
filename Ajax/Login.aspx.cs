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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public string loginHandle()
        {

            if (Request.QueryString["action"] != null && Request.QueryString["action"].ToString() == "login")
            {

                string inputEmail = Request.QueryString["inputEmail"].ToString();

                string inputPassword = Request.QueryString["inputPassword"].ToString();

                string queryString = "SELECT COUNT(*) FROM NHANVIEN WHERE email = '"+ inputEmail + "' AND password = '"+ share.Share.getMd5Hash(inputPassword) + "' ";

                using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
                {
                    SqlCommand command = new SqlCommand(queryString, connection);

                    connection.Open();

                    int isExistUser = (int)command.ExecuteScalar();

                    connection.Close();

                    if(isExistUser == 1)
                    {
                        Session["username"] = inputEmail;
                    }

                    return isExistUser.ToString();
                }
                    
            }

            return "false";
        }

    }
}