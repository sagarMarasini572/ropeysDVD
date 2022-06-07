using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ADGroupCourseWork
{
    public partial class issueDVDs : System.Web.UI.Page
    {
		
        protected void Page_Load(object sender, EventArgs e)
        {
			
			}

		protected void memberDropDownList_SelectedIndexChanged(object sender, EventArgs e)
		{
			//Calling method present inside current class and enabeling the issueBtn
			dvdDataSourceUpdate();
			issueBtn.Enabled = true;
		}

		protected void dvdDataSourceUpdate() {
			try{
			//Taking member from dropdownlist
			int memberNumber = int.Parse(memberDropDownList.SelectedItem.Value);

				//Using sql connection for the query execution
			using (SqlConnection connection = new SqlConnection(GlobalValues.connectionString))
			{
				//Taking age of the member from database for age calculation
				SqlCommand ageCmd = new SqlCommand("select memberdateofbirth as dob from member where membernumber=" + memberNumber, connection);
				SqlDataAdapter ageAdapter = new SqlDataAdapter(ageCmd);
				DataSet ageDataSet = new DataSet();
				ageAdapter.Fill(ageDataSet);
				DateTime DOB = ageDataSet.Tables[0].Rows[0].Field<DateTime>("dob");
				int days = 18 * 12 * 30;
				int age = (int)Math.Ceiling((float)DateTime.Parse(DateTime.Now.ToShortDateString()).Subtract(DOB).Days);
				//checking if age is greater than or equal to 18 or not
				if (days <= age)
				{
					//Creating select command for dvdtitleDataSource for the non age restricted dvd
					string ageCmdS = "select * from dvdtitle where dvdtitle.copiesonstock>0";
					//Changing select command of dvdTitleDataSource
					dvdTitleDataSource.SelectCommand = ageCmdS;
				}
				else
				{
						//Creating select command for dvdtitleDataSource for the age restricted dvd
						string ageCmdS = "select * from dvdtitle inner join dvdcategory on dvdtitle.categorynumber=dvdcategory.categorynumber where dvdcategory.agerestricted=0 and dvdtitle.copiesonstock>0";
						//Changing select command of dvdTitleDataSource
						dvdTitleDataSource.SelectCommand = ageCmdS;
				}

			}
			}
			catch (Exception ex)
			{
				//Showing error message if any occurs
				Response.Write("<script>alert('Something went wrong')</script>");
			}
		}

		protected void issueBtn_Click(object sender, EventArgs e)
		{

			//try
			//{
				//taking memeber number and loan type from the dropdownlist
				int memberNumber = int.Parse(memberDropDownList.SelectedItem.Value);
			int selectedLType = int.Parse(loanTypeDropDown.SelectedItem.Value);
			//Checking if the dvd is chosen or not
			if (dvdTitleDropDownList.SelectedIndex != -1)
			{
				//Using sql connection for the query execution
				using (SqlConnection connection = new SqlConnection(GlobalValues.connectionString))
				{
					//Taking dvdnumber from dropdownlist
					int dvdNumber = int.Parse(dvdTitleDropDownList.SelectedItem.Value);
					//Taking the available dvd copy from database
					SqlCommand copyNumberCmd = new SqlCommand("select max(copynumber) as number from dvdcopy where dvdnumber='" + dvdNumber + "' and dvdcopy.copynumber not in (select loan.copynumber from loan where loan.datereturned is null)", connection);
					SqlDataAdapter copyNumberAdapter = new SqlDataAdapter(copyNumberCmd);
					DataSet copyNumberDs = new DataSet();
					copyNumberAdapter.Fill(copyNumberDs);
					int copynumber = copyNumberDs.Tables[0].Rows[0].Field<int>("number");
					//Taking loanduration as per the chosen loan type from loanType dropdownlist
					SqlCommand loanDurationCmd = new SqlCommand("select loanduration from loantype where loantypenumber='" + selectedLType + "'", connection);
					SqlDataAdapter loandDurationAdapter = new SqlDataAdapter(loanDurationCmd);
					DataSet loanDurationDs = new DataSet();
					loandDurationAdapter.Fill(loanDurationDs);
					int loanDuration = loanDurationDs.Tables[0].Rows[0].Field<int>("loanduration");
					//Issuing the chosen dvd copy on loan for chosen member
					connection.Open();
					SqlCommand issueCommand = new SqlCommand("insert into loan(loantypenumber,copynumber,membernumber,dateout,datedue) values('" + selectedLType + "','" + copynumber + "','" + memberNumber + "','" + DateTime.Today + "','" + DateTime.Today.AddDays(loanDuration) + "')", connection);
					issueCommand.ExecuteNonQuery();
					//Updating the dvd copy stock 
					SqlCommand dvdStockSetCommand = new SqlCommand("update dvdtitle set copiesonloan=dvdtitle.copiesonloan+1,copiesonstock=dvdtitle.copiesonstock-1 where dvdnumber='" + dvdNumber + "'", connection);
					dvdStockSetCommand.ExecuteNonQuery();
					connection.Close();
				}
				//Redirecting to self after dvd loan issue
				Server.Transfer("issueDVDs.aspx");
			}
			else {
				//Displaying message if no dvd copy is available for loan for chosen memeber
				Response.Write("<script>alert('No DVD available for you now');</script>");
			}
			//}
			//catch (Exception ex)
			//{
			//	//Displaying error message if any occurs
			//	Response.Write("<script>alert('Something went wrong')</script>");
			//}
		}

		protected void returnBtn_Click(object sender, EventArgs e)
		{
			//Checking if dropdownlist is selected or not
			if (copyDropDownList0.SelectedIndex !=-1)
			{
				
				//{
					//Taking dvd title and dvd number from fridview for loan return functionality
					string dvdtitle=copyLoanGridView0.Rows[0].Cells[1].Text;
				int dvdNumber= int.Parse(copyLoanGridView0.Rows[0].Cells[0].Text);
				int copyNumber = int.Parse(copyDropDownList0.SelectedItem.Value);

				//Using sqlconnection for query execution
				using (SqlConnection connection = new SqlConnection(GlobalValues.connectionString))
				{
					//Updating loan status o returned of selected copy
					connection.Open();
					SqlCommand loanUpdate = new SqlCommand("update loan set datereturned=GetDate() where copynumber='"+ copyNumber+"'",connection);
					loanUpdate.ExecuteNonQuery();
					//Updating dvd copy stock after loan return
					SqlCommand stockUpdate = new SqlCommand("update dvdtitle set copiesonloan=dvdtitle.copiesonloan-1,copiesonstock=dvdtitle.copiesonstock+1 where dvdnumber="+dvdNumber,connection);
					stockUpdate.ExecuteNonQuery();
					connection.Close();
				}
				// Redirecting to self
				Server.Transfer("issueDVDs.aspx");
			
		}
		}

		protected void checkCharge_Click(object sender, EventArgs e)
		{
			try {
				//Taking charges from gridview for charge calculation
				int standardCharge = int.Parse(copyLoanGridView0.Rows[0].Cells[7].Text);
				int penaltyCharge = int.Parse(copyLoanGridView0.Rows[0].Cells[8].Text);
				int totalPenaltyCharge = 0;
				//Calcualting time of loan for penalty charge calculation
				DateTime due = DateTime.Parse(copyLoanGridView0.Rows[0].Cells[5].Text);
				int dateCheck = (int)Math.Ceiling((float)DateTime.Now.Subtract(due).TotalDays);
				//Checking if the loan duration exceeds
				if (dateCheck > 0)
				{

					//Calculating charge with penalty
					totalPenaltyCharge = standardCharge + (penaltyCharge * dateCheck);
				}
				else
				{
					//Setting standard charge if duration does not exceed
					totalPenaltyCharge = standardCharge;
				}
				//Showing charge amount message 
				Response.Write("<script>alert('Your total charge is"+totalPenaltyCharge+"')</script>");
			} 
			catch (Exception ex) {
				//Showing error message if any occurs while checking charge
				Response.Write("<script>alert('Something Went Wrong');</script>");
			}
		}
	}
}