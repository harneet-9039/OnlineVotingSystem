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

public partial class Admin_Officer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection("Data Source=ABC-PC;Initial Catalog=online;user id=sa;password=123");
    SqlDataAdapter da;   
    protected void Page_Load(object sender, EventArgs e)
    {
               
        con.Open();
        da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        da = new SqlDataAdapter("select * from Officerreports", con);
        ds = new DataSet();
        da.Fill(ds, "Officerreports");
        GridView1.DataSource = ds.Tables["Officerreports"].DefaultView;
        GridView1.DataBind();
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataAdapter da1;
        da1 = new SqlDataAdapter();
       
        da1 = new SqlDataAdapter("insert AdminCredential values('" + TextBox1.Text + "','" + TextBox2.Text + "')", con);
        da1.SelectCommand.ExecuteNonQuery();
        Label2.Visible = true;
        Label2.Text = "Successfully Added";

    }
}
