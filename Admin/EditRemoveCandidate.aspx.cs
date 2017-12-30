using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using votingTableAdapters;
using System.Data;
using DataSet1TableAdapters;

public partial class Admin_EditRemoveCandidate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["Admin"] == null)
        {
            Session.Abandon();
            Response.Redirect("officeradminLogin.aspx");
        }

        if (Page.IsPostBack) return;
        FillState();
        ListItem lit = new ListItem("---select---", "-1");
        District_ddl.Items.Insert(0, lit);

    }

    public void GetUser()
    {
        GetCandidateListTableAdapter CT = new GetCandidateListTableAdapter();
        DataTable dt1 = new DataTable();
        dt1 = CT.GetCandidateList(State_ddl.SelectedValue, District_ddl.SelectedValue);
        if (dt1 != null)
        {
            if (dt1.Rows.Count > 0)
            {
                User_grd.DataSource = dt1;
                User_grd.DataBind();

            }

        }
        if (dt1.Rows.Count == 0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('No User In Your selected State/District');window.location='EditRemoveCandidate.aspx';", true);

        }
    }

    protected void State_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {
 DataTable dt = new DataTable();
        LoginUserTableAdapter gt = new LoginUserTableAdapter();
        string guid = State_ddl.SelectedValue;
        dt = gt.GetDistrictByState(guid);
        District_ddl.DataSource = dt;
        District_ddl.DataValueField = "DistrictID";
        District_ddl.DataTextField = "DistrictName";
        District_ddl.DataBind();
        ListItem lit = new ListItem("--select---", "-1");
        District_ddl.Items.Insert(0, lit);
        Page.MaintainScrollPositionOnPostBack = true;


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
        ListItem li = new ListItem("--select---", "-1");
        State_ddl.Items.Insert(0, li);

    }
    protected void Select_btn_Click(object sender, EventArgs e)
    {
        StateSelect_pnl.Visible = false;
        StateDistrictGrid_pnl.Visible = true;
        GetUser();
        User_grd.Visible = true;


    }







    protected void User_grd_RowEditing(object sender, GridViewEditEventArgs e)
    {
        User_grd.EditIndex = e.NewEditIndex;
        GetUser();
       
    }

    protected void User_grd_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        User_grd.EditIndex = -1;
        GetUser();
        Message_lbl.Visible = false;

    }

    protected void User_grd_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        Id_hfd.Value = User_grd.DataKeys[User_grd.EditIndex].Value.ToString();
        DropDownList Ddl = (DropDownList)User_grd.Rows[e.RowIndex].FindControl("Stategrd_ddl");
        DropDownList Ddl1 = (DropDownList)User_grd.Rows[e.RowIndex].FindControl("Districtgrd_ddl");
        DropDownList Ddl2 = (DropDownList)User_grd.Rows[e.RowIndex].FindControl("Party_ddl");
        TextBox Txt1 = (TextBox)User_grd.Rows[e.RowIndex].FindControl("Name_txt");
        string id = User_grd.DataKeyNames[e.RowIndex].ToString();
        UpdateVoterTableAdapter Vt = new UpdateVoterTableAdapter();
        object Chk = Vt.UpdateCandidateList(Id_hfd.Value, Txt1.Text, Ddl2.SelectedValue, Ddl1.SelectedValue);
        bool Check = Convert.ToBoolean(Chk);
        if(Check==true)
        {

           // ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Candidate Updated Successfully');window.location='EditRemoveCandidate.aspx';", true);
            StateSelect_pnl.Visible = false;
            StateDistrictGrid_pnl.Visible = true;
            User_grd.EditIndex = -1;
            GetUser();
            User_grd.Visible = true;
        }
        else
        {
            Message_lbl.Text = "Cannot Update At this Time";
            Message_lbl.ForeColor = System.Drawing.Color.Red;
        }
        


    }

    protected void User_grd_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        DataRowView drv = e.Row.DataItem as DataRowView;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {
                DropDownList dp = (DropDownList)e.Row.FindControl("Stategrd_ddl");
                DataTable dt = new DataTable();
                GetStateTableAdapter dv = new GetStateTableAdapter();
                dt = dv.GetDataBy();
                dp.DataSource = dt;
                dp.DataValueField = "StateID";
                dp.DataTextField = "StateName";
                dp.DataBind();
                ListItem lit = new ListItem("--select---", "-1");
                dp.Items.Insert(0, lit);

            }
            if ((e.Row.RowState & DataControlRowState.Edit) > 0)
            {

                DropDownList Party = (DropDownList)e.Row.FindControl("Party_ddl");
                DataTable pt = new DataTable();
                GetPartyTableAdapter PT = new GetPartyTableAdapter();
                pt = PT.GetParty();
                Party.DataSource = pt;
                Party.DataValueField = "PartyID";
                Party.DataTextField = "PartyName";
                Party.DataBind();
                ListItem lit = new ListItem("--select---", "-1");
                Party.Items.Insert(0, lit);
            }
            
        }
        }

    protected void Stategrd_ddl_SelectedIndexChanged(object sender, EventArgs e)
    {

        GridViewRow gvr = (GridViewRow)((DropDownList)sender).Parent.Parent;  //finding which row has fired dropdownlist event
        DropDownList ddl = (DropDownList)sender;  //converting to dropdownlist
        DropDownList Ddlsecond = gvr.FindControl("Districtgrd_ddl") as DropDownList;

        DropDownList State = (DropDownList)sender;  //converting to dropdownlist
        DropDownList DdlFirst = gvr.FindControl("Stategrd_ddl") as DropDownList;

        DataTable dt = new DataTable();
        LoginUserTableAdapter gt = new LoginUserTableAdapter();
        string guid = DdlFirst.SelectedValue;
        dt = gt.GetDistrictByState(guid);
        Ddlsecond.DataSource = dt;
        Ddlsecond.DataValueField = "DistrictID";
        Ddlsecond.DataTextField = "DistrictName";
        Ddlsecond.DataBind();
        ListItem lit = new ListItem("--select---", "-1");
        Ddlsecond.Items.Insert(0, lit);


    }

    protected void User_grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        User_grd.EditIndex = e.RowIndex;
        Id_hfd.Value = User_grd.DataKeys[User_grd.EditIndex].Value.ToString();
        UpdateVoterTableAdapter VT = new UpdateVoterTableAdapter();
        object Chk = VT.DeleteCandidate(Id_hfd.Value);
        bool chk = Convert.ToBoolean(Chk);
        if (chk == true)
        {
            User_grd.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Voter deleted successfully.');window.location='EditRemoveCandidate.aspx';", true);

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Voter deletion Failed');window.location='EditRemoveCandidate.aspx';", true);

        }
    }
}