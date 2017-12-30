using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using votingTableAdapters;
using System.Data;

public partial class UpcomingElections : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack) return;
        BindProcess();
    }

    public void BindProcess()
    {
        Upcoming_ElectionsTableAdapter UE=new Upcoming_ElectionsTableAdapter();
        DataTable dt = new DataTable();
        dt = UE.GetUpcomingElection();
        Electionprocess_rpt.DataSource = dt;
        Electionprocess_rpt.DataBind();
    }
}