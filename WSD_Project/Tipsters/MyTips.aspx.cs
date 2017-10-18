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

            if (DropDownList2.Items.Count == 0)
            {
                selectTip.Visible = true;
                noTips.Visible = true;
            }
            else
            {
                noTips.Visible = false;
                selectTip.Visible = true;
            }

        }

        protected void roundResult(object sender, EventArgs e)
        {
            tipsTable.Visible = true;
            // Getting the roundID for sql statement
            for (int i = 1; i <= 9; i++)
            {
                String connectionString = WebConfigurationManager.ConnectionStrings["AFL_Tipping"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                String sql = "SELECT fixtures.home" + i +
                    " AS home, CASE WHEN results.game" + i +
                    " > 0 THEN 'WINS' WHEN results.game" + i +
                    " = 0 THEN 'Draws with' WHEN results.game" + i +
                    " < 0 THEN 'Loses to' END AS Result, fixtures.away" + i +
                    " AS away, ABS(results.game" + i +
                    ") AS margin from fixtures INNER JOIN results on fixtures.roundID = results.roundID WHERE fixtures.roundID = @round";
                SqlCommand cmd = new SqlCommand(sql, con);
                String roundSelectString = DropDownList2.SelectedValue;
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
                            gameRow = gameRow + (String)reader["home"] + "</td><td>" + (String)reader["result"] + "</td><td>" + (String)reader["away"] + "</td><td>" + reader["margin"].ToString() + "</td>";
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

    }
}