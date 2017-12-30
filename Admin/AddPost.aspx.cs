using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSet1TableAdapters;
using System.Data;
using votingTableAdapters;

public partial class Admin_AddPost : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("officeradminLogin.aspx");
        }

        if (Page.IsPostBack) return;
        GetPost();

    }

    protected void Logout_btn_Click(object sender, EventArgs e)
    {
        Session["Admin"] = null;
        Response.Redirect("officeradminLogin.aspx");
    }

    public void GetPost()
    {
        DataTable dt = new DataTable();
        GetPostTableAdapter PT = new GetPostTableAdapter();
        dt = PT.GetPost();
        Post_ddl.DataSource = dt;
        Post_ddl.DataValueField = "PostID";
        Post_ddl.DataTextField = "PostName";
        Post_ddl.DataBind();
        ListItem li = new ListItem("---select---", "-1");
        Post_ddl.Items.Insert(0, li);
    }


    protected void Confirm_btn_Click(object sender, EventArgs e)
    {
        InsertPostTableAdapter it = new InsertPostTableAdapter();
        object Value = it.InsertPost(Post_txt.Text);
        bool chk = Convert.ToBoolean(Value);
        if(chk == true)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Post added Successfully.');window.location='Welcome2.aspx';", true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Post adding failed. Try after some time');window.location='Welcome2.aspx';", true);
        }
    }
}