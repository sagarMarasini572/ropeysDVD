using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Security;

namespace ADGroupCourseWork
{
    public partial class adminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

		protected void loginBtn_Click(object sender, EventArgs e)
		{
			try{
			//Taking username and password from the form text field
			string username = usernameTxtBox.Text;
			string password = passwordTxtBox.Text;
			//setting the stored procedure for getting user data if present in database
			string query = "GetUser";
			//Using sql connection for taking user credentials from database is exist
			using (SqlConnection connection = new SqlConnection(GlobalValues.connectionString))
			{
				//Setting command and parameters for the stored procedure
				SqlCommand cmd = new SqlCommand(query, connection);
				cmd.CommandType = CommandType.StoredProcedure;
				cmd.Parameters.AddWithValue("@username", username);
				cmd.Parameters.AddWithValue("@password", password);
				SqlDataAdapter adapter = new SqlDataAdapter(cmd);
				DataSet ds = new DataSet();
				adapter.Fill(ds);
				//Checking if user exist or not
				if (ds.Tables[0].Rows.Count == 1)
				{
					//Setting cookie and GlobalValues variables for user information for login status
					HttpCookie loginCookie = new HttpCookie("Login");
					loginCookie.Values["username"] = username;
					GlobalValues.password= password;
					loginCookie.Values["password"] = password;
					GlobalValues.isAdmin = bool.Parse(ds.Tables[0].Rows[0].Field<bool>("UserType").ToString());
					loginCookie.Values["isAdmin"] = GlobalValues.isAdmin.ToString();
					loginCookie.Path = Request.ApplicationPath;
					GlobalValues.isLogin = true;
					//Set the Expiry date.
					loginCookie.Expires = DateTime.Now.AddMinutes(20);
					//Add the Cookie to Browser and redirecting to deafult page
					Response.Cookies.Add(loginCookie);
					FormsAuthentication.RedirectFromLoginPage(username, true);
				}
				else
				{
					//Showing incorrect username and password message
					Response.Write("<script>alert('Username or Password Incorrect')</script>");
					}
			}
			}
			catch (Exception ex)
			{
				//Showing error message if any occurs
				Response.Write("<script>alert('Something went wrong')</script>");
			}
		}

	}
}