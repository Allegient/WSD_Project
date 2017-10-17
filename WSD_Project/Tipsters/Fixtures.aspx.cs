﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WSD_Project.Tipsters
{
    public partial class Fixtures : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void roundChange(object sender, EventArgs e)
        {
            // Getting the roundID for sql statement
            for (int i = 1; i <= 9; i++)
            {
                String connectionString = WebConfigurationManager.ConnectionStrings["AFL_Tipping"].ConnectionString;
                SqlConnection con = new SqlConnection(connectionString);
                String sql = "SELECT home" + i + " AS home, away" + i + " AS away, t1.homestate AS homeState, t2.homestate as awayState FROM fixtures JOIN teams t1 ON fixtures.home" + i + " = t1.teamname JOIN teams t2 ON fixtures.away" + i + " = t2.teamname WHERE roundID = @round";
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
                        gameRow = "<b>" + i + ".  </b>";
                        while (reader.Read())
                        {
                            gameRow = gameRow + (String)reader["home"] + " (" + (String)reader["homeState"] + ")" + "<b>   VERSUS   </b>" + (String)reader["away"] + " (" + (String)reader["awayState"] + ")";
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