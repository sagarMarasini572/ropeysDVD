using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADGroupCourseWork
{
    public partial class profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			//Checking if logged user is admin or not
			if(GlobalValues.isAdmin)
			{
				//Making admin panel visible
				adminPannel.Visible = true;
			}
		}

		protected void registerBtn_Click(object sender, EventArgs e)
		{
			//Using insert method in assistantDataSource for user insertion in system by admin
			assistantsDataSource.Insert();
		}

		protected void saveBtn_Click(object sender, EventArgs e)
		{
			//try{
			//Taking old,new and username for password change functiionality
			string newPassword = newPasswordTxtBox.Text;
			string username = GlobalValues.username;
			string typedOldPassword = oldPasswordTxtBox.Text;
			string oldpassword = GlobalValues.password;
			//Checking if old password is correct or not
			if (oldpassword == typedOldPassword)
			{
				//try
				//{
					//Using sqlconnection for the password update in database
					using (SqlConnection connection = new SqlConnection(GlobalValues.connectionString))
					{
						//Updating password
						connection.Open();
						SqlCommand passwordChangeCommand = new SqlCommand("update [User] set userpassword='" + newPassword + "' where username='" + username + "'", connection);
						passwordChangeCommand.ExecuteNonQuery();
						connection.Close();
					}
					//Redirecting to self after password change
					Server.Transfer("profile.aspx");
				//}
				//catch (Exception ex)
				//{
				//	//Showing error message if any occurs while updating password 
				//	Response.Write("<script>alert('Something went wrong while changing password');</script>");
				//}

			}
			else
			{
				//Showing old password not matched message
				Response.Write("<script>alert('Old password incorrect');</script>");
			}
			//}
			//catch (Exception ex)
			//{
			//	//Showing error message if any occurs while updating/changing password
			//	Response.Write("<script>alert('Something went wrong')</script>");
			//}

		}

	}
}