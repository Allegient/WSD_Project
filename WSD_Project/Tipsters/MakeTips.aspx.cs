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
                    title.Visible = false;
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
                        // Inputting round fixture info into each row
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

        protected void validationCheck(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                // Making an array to loop through all the dropdownlists
                DropDownList[] results = new DropDownList[] { game1Drop, game1Drop, game2Drop, game3Drop, game4Drop, game5Drop, game6Drop, game7Drop, game8Drop, game9Drop };
                for (int i = 1; i <= 9; i++)
                {
                    if (results[i].Text == "Draw")  // Changing to 0 if draw
                    {
                        if (i == 1)
                        {
                            game1Margin.Text = "0";
                        }
                        if (i == 2)
                        {
                            game2Margin.Text = "0";
                        }
                        if (i == 3)
                        {
                            game3Margin.Text = "0";
                        }
                        if (i == 4)
                        {
                            game4Margin.Text = "0";
                        }
                        if (i == 5)
                        {
                            game5Margin.Text = "0";
                        }
                        if (i == 6)
                        {
                            game6Margin.Text = "0";
                        }
                        if (i == 7)
                        {
                            game7Margin.Text = "0";
                        }
                        if (i == 8)
                        {
                            game8Margin.Text = "0";
                        }
                        if (i == 9)
                        {
                            game9Margin.Text = "0";
                        }
                    }
                    else if (results[i].Text == "Lose") // Changing to negative if loss
                    {
                        if (i == 1)
                        {
                            game1Margin.Text = "-" + game1Margin.Text;
                        }
                        if (i == 2)
                        {
                            game2Margin.Text = "-" + game2Margin.Text;
                        }
                        if (i == 3)
                        {
                            game3Margin.Text = "-" + game3Margin.Text;
                        }
                        if (i == 4)
                        {
                            game4Margin.Text = "-" + game4Margin.Text;
                        }
                        if (i == 5)
                        {
                            game5Margin.Text = "-" + game5Margin.Text;
                        }
                        if (i == 6)
                        {
                            game6Margin.Text = "-" + game6Margin.Text;
                        }
                        if (i == 7)
                        {
                            game7Margin.Text = "-" + game7Margin.Text;
                        }
                        if (i == 8)
                        {
                            game8Margin.Text = "-" + game8Margin.Text;
                        }
                        if (i == 9)
                        {
                            game9Margin.Text = "-" + game9Margin.Text;
                        }
                    }
                }

                // Entering the data into the tips table
                String connectionString = WebConfigurationManager.ConnectionStrings["AFL_Tipping"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                string sql;
                sql = "insert tips (username, roundID, game1, game2, game3, game4, game5, game6, game7, game8, game9, tiptime) values (@username, @roundID, @game1, @game2, @game3, @game4, @game5, @game6, @game7, @game8, @game9, @tiptime)";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@username", Page.User.Identity.Name);
                cmd.Parameters.AddWithValue("@roundID", int.Parse(DropDownList1.Text));
                cmd.Parameters.AddWithValue("@game1", Convert.ToInt32(game1Margin.Text));
                cmd.Parameters.AddWithValue("@game2", Convert.ToInt32(game2Margin.Text));
                cmd.Parameters.AddWithValue("@game3", Convert.ToInt32(game3Margin.Text));
                cmd.Parameters.AddWithValue("@game4", Convert.ToInt32(game4Margin.Text));
                cmd.Parameters.AddWithValue("@game5", Convert.ToInt32(game5Margin.Text));
                cmd.Parameters.AddWithValue("@game6", Convert.ToInt32(game6Margin.Text));
                cmd.Parameters.AddWithValue("@game7", Convert.ToInt32(game7Margin.Text));
                cmd.Parameters.AddWithValue("@game8", Convert.ToInt32(game8Margin.Text));
                cmd.Parameters.AddWithValue("@game9", Convert.ToInt32(game9Margin.Text));
                cmd.Parameters.AddWithValue("@tiptime", DateTime.Now);
                using (con)
                {
                    con.Open();
                    int rowCount = cmd.ExecuteNonQuery();
                }
                validationMessage.Text = "You have successfully tipped this round!";
            }
            else
            {
                validationMessage.Text = "ERROR: Either a Match Result or Predicted Margin has not been entered or your predicted margin is not between 0-200.";
            }
        }
    }
}