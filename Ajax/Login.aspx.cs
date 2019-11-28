using Newtonsoft.Json;
using System;
using System.Collections.Generic;
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
                var Account  = new Dictionary<string, string>();
                Account.Add("inputEmail", Request.QueryString["inputEmail"].ToString());
                Account.Add("inputPassword", Request.QueryString["inputPassword"].ToString());



                return JsonConvert.SerializeObject(Account, Formatting.Indented);
            }

            return "false";
        }

    }
}