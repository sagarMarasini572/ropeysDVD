using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADGroupCourseWork
{
    public partial class addMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void addMemeberBtn_Click(object sender, EventArgs e)
		{
         //Using insert method on memeber data source for member registration in system
         membersDataSource.Insert();
         
		}
	}
}