using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Security;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Security.Cryptography;
using DataSet1TableAdapters;

public partial class Citizen_Login : System.Web.UI.Page
{
    
   
    protected void Page_Load(object sender, EventArgs e)
    {
        

    }

    

    protected void clear_btn_Click1(object sender, EventArgs e)
    {
        Userid_txt.Text = "";
         UserName_txt.Text = "";
         Page.MaintainScrollPositionOnPostBack = true;
    }

    protected void Signin_btn_Click(object sender, EventArgs e)
    {
        int ID=int.Parse(Userid_txt.Text);
        string Pwd= Txt_pwd.Text;
        LoginUserTableAdapter LU = new LoginUserTableAdapter();
        object Check = LU.LoginUser(ID, Pwd);
        string d= Convert.ToString(Check);
        string p="null";
        bool sr=Convert.ToBoolean(string.Compare(d,p));

        if(sr==true)
        {
            ID_hfd.Value = Convert.ToString(Check);
            Session["User"] = Userid_txt.Text;
            Session.Timeout = 1;
           
            Response.Redirect("Vote.aspx?id=" + ID_hfd.Value);
        }
        else
        {
            Error_lbl.Text = "UserID or Password Does Not Match";
           
        }

        /*bool Chk = Convert.ToBoolean(Check);
        if (Chk == false)
        {
            Response.Write("false");
        }
        else
        {
            ID_hfd.Value = Convert.ToString(Check);
            Response.Write("success");
        }*/
   

    }
}
