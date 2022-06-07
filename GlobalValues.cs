using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace ADGroupCourseWork
{
	public class GlobalValues
	{
		//Setting connection string
		public static string connectionString = ConfigurationManager.ConnectionStrings["ADGroupWorkConnectionString"].ConnectionString.ToString();

		//Declaring variables for user information 
		public static bool isAdmin;
		public static bool isLogin;
		public static string username="Login";
		public static string password;

	}

}