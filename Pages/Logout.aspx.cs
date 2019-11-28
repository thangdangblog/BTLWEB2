using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MITComputerWebForm.Pages
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userid"] != null)
            {
                Session["userid"] = null;
                Response.Redirect("/pages/login");
            }
            else
            {
                Response.Redirect("/pages/login");
            }
        }
    }
}