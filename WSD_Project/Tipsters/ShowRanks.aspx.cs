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
    public partial class ShowRanks : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlDataSource1.SelectParameters["username"].DefaultValue = Page.User.Identity.Name; // Finding username of user to check rounds

            // Checking if the user has tipped in all 20 rounds 
            String connectionString = WebConfigurationManager.ConnectionStrings["AFL_Tipping"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("SELECT [roundID] FROM [tips] WHERE ([username] = @username)", con);
            cmd.Parameters.AddWithValue("@username", Page.User.Identity.Name);
            using (con)
            {
                con.Open();
                Object result = cmd.ExecuteScalar();
                con.Close();
                if (result != null) // If there are results it means the user tipped
                {
                    noTips.Visible = false;
                }
                else
                {
                    title.Visible = false;
                    roundSeletion.Visible = false;
                    submissionButton.Visible = false;
                }
            }
        }

        protected void rankResult(object sender, EventArgs e)
        {
            // SQLquery for rankings
            rankingTable.Visible = true;
            String connectionString = WebConfigurationManager.ConnectionStrings["AFL_Tipping"].ConnectionString;
            SqlConnection con = new SqlConnection(connectionString);
            String sql = "SELECT tipsters.gname, tipsters.sname, RANK() OVER (ORDER BY (ABS(tips.game1 - results.game1) + ABS(tips.game2 - results.game2) + ABS(tips.game3 - results.game3) + ABS(tips.game4 - results.game4) + ABS(tips.game5 - results.game5) + ABS(tips.game6 - results.game6) + ABS(tips.game7 - results.game7) + ABS(tips.game8 - results.game8) + ABS(tips.game9 - results.game9)) ASC) AS Rank, (ABS(tips.game1 - results.game1) + ABS(tips.game2 - results.game2) + ABS(tips.game3 - results.game3) + ABS(tips.game4 - results.game4) + ABS(tips.game5 - results.game5) + ABS(tips.game6 - results.game6) + ABS(tips.game7 - results.game7) + ABS(tips.game8 - results.game8) + ABS(tips.game9 - results.game9)) AS 'errorpoints' from tips INNER JOIN tipsters ON tips.username = tipsters.username INNER JOIN results ON tips.roundID = results.roundID WHERE tips.roundID = @round";
            SqlCommand cmd = new SqlCommand(sql, con);
            String roundSelectString = DropDownList1.SelectedValue;
            cmd.Parameters.AddWithValue("@round", roundSelectString);
            using (con)
            {
                con.Open();
                String gameRow = null;
                String fullRank = null;
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    // Creating a table with the rankings
                    while (reader.Read())
                    {
                        gameRow = "<tr><td>" + reader["Rank"].ToString() + "</td><td>" + (String)reader["gname"] + "</td><td>" + (String)reader["sname"] + "</td><td>" + reader["errorpoints"].ToString() + "</td></tr>";
                        fullRank = fullRank + gameRow;
                        //          System.Diagnostics.Debug.WriteLine(gameRow + "@@@@@@@@@@@");
                    }
                    Rankings.Text = fullRank;
                }
            }
        }
    }
}