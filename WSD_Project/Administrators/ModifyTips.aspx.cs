using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WSD_Project.Administrators
{
    public partial class ModifyTips : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
        protected void ListView1_ItemInserted(object sender, ListViewInsertedEventArgs e)
        {
            

            // Use the Exception property to determine whether there is an exception
            if (e.Exception == null)
            {
                // Use the AffectedRows property to double make sure that 
                // the record was actually updated. 
                if (e.AffectedRows == 1)
                {
                    // Display a confirmation message.
                    Label1.Visible = true;
                    Label1.Text = "The new tip has been inserted successfully!";
                }
                else
                {
                    // Display an error message.
                    Label1.Visible = true;
                    Label1.Text = "An error occurred during the insert operation.";
                    // When an error occurs, keep the FormView control in edit mode.
                    e.KeepInInsertMode = true;
                }
            }
            else
            {
                // Display the error message
                Label1.Visible = true;
                Label1.Text = e.Exception.Message;
                // Indicate that the exception has already been handled.
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
        }

        protected void ListView1_ItemUpdated(object sender, ListViewUpdatedEventArgs e)
        {
            // Use the Exception property to determine whether there is an exception
            if (e.Exception == null)
            {
                // Use the AffectedRows property to double make sure that 
                // the record was actually updated. 
                if (e.AffectedRows == 1)
                {
                    // Display a confirmation message.
                    Label1.Visible = true;
                    Label1.Text = "The tip has been updated successfully!";
                }
                else
                {
                    // Display an error message.
                    Label1.Visible = true;
                    Label1.Text = "An error occurred during the update operation.";
                    // When an error occurs, keep the FormView control in edit mode.
                    e.KeepInEditMode = true;
                }
            }
            else
            {
                // Display the error message
                Label1.Visible = true;
                Label1.Text = e.Exception.Message;
                // Indicate that the exception has already been handled.
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
        }
    }
}