using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADGroupCourseWork
{
    public partial class addDVDs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void categoryAddBtn_Click(object sender, EventArgs e)
		{
			//Using insert method on category data source for category insert
			try
			{
				categoryDataSource.Insert();
			}
			catch (Exception ex)
			{
				//Displaying alert with error message if exception occurs
				Response.Write("<script>alert('Something went wrong')</script>");
			}
		}


				protected void DVDAddBtn_Click(object sender, EventArgs e)
		{
			//Using insert method  on dvddatasource for adding dvd title
			try{
			dvdDataSource.Insert();
			}
			catch (Exception ex)
			{
				//Displaying alert with error message if exception occurs
				Response.Write("<script>alert('Something went wrong')</script>");
			}
		}

		protected void deleteOldCopiesBtn_Click(object sender, EventArgs e)
		{
			//Using insert method on oldDvd data source for the delete of old dvd title
			try{
			oldDVDsDataSource.Delete();
			}
			catch (Exception ex)
			{
				//Displaying alert with error message if exception occurs
				Response.Write("<script>alert('Something went wrong')</script>");
			}
		}

		protected void dvdCopyPurchaseBtn_Click(object sender, EventArgs e)
		{
			//Process for dvd copy purchase
			try {
				//taking required copies to make, dvd number and date from the form for making dvd copy process
				int copies = int.Parse(numericDropDownList.SelectedItem.Value);
				int dvdNumber = int.Parse(dvdTitlefoCopyDropDownList.SelectedItem.Value);
				DateTime purchasedDate = DateTime.Parse(purchaseDateTxtBox.Text);
				//Using sql connection for connectingt to ssms
					using (SqlConnection connection = new SqlConnection(GlobalValues.connectionString))
					{
					//Looping for making dvd copies
					for (int i = 0; i < copies; i++)
					{
						//Creating insert command and executing for the insertion of data in system
						connection.Open();
						SqlCommand dvdCopyPurchaseCmd = new SqlCommand("insert into dvdcopy(dvdnumber,datepurchased) values('"+dvdNumber+"','"+purchasedDate+"')", connection);
						dvdCopyPurchaseCmd.ExecuteNonQuery();
					}
					//Updating the number of dvdcopies on stock in dvd title table
					SqlCommand stockUpdate = new SqlCommand("Update dvdtitle set copiesonstock=copiesonstock+"+copies+" where dvdnumber="+dvdNumber, connection);
						connection.Close();
				}
					//Displaying successful message of insertion of new dvd copies
				Response.Write("<script>alert('DVD Copy Entry was successfull')</script>");

			} catch (Exception ex) {
				//Displaying error message if any occurs
				Response.Write("<script>alert('Something went wrong')</script>");
			}
		}
	}
}