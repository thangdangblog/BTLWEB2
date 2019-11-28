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
    public partial class User : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["page"] = "user";
        }

        public ArrayList getAllNV()
        {
            string queryString = "SELECT Id,email,fullname,isadmin FROM NHANVIEN WHERE Id <> '5' ORDER BY Id DESC";

            ArrayList Nhanviens = new ArrayList();

            

            using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
            {
                

                SqlCommand command = new SqlCommand(queryString, connection);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        string[] Nhanvien = new string[5];
                        Nhanvien[0] = reader.GetInt32(0).ToString();
                        Nhanvien[1] = reader.GetString(1).ToString();
                        Nhanvien[2] = reader.GetString(2).ToString();
                        Nhanvien[3] = reader.GetBoolean(3).ToString();
                        Nhanviens.Add(Nhanvien);
                    }
                    
                }

                connection.Close();

            }

            return Nhanviens;
        }

        public string getRole(string role)
        {
            string roleofuser;
            roleofuser = role == "True" ? "Quản lý" : "Nhân viên";
            return roleofuser;
        }

        public string getClassRole(string role)
        {
            string classRole;
            classRole = role == "True" ? "label-danger" : "label-warning";
            return classRole;
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
                        if(reader[0].ToString() == "True")
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

    }
}