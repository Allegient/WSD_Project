using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace WSD_Project.Administrators
{
    public partial class Statistics : System.Web.UI.Page
    {
        private void GetChartTypes()
        {

            DropDownList1.Items.Add("Column");
            DropDownList1.Items.Add("Pie");
            DropDownList1.Items.Add("Line");
            DropDownList3.Items.Add("Column");
            DropDownList3.Items.Add("Pie");
            DropDownList3.Items.Add("Line");

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetChartTypes();
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            String selectedType = DropDownList1.SelectedValue;
            Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), selectedType);




        }

        protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
        {

            String selectedType = DropDownList2.SelectedValue;
            if (selectedType == "2D")
            {
                Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
            }
            else if (selectedType == "3D")
            {
                Chart1.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
            }

            String selectedType2 = DropDownList1.SelectedValue;
            Chart1.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), selectedType2);

        }

        protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
        {
            String selectedType = DropDownList3.SelectedValue;          
            Chart2.Series["Series2"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), selectedType);

        }

        protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            String selectedType = DropDownList4.SelectedValue;           
            if (selectedType == "2D")
            {               
                Chart2.ChartAreas["ChartArea2"].Area3DStyle.Enable3D = false;            
            }
            else if (selectedType == "3D")
            {                
                Chart2.ChartAreas["ChartArea2"].Area3DStyle.Enable3D = true;
            }

            String selectedType2 = DropDownList3.SelectedValue;
            Chart2.Series["Series2"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), selectedType2);
        }
    }
}

/** This is how you fix the issue where if you have 3D selected but change to another chart pattern it goes back to 2D. You seem to have
 * fixed it for going from 2D to 3D sticks with the same pattern
 *         protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
        {
            String selectedType2 = DropDownList4.SelectedValue;
            if (selectedType2 == "2D")
            {
                Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = false;
                String selectedType = DropDownList3.SelectedValue;
                Chart2.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), selectedType);
            }
            else if (selectedType2 == "3D")
            {
                Chart2.ChartAreas["ChartArea1"].Area3DStyle.Enable3D = true;
                String selectedType = DropDownList3.SelectedValue;
                Chart2.Series["Series1"].ChartType = (SeriesChartType)Enum.Parse(typeof(SeriesChartType), selectedType);
            }
        }
**/