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
    }
}