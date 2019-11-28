using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MITComputerWebForm.MasterPage
{
    public partial class Laypout : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["username"] == null)
            {
               Response.Redirect("/pages/login");
            }

        }

        public string getName()
        {
            string username = "";

            if (Session["username"] != null)
            {
                username = Session["username"].ToString();
            }

            return username;
        }

        public string getActive(string page)
        {
            string isactive;
            isactive = Session["page"].ToString() == page ? "active" : "";
            return isactive;
        }
    }
}