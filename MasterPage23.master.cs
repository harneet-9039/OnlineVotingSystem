using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage23 : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            Slider();
        }
      


    }
    protected void Timer_Ajax_Tick(object sender, EventArgs e)
    {
        
            Slider();
        
    }

    public void Slider()
    {
        Random r = new Random();
        int i = r.Next(1, 6);
        Image1.ImageUrl = "~/Copy of Images/" + i.ToString() + ".jpg";
    }

    
}
