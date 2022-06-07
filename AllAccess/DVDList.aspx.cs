using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace ADGroupCourseWork.AllAccess
{
	public partial class DVDList : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			//Checking if user is logged in or not
			if (GlobalValues.isLogin) 
			{
				//If user is logged making admin panel visible
				adminPanel.Visible = true;
			}

		}
	}
}