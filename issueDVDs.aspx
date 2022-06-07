<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="issueDVDs.aspx.cs" Inherits="ADGroupCourseWork.issueDVDs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	 <div class="container-fluid d-flex flex-column justify-content-center align-items-center">
      <div class="col-9">
         <div >
            <div class="card">
               <div class="card-body">
                  

                   <div class="row">
                     <div class="col">
                        <center>
                           <h2>Loan&nbsp; Issuing</h2>
                        </center>
                     </div>
                  </div>

                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col pb-2">
                        <label>Member</label>
                        <label id="memberIDLabel" hidden="hidden"></label>
                        <div class="form-group">
                           <asp:DropDownList ID="memberDropDownList" runat="server" DataSourceID="memberDataSource" DataTextField="MemberFirstName" DataValueField="MemberNumber" OnSelectedIndexChanged="memberDropDownList_SelectedIndexChanged" AutoPostBack="True" ValidationGroup="loanIssueValidationGroup">
										<asp:ListItem>Select Member</asp:ListItem>
									</asp:DropDownList>
									<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="memberDropDownList" ErrorMessage="Member Required To Issue Loan" ForeColor="Red" ValidationGroup="loanIssueValidationGroup"></asp:RequiredFieldValidator>
									<asp:SqlDataSource ID="memberDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT MemberNumber, MemberFirstName, AlignOrder FROM Member ORDER BY AlignOrder"></asp:SqlDataSource>
                        </div>
                     </div>
                     <div class="col-md-6 pb-2">
                        <label>Available DVD</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:DropDownList ID="dvdTitleDropDownList" runat="server" datasourceid="dvdTitleDataSource" DataTextField="DVDTitle" DataValueField="DVDNumber" ValidationGroup="loanIssueValidationGroup">
										</asp:DropDownList>
										<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dvdTitleDropDownList" ErrorMessage="DVD title required to issue loan" ForeColor="Red" ValidationGroup="loanIssueValidationGroup"></asp:RequiredFieldValidator>
										<asp:SqlDataSource ID="dvdTitleDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT DVDTitle.DVDNumber, DVDTitle.CategoryNumber, DVDTitle.StudioNumber, DVDTitle.ProducerNumber, DVDTitle.DVDTitle, DVDTitle.DateReleased, DVDTitle.StandardCharge, DVDTitle.PenaltyCharge, DVDTitle.CopiesOnLoan, DVDTitle.CopiesOnStock, DVDCategory.CategoryNumber AS Expr1, DVDCategory.CatgoryDescription, DVDCategory.AgeRestricted FROM DVDTitle INNER JOIN DVDCategory ON DVDTitle.CategoryNumber = DVDCategory.CategoryNumber" ></asp:SqlDataSource>

                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                  </div>
                  <div class="row ">
                      <div class="col">
                        <label>Loan Type</label>
                        <div class="form-group pb-2">
                           <asp:DropDownList class="form-control" ID="loanTypeDropDown" runat="server" DataSourceID="loanTypeDataSource" DataTextField="LoanType" DataValueField="LoanTypeNumber" ValidationGroup="loanIssueValidationGroup">
                           </asp:DropDownList>
                        	<asp:SqlDataSource ID="loanTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT * FROM [LoanType]"></asp:SqlDataSource>
                        	<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="loanTypeDropDown" ErrorMessage="Loan type required to issue loan" ForeColor="Red" ValidationGroup="loanIssueValidationGroup"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                      
                  </div>
                  <div class="row pt-2">
                     <div class="col">
                        <asp:Button ID="issueBtn" class="btn btn-lg btn-block btn-primary" runat="server" Text="Issue" OnClick="issueBtn_Click" Enabled="False" ValidationGroup="loanIssueValidationGroup" />
                     </div>
                     <div class="col-6">
                     </div>
                  </div>
               </div>
            </div>

         </div>
         <div class="col">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2>Issued Loan List</h2>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered table-responsive" ID="issueDVDsGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="LoanNumber" DataSourceID="loanDataSource">
									<Columns>
										<asp:CommandField ShowEditButton="True" />
										<asp:BoundField DataField="LoanNumber" HeaderText="LoanNumber" InsertVisible="False" ReadOnly="True" SortExpression="LoanNumber" />
										<asp:BoundField DataField="LoanTypeNumber" HeaderText="LoanTypeNumber" SortExpression="LoanTypeNumber" />
										<asp:BoundField DataField="CopyNumber" HeaderText="CopyNumber" SortExpression="CopyNumber" />
										<asp:BoundField DataField="MemberNumber" HeaderText="MemberNumber" SortExpression="MemberNumber" />
										<asp:BoundField DataField="DateOut" HeaderText="DateOut" SortExpression="DateOut" />
										<asp:BoundField DataField="DateDue" HeaderText="DateDue" SortExpression="DateDue" />
										<asp:BoundField DataField="DateReturned" HeaderText="DateReturned" SortExpression="DateReturned" />
									</Columns>
								</asp:GridView>
                     	<br />
								<asp:SqlDataSource ID="loanDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" DeleteCommand="DELETE FROM [Loan] WHERE [LoanNumber] = @original_LoanNumber AND [LoanTypeNumber] = @original_LoanTypeNumber AND [CopyNumber] = @original_CopyNumber AND [MemberNumber] = @original_MemberNumber AND [DateOut] = @original_DateOut AND [DateDue] = @original_DateDue AND (([DateReturned] = @original_DateReturned) OR ([DateReturned] IS NULL AND @original_DateReturned IS NULL))" InsertCommand="INSERT INTO [Loan] ([LoanTypeNumber], [CopyNumber], [MemberNumber], [DateOut], [DateDue], [DateReturned]) VALUES (@LoanTypeNumber, @CopyNumber, @MemberNumber, @DateOut, @DateDue, @DateReturned)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Loan]" UpdateCommand="UPDATE [Loan] SET [LoanTypeNumber] = @LoanTypeNumber, [CopyNumber] = @CopyNumber, [MemberNumber] = @MemberNumber, [DateOut] = @DateOut, [DateDue] = @DateDue, [DateReturned] = @DateReturned WHERE [LoanNumber] = @original_LoanNumber AND [LoanTypeNumber] = @original_LoanTypeNumber AND [CopyNumber] = @original_CopyNumber AND [MemberNumber] = @original_MemberNumber AND [DateOut] = @original_DateOut AND [DateDue] = @original_DateDue AND (([DateReturned] = @original_DateReturned) OR ([DateReturned] IS NULL AND @original_DateReturned IS NULL))">
									<DeleteParameters>
										<asp:Parameter Name="original_LoanNumber" Type="Int32" />
										<asp:Parameter Name="original_LoanTypeNumber" Type="Int32" />
										<asp:Parameter Name="original_CopyNumber" Type="Int32" />
										<asp:Parameter Name="original_MemberNumber" Type="Int32" />
										<asp:Parameter DbType="Date" Name="original_DateOut" />
										<asp:Parameter DbType="Date" Name="original_DateDue" />
										<asp:Parameter DbType="Date" Name="original_DateReturned" />
									</DeleteParameters>
									<InsertParameters>
										<asp:Parameter Name="LoanTypeNumber" Type="Int32" />
										<asp:Parameter Name="CopyNumber" Type="Int32" />
										<asp:Parameter Name="MemberNumber" Type="Int32" />
										<asp:Parameter DbType="Date" Name="DateOut" />
										<asp:Parameter DbType="Date" Name="DateDue" />
										<asp:Parameter DbType="Date" Name="DateReturned" />
									</InsertParameters>
									<UpdateParameters>
										<asp:Parameter Name="LoanTypeNumber" Type="Int32" />
										<asp:Parameter Name="CopyNumber" Type="Int32" />
										<asp:Parameter Name="MemberNumber" Type="Int32" />
										<asp:Parameter DbType="Date" Name="DateOut" />
										<asp:Parameter DbType="Date" Name="DateDue" />
										<asp:Parameter DbType="Date" Name="DateReturned" />
										<asp:Parameter Name="original_LoanNumber" Type="Int32" />
										<asp:Parameter Name="original_LoanTypeNumber" Type="Int32" />
										<asp:Parameter Name="original_CopyNumber" Type="Int32" />
										<asp:Parameter Name="original_MemberNumber" Type="Int32" />
										<asp:Parameter DbType="Date" Name="original_DateOut" />
										<asp:Parameter DbType="Date" Name="original_DateDue" />
										<asp:Parameter DbType="Date" Name="original_DateReturned" />
									</UpdateParameters>
								</asp:SqlDataSource>
								<br />
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2>Issued DVD List On Loan Not Returned</h2>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="issueDVDsGrid0" runat="server" AutoGenerateColumns="False" DataSourceID="loanNotReturnedDataSource">
									<Columns>
										<asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
										<asp:BoundField DataField="CopyNumber" HeaderText="CopyNumber" SortExpression="CopyNumber" />
										<asp:BoundField DataField="MemberLastName" HeaderText="MemberLastName" SortExpression="MemberLastName" />
										<asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
										<asp:BoundField DataField="DateOut" HeaderText="DateOut" SortExpression="DateOut" />
									</Columns>
								</asp:GridView>
                     	<br />
								<asp:SqlDataSource ID="loanNotReturnedDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" DeleteCommand="DELETE FROM [Loan] WHERE [LoanNumber] = @original_LoanNumber AND [LoanTypeNumber] = @original_LoanTypeNumber AND [CopyNumber] = @original_CopyNumber AND [MemberNumber] = @original_MemberNumber AND [DateOut] = @original_DateOut AND [DateDue] = @original_DateDue AND (([DateReturned] = @original_DateReturned) OR ([DateReturned] IS NULL AND @original_DateReturned IS NULL))" InsertCommand="INSERT INTO [Loan] ([LoanTypeNumber], [CopyNumber], [MemberNumber], [DateOut], [DateDue], [DateReturned]) VALUES (@LoanTypeNumber, @CopyNumber, @MemberNumber, @DateOut, @DateDue, @DateReturned)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT DVDTitle.DVDTitle, Loan.CopyNumber, Member.MemberLastName, Member.MemberFirstName, Loan.DateOut FROM Member INNER JOIN Loan ON Member.MemberNumber = Loan.MemberNumber INNER JOIN DVDCopy ON Loan.CopyNumber = DVDCopy.CopyNumber INNER JOIN DVDTitle ON DVDCopy.DVDNumber = DVDTitle.DVDNumber WHERE (Loan.DateReturned IS NULL) ORDER BY Loan.DateOut" UpdateCommand="UPDATE [Loan] SET [LoanTypeNumber] = @LoanTypeNumber, [CopyNumber] = @CopyNumber, [MemberNumber] = @MemberNumber, [DateOut] = @DateOut, [DateDue] = @DateDue, [DateReturned] = @DateReturned WHERE [LoanNumber] = @original_LoanNumber AND [LoanTypeNumber] = @original_LoanTypeNumber AND [CopyNumber] = @original_CopyNumber AND [MemberNumber] = @original_MemberNumber AND [DateOut] = @original_DateOut AND [DateDue] = @original_DateDue AND (([DateReturned] = @original_DateReturned) OR ([DateReturned] IS NULL AND @original_DateReturned IS NULL))">
									<DeleteParameters>
										<asp:Parameter Name="original_LoanNumber" Type="Int32" />
										<asp:Parameter Name="original_LoanTypeNumber" Type="Int32" />
										<asp:Parameter Name="original_CopyNumber" Type="Int32" />
										<asp:Parameter Name="original_MemberNumber" Type="Int32" />
										<asp:Parameter DbType="Date" Name="original_DateOut" />
										<asp:Parameter DbType="Date" Name="original_DateDue" />
										<asp:Parameter DbType="Date" Name="original_DateReturned" />
									</DeleteParameters>
									<InsertParameters>
										<asp:Parameter Name="LoanTypeNumber" Type="Int32" />
										<asp:Parameter Name="CopyNumber" Type="Int32" />
										<asp:Parameter Name="MemberNumber" Type="Int32" />
										<asp:Parameter DbType="Date" Name="DateOut" />
										<asp:Parameter DbType="Date" Name="DateDue" />
										<asp:Parameter DbType="Date" Name="DateReturned" />
									</InsertParameters>
									<UpdateParameters>
										<asp:Parameter Name="LoanTypeNumber" Type="Int32" />
										<asp:Parameter Name="CopyNumber" Type="Int32" />
										<asp:Parameter Name="MemberNumber" Type="Int32" />
										<asp:Parameter DbType="Date" Name="DateOut" />
										<asp:Parameter DbType="Date" Name="DateDue" />
										<asp:Parameter DbType="Date" Name="DateReturned" />
										<asp:Parameter Name="original_LoanNumber" Type="Int32" />
										<asp:Parameter Name="original_LoanTypeNumber" Type="Int32" />
										<asp:Parameter Name="original_CopyNumber" Type="Int32" />
										<asp:Parameter Name="original_MemberNumber" Type="Int32" />
										<asp:Parameter DbType="Date" Name="original_DateOut" />
										<asp:Parameter DbType="Date" Name="original_DateDue" />
										<asp:Parameter DbType="Date" Name="original_DateReturned" />
									</UpdateParameters>
								</asp:SqlDataSource>
								<br />
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2>Number of Issued DVD On Loan Not Returned</h2>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="issueDVDsGrid1" runat="server" AutoGenerateColumns="False" DataSourceID="loanNotReturnedCountDataSource">
									<Columns>
										<asp:BoundField DataField="DateOut" HeaderText="DateOut" SortExpression="DateOut" />
										<asp:BoundField DataField="NumberOfLoans" HeaderText="NumberOfLoans" ReadOnly="True" SortExpression="NumberOfLoans" />
									</Columns>
								</asp:GridView>
                     	<br />
								<asp:SqlDataSource ID="loanNotReturnedCountDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" DeleteCommand="DELETE FROM [Loan] WHERE [LoanNumber] = @original_LoanNumber AND [LoanTypeNumber] = @original_LoanTypeNumber AND [CopyNumber] = @original_CopyNumber AND [MemberNumber] = @original_MemberNumber AND [DateOut] = @original_DateOut AND [DateDue] = @original_DateDue AND (([DateReturned] = @original_DateReturned) OR ([DateReturned] IS NULL AND @original_DateReturned IS NULL))" InsertCommand="INSERT INTO [Loan] ([LoanTypeNumber], [CopyNumber], [MemberNumber], [DateOut], [DateDue], [DateReturned]) VALUES (@LoanTypeNumber, @CopyNumber, @MemberNumber, @DateOut, @DateDue, @DateReturned)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT DateOut, COUNT(LoanNumber) AS NumberOfLoans FROM Loan WHERE (DateReturned IS NULL) GROUP BY DateOut ORDER BY DateOut" UpdateCommand="UPDATE [Loan] SET [LoanTypeNumber] = @LoanTypeNumber, [CopyNumber] = @CopyNumber, [MemberNumber] = @MemberNumber, [DateOut] = @DateOut, [DateDue] = @DateDue, [DateReturned] = @DateReturned WHERE [LoanNumber] = @original_LoanNumber AND [LoanTypeNumber] = @original_LoanTypeNumber AND [CopyNumber] = @original_CopyNumber AND [MemberNumber] = @original_MemberNumber AND [DateOut] = @original_DateOut AND [DateDue] = @original_DateDue AND (([DateReturned] = @original_DateReturned) OR ([DateReturned] IS NULL AND @original_DateReturned IS NULL))">
									<DeleteParameters>
										<asp:Parameter Name="original_LoanNumber" Type="Int32" />
										<asp:Parameter Name="original_LoanTypeNumber" Type="Int32" />
										<asp:Parameter Name="original_CopyNumber" Type="Int32" />
										<asp:Parameter Name="original_MemberNumber" Type="Int32" />
										<asp:Parameter DbType="Date" Name="original_DateOut" />
										<asp:Parameter DbType="Date" Name="original_DateDue" />
										<asp:Parameter DbType="Date" Name="original_DateReturned" />
									</DeleteParameters>
									<InsertParameters>
										<asp:Parameter Name="LoanTypeNumber" Type="Int32" />
										<asp:Parameter Name="CopyNumber" Type="Int32" />
										<asp:Parameter Name="MemberNumber" Type="Int32" />
										<asp:Parameter DbType="Date" Name="DateOut" />
										<asp:Parameter DbType="Date" Name="DateDue" />
										<asp:Parameter DbType="Date" Name="DateReturned" />
									</InsertParameters>
									<UpdateParameters>
										<asp:Parameter Name="LoanTypeNumber" Type="Int32" />
										<asp:Parameter Name="CopyNumber" Type="Int32" />
										<asp:Parameter Name="MemberNumber" Type="Int32" />
										<asp:Parameter DbType="Date" Name="DateOut" />
										<asp:Parameter DbType="Date" Name="DateDue" />
										<asp:Parameter DbType="Date" Name="DateReturned" />
										<asp:Parameter Name="original_LoanNumber" Type="Int32" />
										<asp:Parameter Name="original_LoanTypeNumber" Type="Int32" />
										<asp:Parameter Name="original_CopyNumber" Type="Int32" />
										<asp:Parameter Name="original_MemberNumber" Type="Int32" />
										<asp:Parameter DbType="Date" Name="original_DateOut" />
										<asp:Parameter DbType="Date" Name="original_DateDue" />
										<asp:Parameter DbType="Date" Name="original_DateReturned" />
									</UpdateParameters>
								</asp:SqlDataSource>
                     </div>
                  </div>
                     </div>
                  </div>
								<br />
								<br />
								<h2>LoanDetailOfACopy</h2>
								<br />
								<asp:DropDownList class="col-md-2" ID="copyDropDownList" runat="server" DataSourceID="copyDataSource" DataTextField="CopyNumber" DataValueField="CopyNumber" AutoPostBack="True">
								</asp:DropDownList>
								<br />
								<asp:SqlDataSource ID="copyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT [CopyNumber] FROM [Loan] group by copynumber"></asp:SqlDataSource>
								<br />
								<asp:GridView class="table table-striped table-bordered" ID="copyLoanGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="copyLoanDataSource">
									<Columns>
										<asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
										<asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
										<asp:BoundField DataField="MemberLastName" HeaderText="MemberLastName" SortExpression="MemberLastName" />
										<asp:BoundField DataField="DateOut" HeaderText="DateOut" SortExpression="DateOut" />
										<asp:BoundField DataField="DateDue" HeaderText="DateDue" SortExpression="DateDue" />
										<asp:BoundField DataField="DateReturned" HeaderText="DateReturned" SortExpression="DateReturned" />
									</Columns>
								</asp:GridView>
								<br />
								<asp:SqlDataSource ID="copyLoanDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT DVDTitle.DVDTitle, Member.MemberFirstName, Member.MemberLastName, Loan.DateOut, Loan.DateDue, Loan.DateReturned FROM DVDTitle INNER JOIN DVDCopy ON DVDTitle.DVDNumber = DVDCopy.DVDNumber INNER JOIN Loan ON DVDCopy.CopyNumber = Loan.CopyNumber INNER JOIN Member ON Loan.MemberNumber = Member.MemberNumber WHERE (DVDCopy.CopyNumber = @copynumber)">
									<SelectParameters>
										<asp:ControlParameter ControlID="copyDropDownList" Name="copynumber" PropertyName="SelectedValue" />
									</SelectParameters>
								</asp:SqlDataSource>
								<br />
								<h2>Loan Return</h2>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="copyDropDownList0" ErrorMessage="DVD copy required to check/return loan" ForeColor="Red" ValidationGroup="loanReturnValidationGroup"></asp:RequiredFieldValidator>
						<br />
								<asp:DropDownList class="col-md-2" ID="copyDropDownList0" runat="server" DataSourceID="copyDataSource0" DataTextField="CopyNumber" DataValueField="CopyNumber" AutoPostBack="True" ValidationGroup="loanReturnValidationGroup">
								</asp:DropDownList>
								<br />
								<asp:SqlDataSource ID="copyDataSource0" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT CopyNumber FROM Loan WHERE (DateReturned IS NULL)"></asp:SqlDataSource>
								<br />
								<div class="col">
								<asp:GridView class="table table-striped table-bordered" ID="copyLoanGridView0" runat="server" AllowPaging="True" AutoGenerateColumns="False" datasourceid="copyLoanDataSource0" DataKeyNames="DVDNumber">
									<Columns>
										<asp:BoundField DataField="DVDNumber" HeaderText="DVDNumber" SortExpression="DVDNumber" InsertVisible="False" ReadOnly="True" />
										<asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
										<asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
										<asp:BoundField DataField="MemberLastName" HeaderText="MemberLastName" SortExpression="MemberLastName" />
										<asp:BoundField DataField="DateOut" HeaderText="DateOut" SortExpression="DateOut" />
										<asp:BoundField DataField="DateDue" HeaderText="DateDue" SortExpression="DateDue" />
										<asp:BoundField DataField="DateReturned" HeaderText="DateReturned" SortExpression="DateReturned" />
										<asp:BoundField DataField="StandardCharge" HeaderText="StandardCharge" SortExpression="StandardCharge" />
										<asp:BoundField DataField="PenaltyCharge" HeaderText="PenaltyCharge" SortExpression="PenaltyCharge" />
									</Columns>
								</asp:GridView>
									</div>
								<asp:SqlDataSource ID="copyLoanDataSource0" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT DVDTitle.DVDNumber, DVDTitle.DVDTitle, Member.MemberFirstName, Member.MemberLastName, Loan.DateOut, Loan.DateDue, Loan.DateReturned, DVDTitle.StandardCharge, DVDTitle.PenaltyCharge FROM DVDTitle INNER JOIN DVDCopy ON DVDTitle.DVDNumber = DVDCopy.DVDNumber INNER JOIN Loan ON DVDCopy.CopyNumber = Loan.CopyNumber INNER JOIN Member ON Loan.MemberNumber = Member.MemberNumber WHERE (DVDCopy.CopyNumber = @copynumber) AND (Loan.DateReturned IS NULL)">
									<SelectParameters>
										<asp:ControlParameter ControlID="copyDropDownList0" Name="copynumber" PropertyName="SelectedValue" />
									</SelectParameters>
								</asp:SqlDataSource>
								<div class="d-flex col-md-4">
									
										<asp:Button ID="checkCharge" class="btn btn-primary"  runat="server" Text="Check Charge" OnClick="checkCharge_Click" ValidationGroup="loanReturnValidationGroup" />
										<asp:Button ID="returnBtn" class="btn btn-primary" runat="server" Text="Return" OnClick="returnBtn_Click" ValidationGroup="loanReturnValidationGroup" />
										</div>															                        
							
                        
                     	<br />
								<br />
								<br />
								<h2>Loan Taken By Member Within 31 Daysys</h2>
								<br />
								<asp:DropDownList class="col-md-2" ID="memberDropDownList0" runat="server" AutoPostBack="True" DataSourceID="memberDataSource" DataTextField="MemberFirstName" DataValueField="MemberNumber">
								</asp:DropDownList>
								<br />
								<asp:GridView class="table table-striped table-bordered" ID="loanTaken31GridView" runat="server" AutoGenerateColumns="False" DataKeyNames="CopyNumber" DataSourceID="loanTaken31DataSource" AllowPaging="True">
									<Columns>
										<asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
										<asp:BoundField DataField="CopyNumber" HeaderText="CopyNumber" InsertVisible="False" ReadOnly="True" SortExpression="CopyNumber" />
									</Columns>
								</asp:GridView>
								<asp:SqlDataSource ID="loanTaken31DataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT DVDTitle.DVDTitle, DVDCopy.CopyNumber FROM DVDTitle INNER JOIN DVDCopy ON DVDTitle.DVDNumber = DVDCopy.DVDNumber INNER JOIN Loan ON DVDCopy.CopyNumber = Loan.CopyNumber INNER JOIN Member ON Loan.MemberNumber = Member.MemberNumber WHERE (Member.MemberNumber = @membernumber) AND (DATEDIFF(DAY, Loan.DateOut, GETDATE()) &lt;= 31)">
									<SelectParameters>
										<asp:ControlParameter ControlID="memberDropDownList0" Name="membernumber" PropertyName="SelectedValue" />
									</SelectParameters>
								</asp:SqlDataSource>
								<br />
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
