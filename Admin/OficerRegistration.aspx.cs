using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSet1TableAdapters;
using System.Data;

public partial class Admin_OficerRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("officeradminlogin.aspx");
        }
        

        if (Page.IsPostBack) return;
        FillParty();
        FillDistrict();

    }
    protected void Confirm_btn_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            InsertCandidateTableAdapter IC = new InsertCandidateTableAdapter();
            object Chk = IC.InsertCandidate(User_txt.Text, Party_ddl.SelectedValue, District_ddl.SelectedValue);
            bool Check = Convert.ToBoolean(Chk);
            if (Check == true)
            {
                //Confirm_lbl.Text = "Canidate Registered";
                //Response.Redirect("OficerRegistration.aspx");

                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Oficer Added successfully.');window.location='OficerRegistration.aspx';", true);
            }
            else
            {
                Confirm_lbl.Text = "Canidate Cannot be Registered At This Moment";
                User_txt.Text = "";
                Party_ddl.SelectedIndex = -1;
                District_ddl.SelectedIndex = -1;
            }
        }

    }

    public void FillParty()
    {
        GetPartyTableAdapter PT = new GetPartyTableAdapter();
        DataTable pt = new DataTable();
        pt = PT.GetPartyForAdmin();
        Party_ddl.DataSource = pt;
        Party_ddl.DataTextField = "PartyName";
        Party_ddl.DataValueField = "PartyID";
        Party_ddl.DataBind();
        ListItem li = new ListItem("--select---", "-1");
        Party_ddl.Items.Insert(0, li);

    }

   public void FillDistrict()
   {
            DataTable dt = new DataTable();
            LoginUserTableAdapter gt = new LoginUserTableAdapter();
           dt = gt.GetDistrictByState(" ");
           District_ddl.DataSource = dt;
           District_ddl.DataValueField = "DistrictID";
           District_ddl.DataTextField = "DistrictName";
           District_ddl.DataBind();
           ListItem lit = new ListItem("--select---", "-1");
           District_ddl.Items.Insert(0, lit);
   }



   protected void Logout_btn_Click(object sender, EventArgs e)
   {
   
           Session["Admin"] = null;
           Response.Redirect("officeradminLogin.aspx");
       
   }
}