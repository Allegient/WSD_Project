﻿using System;
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
            SqlCommand cmd = new SqlCommand("SELECT [roundID] FROM [fixtures] EXCEPT SELECT [roundID] FROM [tips] WHERE ([username] = @username)", con);
            cmd.Parameters.AddWithValue("@username", Page.User.Identity.Name);
            using (con)
            {
                con.Open();
                Object result = cmd.ExecuteScalar();
                con.Close();
                if (result != null) // If there are results it means user still have rounds to tip
                {
                    selectTip.Visible = false;
                    noTips.Visible = true;
                }
                else
                {
                    selectTip.Visible = true;
                    noTips.Visible = false;
                }

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
                String sql = "select tipsters.gname, tipsters.sname, ABS(tips.game1 - results.game1) AS 'errorpoints' from tips INNER JOIN tipsters ON tips.username = tipsters.username INNER JOIN results ON tips.roundID = results.roundID WHERE tips.roundID = 2";
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
                            gameRow = gameRow + (String)reader["gname"] + "</td><td>" + (String)reader["sname"] + "</td><td>" + reader["errorpoints"].ToString() + "</td>";
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