using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using votingTableAdapters;


public partial class Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Page.IsPostBack) return;
        GetCurrentElectionDataListTableAdapter gt = new GetCurrentElectionDataListTableAdapter();
        DataTable dt = new DataTable();
        dt = gt.GetCurrentElections();
        CurrentElectionDataList.DataSource = dt;
        CurrentElectionDataList.DataBind();

    }

    public string CheckStatus(string StateID)
    {
        
        String Path = "~/StatePics/" + StateID + ".jpg";
        return Path;
    }
}
