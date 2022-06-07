using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADGroupCourseWork
{
	public partial class personnels : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void addCastMemberBtn_Click(object sender, EventArgs e)
		{
			try
			{
				//Using insert method in castMemberDataSource for cast member insertion in system
				castMembersDataSource.Insert();
			}
			catch (Exception ex) {
				//Showing error message of already added
				Response.Write("<script>alert('Cast Member Already Added');</script>");
			}
		}

		protected void addProducerBtn_Click(object sender, EventArgs e)
		{
			try{
			//Using insert method in producerDataSource for producer insertion in system

				producerDataSource.Insert();
			}
			catch (Exception ex)
			{
				//Showing error message if any occurs
				Response.Write("<script>alert('Something went wrong')</script>");
			}
		}

		protected void addStudioBtn_Click(object sender, EventArgs e)
		{
			try{
				//Using insert method in producerDataSource for producer insertion in system
				studioDataSource.Insert();
			}
			catch (Exception ex)
			{
				//Showing error message if any occurs
				Response.Write("<script>alert('Something went wrong')</script>");
			}
		}

		protected void addActorBtn_Click(object sender, EventArgs e)
		{
			try{
				//Using insert method in producerDataSource for producer insertion in system
				actorDataSource.Insert();
			}
			catch (Exception ex)
			{
				//Showing error message if any occurs
				Response.Write("<script>alert('Something went wrong')</script>");
			}
		}
	}
}