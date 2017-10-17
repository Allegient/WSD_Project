using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data
using System.Data.SqlClient
using System.Web.Configuration

namespace WSD_Project.Tipsters
{
    public partial class MyTips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["username"].DefaultValue = Page.User.Identity.Name;

            if (Page.IsValid)
            {
                // read the entire connection string from Web.config
                string connectionString = WebConfigurationManager.ConnectionStrings["AFL_TippingConnectionString"].ConnectionString;
                // create the connection based on the connection string
                SqlConnection con = new SqlConnection(connectionString);
                string sql;
                sql = "SELECT [roundID] FROM [tips] WHERE ([username] = @username)";
                SqlCommand cmd = new SqlCommand(sql, con);
                //cmd.Parameters.AddWithValue("@username", txtTitle.Text);
                //cmd.Parameters.AddWithValue("@Director", txtDirector.Text);
                //cmd.Parameters.AddWithValue("@DateReleased", DateTime.Parse(txtReleaseDate.Text));
                using (con)
                {
                    con.Open();
                    int rowCount = cmd.ExecuteNonQuery();
                    if (rowCount > 0)

                        MultiView1.ActiveViewIndex = 1;

                    else
                        MultiView1.ActiveViewIndex = 0;
                }
            }
        }
    }
    
}