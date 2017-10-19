using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WSD_Project.Tipsters
{
    public partial class MakeTips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["username"].DefaultValue = Page.User.Identity.Name; // Finding username
        }

        protected void View1_Activate(object sender, EventArgs e)
        {
            // Checking if the user has tipped in all 20 rounds 
            String connectionString = WebConfigurationManager.ConnectionStrings["AFL_Tipping"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT [roundID] FROM [fixtures] EXCEPT SELECT [roundID] FROM [tips] WHERE ([username] = @username)", con);
            cmd.Parameters.AddWithValue("@username", Page.User.Identity.Name);
            using (con)
            {
                con.Open();
                Object result = cmd.ExecuteScalar();
                if (result != null) // If there are results it means user still have rounds to tip
                {
                    Label1.Visible = false;
                }
                else
                {
                    DropDownList1.Visible = false;
                    button1.Visible = false;
                }
            }
        }

        protected void View2_Activate(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["username"].DefaultValue = Page.User.Identity.Name;
            for (int i = 1; i <= 9; i++)    // Loop to repeat for all 9 games
            {
                String connectionString = WebConfigurationManager.ConnectionStrings["AFL_Tipping"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);

                // Finding the home and away team names for the round
                String sql = "SELECT home" + i + " AS home, away" + i + " AS away FROM fixtures WHERE roundID = @round";
                SqlCommand cmd = new SqlCommand(sql, con);
                String roundSelectString = DropDownList1.SelectedValue;
                cmd.Parameters.AddWithValue("@round", roundSelectString);

                using (con)
                {
                    con.Open();
                    String gameRow;
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        gameRow = "<td>" + i + ".  </td> <td>";
                        while (reader.Read())
                        {
                            gameRow = gameRow + (String)reader["home"] + "</td><td>" + (String)reader["away"] + "</td>";
                        }
                        // Inputting data into each row
                        if (i == 1)
                        {
                            game1.Text = gameRow;
                        }
                        if (i == 2)
                        {
                            game2.Text = gameRow;
                        }
                        if (i == 3)
                        {
                            game3.Text = gameRow;
                        }
                        if (i == 4)
                        {
                            game4.Text = gameRow;
                        }
                        if (i == 5)
                        {
                            game5.Text = gameRow;
                        }
                        if (i == 6)
                        {
                            game6.Text = gameRow;
                        }
                        if (i == 7)
                        {
                            game7.Text = gameRow;
                        }
                        if (i == 8)
                        {
                            game8.Text = gameRow;
                        }
                        if (i == 9)
                        {
                            game9.Text = gameRow;
                        }
                    }
                }
            }
        }

        protected void submitTip(object sender, EventArgs e)
        {

        }
    }
}