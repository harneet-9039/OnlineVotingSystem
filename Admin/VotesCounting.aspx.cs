using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Globalization;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using DataSet1TableAdapters;
using votingTableAdapters;

public partial class Admin_VotesCounting : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Session.Abandon();
            Response.Redirect("officeradminLogin.aspx");
        }

        if (Page.IsPostBack) return;
        FillElectionState();
        FillElectionDistrict();

    }
    protected void Logout_btn_Click(object sender, EventArgs e)
    {
        Session["Admin"] = null;
        Response.Redirect("officeradminLogin.aspx");
    }

    protected void Statewise_btn_Click(object sender, EventArgs e)
    {
        StateSelect_pnl.Visible = true;
        Select_pnl.Visible = false;
    }

    public void FillElectionState()
    {
        try
        { 
        GetStateTableAdapter St = new GetStateTableAdapter();
        DataTable dt = new DataTable();
        dt = St.GetElectionState();
        State_ddl.DataSource = dt;
        State_ddl.DataValueField = "StateID";
        State_ddl.DataTextField = "StateName";
        State_ddl.DataBind();
        ListItem li = new ListItem("---select---", "-1");
        State_ddl.Items.Insert(0, li);
        }

        catch(Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Repeated Election are taking place in same state..!.');window.location='Welcome2.aspx';", true);

        }

    }

    protected void GetVote_btn_Click(object sender, EventArgs e)
    {
        StateSelect_pnl.Visible = false;
        StateWise_pnl.Visible = true;
        string dateString = Sdate_txt.Text;
        string format = "dd/mm/yyyy";
        DateTime dateTime = DateTime.ParseExact(dateString, format, CultureInfo.InvariantCulture);
        string strNewDate = dateTime.ToString("yyyy-dd-mm");
        GetVotesByStateTableAdapter VS = new GetVotesByStateTableAdapter();
        DataTable dt = new DataTable();
        dt = VS.GetVotesByState(State_ddl.SelectedValue, strNewDate);
        Electionprocess_rpt.DataSource = dt;
        Electionprocess_rpt.DataBind();

    }

    protected void GetDistrictVote_btn_Click(object sender, EventArgs e)
    {
        DistrictWiseSelect_pnl.Visible = false;
        DistrictVotes_pnl.Visible = true;
        string dateString = Sdate1_txt.Text;
        string format = "dd/mm/yyyy";
        DateTime dateTime = DateTime.ParseExact(dateString, format, CultureInfo.InvariantCulture);
        string strNewDate = dateTime.ToString("yyyy-dd-mm");
        GetStateAccorDingDistrictVotesTableAdapter GS = new GetStateAccorDingDistrictVotesTableAdapter();
        DataTable dt = new DataTable();
        dt = GS.GetVotesByDistrict(DistrictWise_ddl.SelectedValue, strNewDate);
        DistrictWise_rpt.DataSource = dt;
        DistrictWise_rpt.DataBind();
    }

    protected void Districtwise_btn_Click(object sender, EventArgs e)
    {
        DistrictWiseSelect_pnl.Visible = true;
        Select_pnl.Visible = false;
        
    }

    public void FillElectionDistrict()
    {
        GetElectionDistrictTableAdapter ED = new GetElectionDistrictTableAdapter();
        DataTable dt = new DataTable();
        dt = ED.GetElectionDistrict();
        DistrictWise_ddl.DataSource = dt;
        DistrictWise_ddl.DataValueField = "DistrictID";
        DistrictWise_ddl.DataTextField = "DistrictName";
        DistrictWise_ddl.DataBind();
        ListItem li = new ListItem("---select---", "-1");
        DistrictWise_ddl.Items.Insert(0, li);
    }


}
