using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Globalization;
using DataSet1TableAdapters;

public partial class Admin_Welcome2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

       if (Session["Admin"] == null)
        {
            Session.Abandon();
            Response.Redirect("officeradminLogin.aspx");
        }
      
     
        
    }


    protected void Start_btn_Click(object sender, EventArgs e)
    {
        Welcome_Lbl.Visible = false;
        Start_btn.Visible = false;
        Startvoting_Panel.Visible = true;
        FillState();
        GetPost();
       
    }

    protected void btnStart_Click(object sender, EventArgs e)
    {

        string dateString = Sdate_txt.Text;
        string format = "dd/mm/yyyy";
        DateTime dateTime = DateTime.ParseExact(dateString, format, CultureInfo.InvariantCulture);
        string strNewDate = dateTime.ToString("yyyy-dd-mm");
        DateTime dts = DateTime.Parse(strNewDate);

        string dateString1 = Edate_txt.Text;
        DateTime dateTime1 = DateTime.ParseExact(dateString1, format, CultureInfo.InvariantCulture);
        string strEndDate = dateTime1.ToString("yyyy-dd-mm");
        DateTime dts1 = DateTime.Parse(strEndDate);


        Startvoting_Panel.Visible = false;
        StartElectionTableAdapter SE = new StartElectionTableAdapter();
        object Chk = SE.CheckElection(State_ddl.SelectedValue, Post_ddl.SelectedValue, dts, dts1);
        bool Check = Convert.ToBoolean(Chk);
        if (Check == true)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Election Started successfully.');window.location='Welcome2.aspx';", true);

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('There Was An Error,Elections Are Already in Process In this State in this Time or in this Period. Try Again After Some Time.');window.location='Welcome2.aspx';", true);

        }
    }

    protected void Logout_btn_Click(object sender, EventArgs e)
    {
        Session["Admin"] = null;
        Response.Redirect("officeradminLogin.aspx");
    }

    public void FillState()
    {
        DataTable dt = new DataTable();
        GetStateTableAdapter dv = new GetStateTableAdapter();
        dt = dv.GetDataBy();
        State_ddl.DataSource = dt;
        State_ddl.DataValueField = "StateID";
        State_ddl.DataTextField = "StateName";
        State_ddl.DataBind();
        ListItem li = new ListItem("---select---", "-1");
        State_ddl.Items.Insert(0, li);

       
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
}