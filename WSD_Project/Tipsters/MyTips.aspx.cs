using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace WSD_Project.Tipsters
{
    public partial class MyTips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["username"].DefaultValue = Page.User.Identity.Name; // Finding username of user to check rounds

        }

        protected void boxChange(object sender, EventArgs e)
        {
            if (DropDownList2.Items.Count == 0)
                {
                    DropDownList2.Visible = false;
                Label1.Visible = true;

                }
                else
                {
                    DropDownList2.Visible = true;
                Label1.Visible = false;

                }
            

        }

      
    }
    
}