<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="addMember.aspx.cs" Inherits="ADGroupCourseWork.addMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	 <div class="container-fluid  d-flex  flex-column juistify-content-center align-items-center">
      <div class="">
         <div class="col">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2>Member Profile</h2>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-6">
                        <label>First Name</label>
                        <div class="form-group pb-2">
                           <asp:TextBox CssClass="form-control" ID="firstNameTxtBox" runat="server" placeholder="First Name" ValidationGroup="addMemberValidationGroup"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="FirstNameRequiredValidator" runat="server" ErrorMessage="FirstName is Required" ControlToValidate="firstNameTxtBox" ForeColor="Red" ValidationGroup="addMemberValidationGroup"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                      <div class="col-md-6">
                        <label>Last Name</label>
                        <div class="form-group pb-2">
                           <asp:TextBox CssClass="form-control" ID="lastNameTxtBox" runat="server" placeholder="Last Name" ValidationGroup="addMemberValidationGroup"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="LastNameValidator" runat="server" ErrorMessage="LastName is Required" ControlToValidate="lastNameTxtBox" ForeColor="Red" ValidationGroup="addMemberValidationGroup"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     
                  </div>
                  <div class="row">
                      <div class="col-md-6">
                        <label>Date of Birth</label>
                        <div class="form-group pb-2">
                           <asp:TextBox CssClass="form-control" ID="dobTxtBox" runat="server" placeholder="Password" TextMode="Date" ValidationGroup="addMemberValidationGroup"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="DOBValidator" runat="server" ErrorMessage="DOB is Required" ControlToValidate="dobTxtBox" ForeColor="Red" ValidationGroup="addMemberValidationGroup"></asp:RequiredFieldValidator>
                        </div>
</div>
                     <div class="col-md-6">
                        Address
                        <div class="form-group pb-2">
                           <asp:TextBox class="form-control" ID="addressTxtBox" runat="server" placeholder="City" ValidationGroup="addMemberValidationGroup"></asp:TextBox><asp:RequiredFieldValidator ID="AddressValidator" runat="server" ErrorMessage="Address is Required" ControlToValidate="addressTxtBox" ForeColor="Red" ValidationGroup="addMemberValidationGroup"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     
                  </div>
                  <div class="row">
                      
                     
                    
                  <div class="row">
                     <div class="col">
                        <div class="form-group pb-2">
                        	<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="membershipTypeDropDown" ErrorMessage="Membership Type Required" ForeColor="Red" ValidationGroup="addMemberValidationGroup"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <label>Membership Type</label>
                        <div class="form-group pb-2">
                           <asp:DropDownList class="form-control" ID="membershipTypeDropDown" runat="server" DataSourceID="memberShipTypeDataSource" DataTextField="MembershipCategoryDescription" DataValueField="MembershipCategoryNumber" ValidationGroup="addMemberValidationGroup">
                              <asp:ListItem Text="Bronze" Value="Bronze" />
                              <asp:ListItem Text="Silver" Value="Silver" />
                              <asp:ListItem Text="Gold" Value="Gold" />
                              <asp:ListItem Text="Platinum" Value="Platinum" />
                           </asp:DropDownList>
                        	<asp:SqlDataSource ID="memberShipTypeDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT [MembershipCategoryNumber], [MembershipCategoryDescription] FROM [MembershipCategory]"></asp:SqlDataSource>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col mx-auto">
                        <center>
                           <div class="form-group col-4">
                              <asp:Button class="btn btn-primary btn-block btn" ID="addMemeberBtn" runat="server" Text="Add Member" OnClick="addMemeberBtn_Click" ValidationGroup="addMemberValidationGroup" />
                           </div>
                        </center>
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
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2>Member List</h2>
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
                        <asp:GridView class="table table-striped table-bordered" ID="memberGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="MemberNumber" DataSourceID="membersDataSource" AllowPaging="True">
									<Columns>
										<asp:BoundField DataField="MemberNumber" HeaderText="MemberNumber" InsertVisible="False" ReadOnly="True" SortExpression="MemberNumber" />
										<asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
										<asp:BoundField DataField="MemberLastName" HeaderText="MemberLastName" SortExpression="MemberLastName" />
										<asp:BoundField DataField="MembershipCategoryDescription" HeaderText="MembershipCategoryDescription" SortExpression="MembershipCategoryDescription" />
										<asp:BoundField DataField="MemberAddress" HeaderText="MemberAddress" SortExpression="MemberAddress" />
										<asp:BoundField DataField="MemberDateOfBirth" HeaderText="MemberDateOfBirth" SortExpression="MemberDateOfBirth" />
										<asp:BoundField DataField="LoanTaken" HeaderText="LoanTaken" SortExpression="LoanTaken" />
									</Columns>
								</asp:GridView>
                     	<br />
								<asp:SqlDataSource ID="membersDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" DeleteCommand="DELETE FROM [Member] WHERE [MemberNumber] = @original_MemberNumber AND [MembershipCategoryNumber] = @original_MembershipCategoryNumber AND [MemberLastName] = @original_MemberLastName AND [MemberFirstName] = @original_MemberFirstName AND [MemberAddress] = @original_MemberAddress AND [MemberDateOfBirth] = @original_MemberDateOfBirth AND [LoanTaken] = @original_LoanTaken" InsertCommand="INSERT INTO [Member] ([MembershipCategoryNumber], [MemberLastName], [MemberFirstName], [MemberAddress], [MemberDateOfBirth], [LoanTaken]) VALUES (@MembershipCategoryNumber, @MemberLastName, @MemberFirstName, @MemberAddress, @MemberDateOfBirth, @LoanTaken)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT Member.MemberNumber, Member.MemberFirstName, Member.MemberLastName, MembershipCategory.MembershipCategoryDescription, Member.MemberAddress, Member.MemberDateOfBirth, Member.LoanTaken FROM Member INNER JOIN MembershipCategory ON Member.MembershipCategoryNumber = MembershipCategory.MembershipCategoryNumber ORDER BY Member.MemberFirstName" UpdateCommand="UPDATE [Member] SET [MembershipCategoryNumber] = @MembershipCategoryNumber, [MemberLastName] = @MemberLastName, [MemberFirstName] = @MemberFirstName, [MemberAddress] = @MemberAddress, [MemberDateOfBirth] = @MemberDateOfBirth, [LoanTaken] = @LoanTaken WHERE [MemberNumber] = @original_MemberNumber AND [MembershipCategoryNumber] = @original_MembershipCategoryNumber AND [MemberLastName] = @original_MemberLastName AND [MemberFirstName] = @original_MemberFirstName AND [MemberAddress] = @original_MemberAddress AND [MemberDateOfBirth] = @original_MemberDateOfBirth AND [LoanTaken] = @original_LoanTaken">
									<DeleteParameters>
										<asp:Parameter Name="original_MemberNumber" Type="Int32" />
										<asp:Parameter Name="original_MembershipCategoryNumber" Type="Byte" />
										<asp:Parameter Name="original_MemberLastName" Type="String" />
										<asp:Parameter Name="original_MemberFirstName" Type="String" />
										<asp:Parameter Name="original_MemberAddress" Type="String" />
										<asp:Parameter DbType="Date" Name="original_MemberDateOfBirth" />
										<asp:Parameter Name="original_LoanTaken" Type="Byte" />
									</DeleteParameters>
									<InsertParameters>
										<asp:ControlParameter ControlID="membershipTypeDropDown" Name="MembershipCategoryNumber" PropertyName="SelectedValue" Type="Byte" />
										<asp:ControlParameter ControlID="lastNameTxtBox" Name="MemberLastName" PropertyName="Text" Type="String" />
										<asp:ControlParameter ControlID="firstNameTxtBox" Name="MemberFirstName" PropertyName="Text" Type="String" />
										<asp:ControlParameter ControlID="addressTxtBox" Name="MemberAddress" PropertyName="Text" Type="String" />
										<asp:ControlParameter ControlID="dobTxtBox" DbType="Date" Name="MemberDateOfBirth" PropertyName="Text" />
										<asp:Parameter DefaultValue="0" Name="LoanTaken" Type="Byte" />
									</InsertParameters>
									<UpdateParameters>
										<asp:Parameter Name="MembershipCategoryNumber" Type="Byte" />
										<asp:Parameter Name="MemberLastName" Type="String" />
										<asp:Parameter Name="MemberFirstName" Type="String" />
										<asp:Parameter Name="MemberAddress" Type="String" />
										<asp:Parameter DbType="Date" Name="MemberDateOfBirth" />
										<asp:Parameter Name="LoanTaken" Type="Byte" />
										<asp:Parameter Name="original_MemberNumber" Type="Int32" />
										<asp:Parameter Name="original_MembershipCategoryNumber" Type="Byte" />
										<asp:Parameter Name="original_MemberLastName" Type="String" />
										<asp:Parameter Name="original_MemberFirstName" Type="String" />
										<asp:Parameter Name="original_MemberAddress" Type="String" />
										<asp:Parameter DbType="Date" Name="original_MemberDateOfBirth" />
										<asp:Parameter Name="original_LoanTaken" Type="Byte" />
									</UpdateParameters>
								</asp:SqlDataSource>
                     	<br />
								<br />
								<h2>Member List Who have not taken any dvd on loan in last 31 days</h2><br />
								<asp:GridView  class="table table-striped table-bordered" ID="memberNotTakenLoanMonthGridView" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="MemberNumber" DataSourceID="memberNotTakenLoanMonthDataSource">
									<Columns>
										<asp:BoundField DataField="MemberNumber" HeaderText="MemberNumber" InsertVisible="False" ReadOnly="True" SortExpression="MemberNumber" />
										<asp:BoundField DataField="MemberFirstName" HeaderText="MemberFirstName" SortExpression="MemberFirstName" />
										<asp:BoundField DataField="MemberLastName" HeaderText="MemberLastName" SortExpression="MemberLastName" />
										<asp:BoundField DataField="MemberAddress" HeaderText="MemberAddress" SortExpression="MemberAddress" />
									</Columns>
								</asp:GridView>
								<asp:SqlDataSource ID="memberNotTakenLoanMonthDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT MemberNumber, MemberFirstName, MemberLastName, MemberAddress FROM Member WHERE (MemberNumber NOT IN (SELECT Member_1.MemberNumber FROM Member AS Member_1 INNER JOIN Loan ON Member_1.MemberNumber = Loan.MemberNumber INNER JOIN DVDCopy ON Loan.CopyNumber = DVDCopy.CopyNumber WHERE (DATEDIFF(DAY, Loan.DateOut, GETDATE()) &lt; 31) GROUP BY Member_1.MemberNumber))"></asp:SqlDataSource>
								<br />
								<br />
								<br />
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>
