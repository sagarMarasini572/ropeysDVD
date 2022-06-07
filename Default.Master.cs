using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace ADGroupCourseWork
{
    public partial class Default : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

         //Taking the cookie for logged status check
         HttpCookie loginCookie = Request.Cookies["Login"];
         //Checking if the cookie with value exist or not
         if (loginCookie != null)
         {
            //Taking user informations from cookie and setting them in GlobalValues for logging status
				string name = loginCookie.Values["username"];
            string password= loginCookie.Values["password"];
            bool isAdmin = bool.Parse(loginCookie.Values["isAdmin"]);
				GlobalValues.username = name;
				GlobalValues.isAdmin = isAdmin;
            GlobalValues.password = password;
            GlobalValues.isLogin = true;
            //Making the navbar links visible and setting the profile button text to username
            changeVisibility(true);
            addAssistantLabel.Text = GlobalValues.username;
            
         }
         else {
            //If no cookie found logging out the user
            GlobalValues.isLogin = false;
            FormsAuthentication.SignOut();
         }
		}

      protected void changeVisibility(bool visible) {
         logoutBtn.Visible = visible;
         addDVDsBtn.Visible = visible;
         addMemberBtn.Visible = visible;
         managePersonnelsBtn.Visible = visible;
         issueLoanBtn.Visible = visible;
         
      }
		protected void logoutBtn_Click(object sender, EventArgs e)
      {
         //Taking the cookie for log out functinality
         HttpCookie loginCookie = Request.Cookies["Login"];
         //Setting cookie expiry to negative for removing cookie
         loginCookie.Expires = DateTime.Now.AddDays(-1);
         Response.Cookies.Add(loginCookie);
         //Sign out user and redirect to login page
         FormsAuthentication.SignOut();
         FormsAuthentication.RedirectToLoginPage();
		}
	}
}