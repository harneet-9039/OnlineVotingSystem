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
using System.Globalization;
using DataSet1TableAdapters;


public partial class Registration : System.Web.UI.Page
{
   
     
    void Page_Load(object source, EventArgs e)
    {


        if (Page.IsPostBack) return;
        
        ListItem li = new ListItem("---select---", "-1");
        Urban_Rural_ddl.Items.Insert(0, li);

        ListItem lit = new ListItem("---select---", "-1");
        District_ddl.Items.Insert(0, lit);

        FillState();
    
        
        Random r = new Random();
        int i = r.Next(1234123, 9824541);
        Id_hfd.Value = i.ToString();
        
    }

    protected void Submit_btn_Click(object sender, EventArgs e)
    {
        bool Condition=Register();
        if (Condition == true)
        {
            Voterid_text.Text = Id_hfd.Value;
            Registeration_panel.Visible = false;
            Data_register_panel.Visible = true;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Email or Phone Number Already Exists.');window.location='Registration.aspx';", true);
        }
        
        
       
       
    }
    protected void Dob_txt_TextChanged(object sender, EventArgs e)
    {
        ListItem li = new ListItem("---select---", "-1");
        Urban_Rural_ddl.Items.Insert(0, li);
        DateTime d1 = new DateTime();
        d1 = DateTime.Now;
        DateTime dt = Convert.ToDateTime(Dob_txt.Text, CultureInfo.GetCultureInfo("en-US"));
        int y = dt.Year;
        int x = d1.Year;
        int age = x - y;
        Age_txt.Text = age.ToString();
        Page.MaintainScrollPositionOnPostBack = true;
    }


    public bool Register()
    {

       string g = Guid.NewGuid().ToString();
        string name = Name_txt.Text;
        string fname = Father_txt.Text;
        string gender = string.Empty;
        if (Male_rbtn.Checked)
        {
            gender = "Male";
        }
        else if (Female_rbtn.Checked)
        {
            gender = "Female";
        }
        string dateString = Dob_txt.Text;
        string format = "dd/mm/yyyy";
        DateTime dateTime = DateTime.ParseExact(dateString, format, CultureInfo.InvariantCulture);
        string strNewDate = dateTime.ToString("yyyy-dd-mm");
        int age = int.Parse(Age_txt.Text);
        string email = Email_txt.Text;
        string contact = phone_txt.Text;
        string State= State_ddl.SelectedValue;
        string District= District_ddl.SelectedValue;
        string ur = Urban_Rural_ddl.SelectedValue;
        string add = Address_txt.Text;

  

        RegisterVoterTableAdapter rv = new RegisterVoterTableAdapter();
        object s = rv.RegisterVoter(g,name, fname, gender, strNewDate, age, email, contact, State, District, ur, add);

         
        bool st = Convert.ToBoolean(s);
        if(st==true)
        {
            VoterGuid_hfd.Value = g;
            return true;
            
           
        }
        else
        {
            return false;
        }
    }

  


   public void FillState()
   {
        DataTable dt = new DataTable();
        GetStateTableAdapter dv = new GetStateTableAdapter();
        dt = dv.GetDataBy();
        State_ddl.DataSource=dt;
        State_ddl.DataValueField = "StateID";
        State_ddl.DataTextField = "StateName";
        State_ddl.DataBind();
        ListItem li = new ListItem("--select---", "-1");
        State_ddl.Items.Insert(0, li);

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




   protected void Confirm_btn_Click(object sender, EventArgs e)
   {
       RegisteredVoterLoginTableAdapter Login = new RegisteredVoterLoginTableAdapter();
       Int32 ID= Int32.Parse(Voterid_text.Text);
       string Pwd=Pwd_txt.Text;

       object St = Login.RegisteredVoterLogin(ID, VoterGuid_hfd.Value, Pwd);

       bool st = Convert.ToBoolean(St);
       if (st == true)
       {
           ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Voter Registered successfully.');window.location='Registration.aspx';", true);




       }
       else
       {
           ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Voter not Registered.Try Again.');window.location='Registration.aspx';", true);

       }

   }
}

    