using System;
using System.Linq;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WSD_Project.Models;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace WSD_Project.Account
{
    public partial class Register : Page
    {
        protected void Page_Load()
        {
            // Retrieving the current date minus 20 years for DOB validation
            CompareValidator2.ValueToCompare = DateTime.Now.AddYears(-20).ToShortDateString();
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                var signInManager = Context.GetOwinContext().Get<ApplicationSignInManager>();
                var user = new ApplicationUser() { UserName = Email.Text, Email = Email.Text };
                IdentityResult result = manager.Create(user, Password.Text);
                if (result.Succeeded)
                {
                    String connectionString = WebConfigurationManager.ConnectionStrings["AFL_Tipping"].ConnectionString;
                    SqlConnection con = new SqlConnection(connectionString);
                    string sql;
                    sql = "insert tipsters (username, gName, sName, birthdate, address, state, suburb, postcode, phone) values (@email, @gName, @sName, @dob, @address, @state, @suburb, @postcode, @mobile)";
                    SqlCommand cmd = new SqlCommand(sql, con);
                    cmd.Parameters.AddWithValue("@email", Email.Text);
                    cmd.Parameters.AddWithValue("@gName", givenName.Text);
                    cmd.Parameters.AddWithValue("@sName", familyName.Text);
                    cmd.Parameters.AddWithValue("@dob", DateTime.Parse(DOB.Text));
                    cmd.Parameters.AddWithValue("@address", address.Text);
                    cmd.Parameters.AddWithValue("@state", state.Text);
                    cmd.Parameters.AddWithValue("@suburb", suburb.Text);
                    cmd.Parameters.AddWithValue("@postcode", postcode.Text);
                    cmd.Parameters.AddWithValue("@mobile", phone.Text);
                    using (con)
                    {
                        con.Open();
                        int rowCount = cmd.ExecuteNonQuery();
                    }

                    // For more information on how to enable account confirmation and password reset please visit https://go.microsoft.com/fwlink/?LinkID=320771
                    //string code = manager.GenerateEmailConfirmationToken(user.Id);
                    //string callbackUrl = IdentityHelper.GetUserConfirmationRedirectUrl(code, user.Id, Request);
                    //manager.SendEmail(user.Id, "Confirm your account", "Please confirm your account by clicking <a href=\"" + callbackUrl + "\">here</a>.");
                    IdentityResult resultAdd = manager.AddToRole(manager.FindByEmail(Email.Text).Id, "tipsters");
                    signInManager.SignIn(user, isPersistent: false, rememberBrowser: false);
                    IdentityHelper.RedirectToReturnUrl(Request.QueryString["ReturnUrl"], Response);
                }
                else
                {
                    ErrorMessage.Text = result.Errors.FirstOrDefault();
                }
            }
            else
            {
                validationMessage.Text = "Registration failed! A field has an invalid input";
            }
        }
    }
}