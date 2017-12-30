using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_officeradminlogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Vote_btn_Click(object sender, EventArgs e)
    {
        if (User_txt.Text == "admin" && Pwd_txt.Text == "admin")
        {
            Session["Admin"] = User_txt.Text;
            Session.Timeout = 10;
            Response.Redirect("Welcome2.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('UserId or Password Does Not Match');window.location='officeradminlogin.aspx';", true);

        }
    }
}