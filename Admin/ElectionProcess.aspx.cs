using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using DataSet1TableAdapters;
using System.Drawing;

public partial class Admin_ElectionProcess : System.Web.UI.Page
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
        GetElectionProcessTableAdapter gt = new GetElectionProcessTableAdapter();
        DataTable dt = new DataTable();
        dt = gt.GetElectionProcess();
        Electionprocess_rpt.DataSource = dt;
        Electionprocess_rpt.DataBind();
    }

    public string CheckStatus(string ElectionEDate, string ElectionStartDate)
    {

        DateTime Sdate = DateTime.Parse(ElectionStartDate);
        DateTime date = DateTime.Parse(ElectionEDate);
        DateTime NowDate = DateTime.Now ;
        TimeSpan TS2 = (NowDate.Subtract(Sdate)); 
        TimeSpan ts = (date.Subtract(NowDate));
        string msg = "<span style='color:{0}'>Yet To Come</span>";
        string msg1 = "<span style='color:{0}'>Completed</span>";
        string msg2 = "<span style='color:{0}'>Cannot Determine</span>";
        string msg3 = "<span style='color:{0}'>In Progress</span>";

        if (ts.TotalDays >= 0 && TS2.Hours > 0)
        {

            return string.Format(msg3, "blue");
        }
        else if (ts.TotalDays >= 0 && TS2.Hours < 0)
        {
            return string.Format(msg,"green");
        }
        else if (ts.TotalDays < 0)
        {
            return string.Format(msg1, "red");
        }
        else
        {
            return string.Format(msg2, "aqua");
        }

           
    }
}