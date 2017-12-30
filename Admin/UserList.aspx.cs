using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using votingTableAdapters;
using DataSet1TableAdapters;
using System.Globalization;

public partial class Admin_UserList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] == null)
        {
            Response.Redirect("officeradminlogin.aspx");
        }

        if (Page.IsPostBack) return;
        FillState();
        ListItem lit = new ListItem("---select---", "-1");
        District_ddl.Items.Insert(0, lit);

    }

    public void GetUser()
    {
        GetUserListTableAdapter GT = new GetUserListTableAdapter();
        DataTable dt1 = new DataTable();
        dt1 = GT.GetUserList(State_ddl.SelectedValue,District_ddl.SelectedValue);
        if (dt1 != null)
        {
        if(dt1.Rows.Count>0)
        { 
            User_grd.DataSource = dt1;
            User_grd.DataBind();
                
            }
           
        }
       if(dt1.Rows.Count==0)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('No User In Your selected State/District');window.location='UserList.aspx';", true);
            
        }
    }
    



    protected void User_grd_SelectedIndexChanged(object sender, EventArgs e)
    {

        GetUserListTableAdapter GV = new GetUserListTableAdapter();
        DataTable dt = new DataTable();
        int rowIndex = User_grd.SelectedIndex;
        string strValue = User_grd.DataKeys[rowIndex].Value.ToString();
        dt = GV.GetUserLists(strValue);
        VoterID_txt.Text = dt.Rows[0][1].ToString();
        VoterID_txt.ReadOnly = true;
        VoterName_txt.Text = dt.Rows[0][2].ToString();
        VoterName_txt.ReadOnly = true;
        VoterFname_txt.Text = dt.Rows[0][3].ToString();
        VoterFname_txt.ReadOnly = true;
        VoterGender_txt.Text = dt.Rows[0][4].ToString();
        VoterGender_txt.ReadOnly = true;
        DOBpnl_txt.Text = dt.Rows[0][5].ToString();
        DOBpnl_txt.ReadOnly = true;
        Emailpnl_txt.Text = dt.Rows[0][6].ToString();
        Emailpnl_txt.ReadOnly = true;
        Contactpnl_txt.Text = dt.Rows[0][7].ToString();
        Contactpnl_txt.ReadOnly = true;
        btnSave.Visible = false;
        Show_mpe.Show();

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
        GetUserListTableAdapter GV = new GetUserListTableAdapter();
        DataTable dt = new DataTable();
        User_grd.EditIndex = e.NewEditIndex;
         ID.Text = User_grd.DataKeys[User_grd.EditIndex].Value.ToString();
        dt = GV.GetUserLists(ID.Text);
        VoterID_txt.Text = dt.Rows[0][1].ToString();
        VoterID_txt.ReadOnly = true;
        VoterName_txt.Text = dt.Rows[0][2].ToString();
        VoterFname_txt.Text = dt.Rows[0][3].ToString();
        VoterGender_txt.Text = dt.Rows[0][4].ToString();
        DOBpnl_txt.Text = dt.Rows[0][5].ToString();
        Emailpnl_txt.Text = dt.Rows[0][6].ToString();
        Contactpnl_txt.Text = dt.Rows[0][7].ToString();
        PopUp_Pnl.Enabled = true;
        Show_mpe.Show();
    }



    protected void btnSave_Click(object sender, EventArgs e)
    {
        UpdateVoterTableAdapter VT = new UpdateVoterTableAdapter();
        string dateString = DOBpnl_txt.Text;
        string format = "dd/mm/yyyy";
        DateTime dateTime = DateTime.ParseExact(dateString, format, CultureInfo.InvariantCulture);
        string strNewDate = dateTime.ToString("yyyy-dd-mm");
        object Chk = VT.UpdateVoter(ID.Text, VoterName_txt.Text, VoterFname_txt.Text, VoterGender_txt.Text, strNewDate, Emailpnl_txt.Text, Contactpnl_txt.Text);
        bool CHECK = Convert.ToBoolean(Chk);
        if(CHECK==true)
        {
            User_grd.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Voter Updated successfully.');window.location='UserList.aspx';", true);

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Voter Updation Failed');window.location='UserList.aspx';", true);

        }
    }

    protected void User_grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        User_grd.EditIndex = e.RowIndex;
        ID.Text = User_grd.DataKeys[User_grd.EditIndex].Value.ToString();
        UpdateVoterTableAdapter VT = new UpdateVoterTableAdapter();
        object Chk = VT.DeleteUser(ID.Text);
        bool chk = Convert.ToBoolean(Chk);
        if(chk==true)
        {
            User_grd.DataBind();
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Voter deleted successfully.');window.location='UserList.aspx';", true);

        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Voter deletion Failed');window.location='UserList.aspx';", true);

        }

    }

    protected void Logout_btn_Click(object sender, EventArgs e)
    {

        Session["Admin"] = null;
        Response.Redirect("officeradminLogin.aspx");
    }
}