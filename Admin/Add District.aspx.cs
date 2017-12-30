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

public partial class Admin_Add_District : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("officeradminLogin.aspx");
        }

        if (Page.IsPostBack) return;
        FillState();

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
    protected void Confirm_btn_Click(object sender, EventArgs e)
    {
        InsertDistrictTableAdapter dv = new InsertDistrictTableAdapter();
        object Chk = dv.InsertDistrict(State_ddl.SelectedValue, District_txt.Text);
        bool Check = Convert.ToBoolean(Chk);
        if (Check == true)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Candidate saved successfully.');window.location='Add District.aspx';", true);

        }
        else
        {
            Confirm_lbl.Text = "District Cannot be Registered At This Moment";
            District_txt.Text = "";
           State_ddl.SelectedIndex = -1;
        }
    }
}
