using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MITComputerWebForm.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //string email = "thangdangblog@gmail.com";
            //string password = Request["inputPassword"];
        }

        public string getEmail()
        {
            string email = "thangdangblog@gmail.com";
            return email;
        }
    }
}