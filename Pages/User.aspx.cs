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

            
        }

        public ArrayList getAllNV()
        {
            string queryString = "SELECT Id,email,fullname,isadmin FROM NHANVIEN";

            ArrayList Nhanviens = new ArrayList();

            string[] Nhanvien = new string[10];

            using (SqlConnection connection = new SqlConnection(share.Share.connectionString))
            {
                

                SqlCommand command = new SqlCommand(queryString, connection);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Nhanvien[0] = reader[0].ToString();
                        Nhanvien[1] = reader[1].ToString();
                        Nhanvien[2] = reader[2].ToString();
                        Nhanvien[3] = reader[3].ToString();
                    }
                    Nhanviens.Add(Nhanvien);
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

    }
}