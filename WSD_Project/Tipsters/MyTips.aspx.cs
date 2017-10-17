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


        }
        protected void Page_Init(object sender, EventArgs e)


        {
            SqlDataSource1.SelectParameters["username"].DefaultValue = Page.User.Identity.Name;

           
                // read the entire connection string from Web.config
                string connectionString = WebConfigurationManager.ConnectionStrings["AFL_TippingConnectionString"].ConnectionString;
                // create the connection based on the connection string
                SqlConnection con = new SqlConnection(connectionString);
                string sql;
                sql = "SELECT [roundID] FROM [tips] WHERE ([username] = @username)";
                SqlCommand cmd = new SqlCommand(sql, con);
            String paramString = Page.User.Identity.Name;
            cmd.Parameters.AddWithValue("@username", paramString);
            using (con)
            { 
                    con.Open();
                    int rowCount = cmd.ExecuteNonQuery();
            if (rowCount > 0)
            {
                  
                    MultiView1.SetActiveView(View2);

                }
           
            else if (rowCount <= 0)
                {
                   MultiView1.SetActiveView(View1);
                }
            }
        }

        


    }
}
    
