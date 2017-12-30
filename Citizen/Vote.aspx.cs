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
using DataSet1TableAdapters;
using votingTableAdapters;

public partial class Citizen_Vote : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["User"] == null)
        {
            Response.Redirect("Login.aspx");
        }
        if (Page.IsPostBack) return;
        GetUserDistrict();
        FillParty();
        GetUser();
        GetUserVotes();
        

        

    }

    public void FillParty()
    {
        GetPartyTableAdapter PT = new GetPartyTableAdapter();
        DataTable pt = new DataTable();
        pt = PT.GetParty();
        Party_ddl.DataSource = pt;
        Party_ddl.DataTextField = "PartyName";
        Party_ddl.DataValueField = "PartyID";
        Party_ddl.DataBind();
        ListItem li = new ListItem("--select---", "-1");
        Party_ddl.Items.Insert(0, li);
  
       
    }
    public void GetUserDistrict()
    {
        if (Session["User"] != null)
        {

            InsertCandidateTableAdapter IT = new InsertCandidateTableAdapter();
            string ID1 = Request.QueryString["id"];
            object Chk1 = IT.CheckUserDistrict(ID1);
            bool Check1 = Convert.ToBoolean(Chk1);
            if (Check1 == true)
            {

                CheckUserDistrict_pnl.Enabled = true;
               
            }
            else
            {
                msg_lbl.Visible = true;
                msg_lbl.Text = "Elections Are Not Conducted In Your State OR The Elections are over in your State";
                CheckUserDistrict_pnl.Enabled = false;
              
            }
        }

    }

    protected void Logout_btn_Click(object sender, EventArgs e)
    {
        Session["user"] = null;
        Session.RemoveAll();
        Response.Redirect("Login.aspx");
    }

    public void GetUserVotes()
    {
        if(Session["User"]!=null)
        {
            string ID=Request.QueryString["id"];
            GetIndividualUserVotesTableAdapter LU = new GetIndividualUserVotesTableAdapter();
            object Votes = LU.GetIndividualUserVotes(ID);
            Int32 Vote = Convert.ToInt32(Votes);
            Votes_lbl.Text = Vote +" "+"Time After Your Registration";

        }
    }

    public void GetUser()
    {
        if (Session["User"] != null)
        {

            string ID = Request.QueryString["id"];
            GetUserTableAdapter UT = new GetUserTableAdapter();
            DataTable dt = new DataTable();
            dt = UT.GetUser(ID);
            Voterid_text.Text = dt.Rows[0]["VoterID"].ToString();
            Welcome_lbl.Text = dt.Rows[0]["VoterName"].ToString();

        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void Vote_btn_Click(object sender, EventArgs e)
    {
        string ID=Request.QueryString["id"];
        VoteTableAdapter VT = new VoteTableAdapter();
        object chk = VT.Vote(ID, Pwd_txt.Text, Party_ddl.SelectedValue);
        bool Check = Convert.ToBoolean(chk);
        if (Check == true)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Your Vote Recorded Successfully');window.location='Vote.aspx';", true);

           
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('There Was Some Problem, These May be Possible Reasons1)Either No Candidate Opted in Your State2)You Have Already Voted 3)You Entered A Wrong Password.Try Again in Some Time.');window.location='Vote.aspx';", true);
        }

    }
}
