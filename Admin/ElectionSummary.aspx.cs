using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataSet1TableAdapters;

public partial class Admin_ElectionSummary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("officeradminlogin.aspx");
        }

        if (Page.IsPostBack) return;
        BindProcess();

    }

    protected void Logout_btn_Click(object sender, EventArgs e)
    {


        Session["Admin"] = null;
        Response.Redirect("officeradminLogin.aspx");

    }

    public void BindProcess()
    {
        GetElectionSummaryTableAdapter ES = new GetElectionSummaryTableAdapter();
        DataTable dt = new DataTable();
        dt = ES.GetElectionSummary();
        Electionprocess_rpt.DataSource = dt;
        Electionprocess_rpt.DataBind();
    }


    protected void Select_btn_Click(object sender, EventArgs e)
    {
        CallElectionSummaryProcedureTableAdapter CE = new CallElectionSummaryProcedureTableAdapter();
        object chk = CE.ElectionSummaryProcedure();
        int Chk = Convert.ToInt32(chk);
        if(Chk==0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Cannot Get Latest Details. Try again after some time');window.location='ElectionSummary.aspx';", true);

        }
        else
        {
            BindProcess();
        }

    }
}