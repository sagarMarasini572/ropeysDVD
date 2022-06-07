<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="addDVDs.aspx.cs" Inherits="ADGroupCourseWork.addDVDs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	 <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">

                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                    <div class="row">
                     <div class="col pt-2 pb-2">
                        <center>
                           <h4>Add DVD Category</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col-md-8">
                        <div class="form-group pb-2">
                        </div>
                     </div>
                      
                     <div class="col-md-8">
                        <label>Category Description</label>
                        <div class="form-group pb-2">
                           <asp:TextBox CssClass="form-control" ID="categoryDescTxtBox" runat="server" placeholder="Category Description" TextMode="MultiLine" Rows="2" ControlToValidate="categoryDescTxtBox" ValidationGroup="categoryAddValidationGroup"></asp:TextBox><asp:RequiredFieldValidator ID="CategoryDescRequiredValidator" runat="server" ErrorMessage="Category Description is Required" ControlToValidate="categoryDescTxtBox" ForeColor="Red" ValidationGroup="categoryAddValidationGroup"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                     <div class="col-md-6">
                        <div class="form-group pb-2">
                            <asp:CheckBox ID="ageRestrictionCheckBox" runat="server" ForeColor="#FF3300" Text="movie is 18+?" ValidationGroup="categoryAddValidationGroup" />
                        </div>
								<asp:Button ID="categoryAddBtn" class="btn btn-lg btn-block btn-success" runat="server" Text="Add DVD Category" OnClick="categoryAddBtn_Click" ValidationGroup="categoryAddValidationGroup" />
								<br />
								<asp:SqlDataSource ID="categoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" DeleteCommand="DELETE FROM [DVDCategory] WHERE [CategoryNumber] = @original_CategoryNumber AND [CatgoryDescription] = @original_CatgoryDescription AND [AgeRestricted] = @original_AgeRestricted" InsertCommand="INSERT INTO [DVDCategory] ([CatgoryDescription], [AgeRestricted]) VALUES (@CatgoryDescription, @AgeRestricted)" SelectCommand="SELECT * FROM [DVDCategory]" UpdateCommand="UPDATE [DVDCategory] SET [CatgoryDescription] = @CatgoryDescription, [AgeRestricted] = @AgeRestricted WHERE [CategoryNumber] = @original_CategoryNumber AND [CatgoryDescription] = @original_CatgoryDescription AND [AgeRestricted] = @original_AgeRestricted" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}">
									<DeleteParameters>
										<asp:Parameter Name="original_CategoryNumber" Type="Int32" />
										<asp:Parameter Name="original_CatgoryDescription" Type="String" />
										<asp:Parameter Name="original_AgeRestricted" Type="Boolean" />
									</DeleteParameters>
									<InsertParameters>
										<asp:ControlParameter ControlID="categoryDescTxtBox" Name="CatgoryDescription" PropertyName="Text" Type="String" />
										<asp:ControlParameter ControlID="ageRestrictionCheckBox" Name="AgeRestricted" PropertyName="Checked" Type="Boolean" />
									</InsertParameters>
									<UpdateParameters>
										<asp:Parameter Name="CatgoryDescription" Type="String" />
										<asp:Parameter Name="AgeRestricted" Type="Boolean" />
										<asp:Parameter Name="original_CategoryNumber" Type="Int32" />
										<asp:Parameter Name="original_CatgoryDescription" Type="String" />
										<asp:Parameter Name="original_AgeRestricted" Type="Boolean" />
									</UpdateParameters>
								</asp:SqlDataSource>
                     </div>
                  </div>

                   <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                   <div class="row">
                     <div class="col pt-2 pb-2">
                        <center>
                           <h4>Add DVD Details</h4>
                        </center>
                     </div>
                  </div>

                   <div class="row">
                      <div class="col-md-6 pb-2">
								<label>
								DVD Title</label>
								<div class="form-group">
									<asp:TextBox CssClass="form-control" ID="dvdNameTxtBox" runat="server" placeholder="DVD Name" ValidationGroup="dvdAddValidationGroup"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="DVDTitleRequiredValidator" runat="server" ErrorMessage="DVD Title is Required" ControlToValidate="dvdNameTxtBox" ForeColor="Red" ValidationGroup="dvdAddValidationGroup"></asp:RequiredFieldValidator>
								</div>
							</div>

                         <div class="col-md-6">
                            <label>Released Date</label>
                            <div class="form-group pb-2">
                               <asp:TextBox CssClass="form-control" ID="releaseDateTxtBox" runat="server" placeholder="Date" TextMode="Date" ValidationGroup="dvdAddValidationGroup"></asp:TextBox><asp:RequiredFieldValidator ID="ReleaseDateRequiredValidator" runat="server" ErrorMessage="Release Date is Required" ForeColor="Red" ControlToValidate="releaseDateTxtBox" ValidationGroup="dvdAddValidationGroup"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>

                   

                    

                  <div class="row">
							
                              <div class="col-md-6">
                                <label>Producer Name</label>
                                <div class="form-group pb-2">
                                   <asp:DropDownList class="form-control" ID="producerNameDropDown" runat="server" DataSourceID="producerDataSource" DataTextField="ProducerName" DataValueField="ProducerNumber" ValidationGroup="dvdAddValidationGroup">
                                   </asp:DropDownList>
                               <asp:RequiredFieldValidator ID="ProducerNameRequiredValidator" runat="server" ErrorMessage="Producer Name Is Required" ControlToValidate="producerNameDropDown" ForeColor="Red" ValidationGroup="dvdAddValidationGroup"></asp:RequiredFieldValidator>
                                	<asp:SqlDataSource ID="producerDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT * FROM [Producer]"></asp:SqlDataSource>
                                </div>
                             </div>

                     <div class="col-md-6">
                        <label>Category</label>
                        <div class="form-group">
                            <asp:DropDownList class="form-control" ID="categoryDropDown" runat="server" DataSourceID="categoryDataSource" DataTextField="CatgoryDescription" DataValueField="CategoryNumber" ValidationGroup="dvdAddValidationGroup">
                           </asp:DropDownList>
                               
                        </div>
                     </div>
                  </div>

                  <div class="row">
                      

                     <div class="col-md-6">
                        <label>Studio</label>
                        <div class="form-group">
                            <asp:DropDownList class="form-control" ID="studioDropDownList" runat="server" DataSourceID="studioDataSource" DataTextField="StudioName" DataValueField="StudioNumber" ValidationGroup="dvdAddValidationGroup">
                           </asp:DropDownList>
                               
                        	 <asp:SqlDataSource ID="studioDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT * FROM [Studio]"></asp:SqlDataSource>
                        </div>
                     </div>

                     <div class="col-md-6 pb-2">
                        <label>DVD Standard Charge</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="dvdStrandardChargeTxtBox" runat="server" placeholder="DVD Cost(per unit)" TextMode="Number" ValidationGroup="dvdAddValidationGroup"></asp:TextBox>
                               <asp:RequiredFieldValidator ID="DVDStandardChargeRequiredValidator" runat="server" ErrorMessage="DVD Standard Charge Is Required" ControlToValidate="dvdStrandardChargeTxtBox" ForeColor="Red" ValidationGroup="dvdAddValidationGroup"></asp:RequiredFieldValidator>
                        </div>
                     </div>

                     <div class="col-md-6 pb-2">
                        <label>DVD Penalty Charge</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="dvdPenaltyChargeTxtBox" runat="server" placeholder="DVD Cost(per unit)" TextMode="Number" ValidationGroup="dvdAddValidationGroup"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="DVDPenaltyChargeRequiredValidator" runat="server" ErrorMessage="DVD PenaltyCharge Is Required" ControlToValidate="dvdPenaltyChargeTxtBox" ForeColor="Red" ValidationGroup="dvdAddValidationGroup"></asp:RequiredFieldValidator>
                        </div>
                     </div>
                  </div>

                  

                  <div class="row">
                     <div class="col-4">
                        <asp:Button ID="DVDAddBtn" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="DVDAddBtn_Click" ValidationGroup="dvdAddValidationGroup" />
                     	<br />
								<asp:SqlDataSource ID="dvdDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" DeleteCommand="DELETE FROM [DVDTitle] WHERE [DVDNumber] = @original_DVDNumber AND [CategoryNumber] = @original_CategoryNumber AND [StudioNumber] = @original_StudioNumber AND [ProducerNumber] = @original_ProducerNumber AND [DVDTitle] = @original_DVDTitle AND [DateReleased] = @original_DateReleased AND [StandardCharge] = @original_StandardCharge AND [PenaltyCharge] = @original_PenaltyCharge AND [CopiesOnLoan] = @original_CopiesOnLoan AND [CopiesOnStock] = @original_CopiesOnStock" InsertCommand="INSERT INTO [DVDTitle] ([CategoryNumber], [StudioNumber], [ProducerNumber], [DVDTitle], [DateReleased], [StandardCharge], [PenaltyCharge], [CopiesOnLoan], [CopiesOnStock]) VALUES (@CategoryNumber, @StudioNumber, @ProducerNumber, @DVDTitle, @DateReleased, @StandardCharge, @PenaltyCharge, @CopiesOnLoan, @CopiesOnStock)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DVDTitle]" UpdateCommand="UPDATE [DVDTitle] SET [CategoryNumber] = @CategoryNumber, [StudioNumber] = @StudioNumber, [ProducerNumber] = @ProducerNumber, [DVDTitle] = @DVDTitle, [DateReleased] = @DateReleased, [StandardCharge] = @StandardCharge, [PenaltyCharge] = @PenaltyCharge, [CopiesOnLoan] = @CopiesOnLoan, [CopiesOnStock] = @CopiesOnStock WHERE [DVDNumber] = @original_DVDNumber AND [CategoryNumber] = @original_CategoryNumber AND [StudioNumber] = @original_StudioNumber AND [ProducerNumber] = @original_ProducerNumber AND [DVDTitle] = @original_DVDTitle AND [DateReleased] = @original_DateReleased AND [StandardCharge] = @original_StandardCharge AND [PenaltyCharge] = @original_PenaltyCharge AND [CopiesOnLoan] = @original_CopiesOnLoan AND [CopiesOnStock] = @original_CopiesOnStock">
									<DeleteParameters>
										<asp:Parameter Name="original_DVDNumber" Type="Int32" />
										<asp:Parameter Name="original_CategoryNumber" Type="Int32" />
										<asp:Parameter Name="original_StudioNumber" Type="Int32" />
										<asp:Parameter Name="original_ProducerNumber" Type="Int32" />
										<asp:Parameter Name="original_DVDTitle" Type="String" />
										<asp:Parameter DbType="Date" Name="original_DateReleased" />
										<asp:Parameter Name="original_StandardCharge" Type="Byte" />
										<asp:Parameter Name="original_PenaltyCharge" Type="Byte" />
										<asp:Parameter Name="original_CopiesOnLoan" Type="Byte" />
										<asp:Parameter Name="original_CopiesOnStock" Type="Byte" />
									</DeleteParameters>
									<InsertParameters>
										<asp:ControlParameter ControlID="categoryDropDown" Name="CategoryNumber" PropertyName="SelectedValue" Type="Int32" />
										<asp:ControlParameter ControlID="studioDropDownList" Name="StudioNumber" PropertyName="SelectedValue" Type="Int32" />
										<asp:ControlParameter ControlID="producerNameDropDown" Name="ProducerNumber" PropertyName="SelectedValue" Type="Int32" />
										<asp:ControlParameter ControlID="dvdNameTxtBox" Name="DVDTitle" PropertyName="Text" Type="String" />
										<asp:ControlParameter ControlID="releaseDateTxtBox" DbType="Date" Name="DateReleased" PropertyName="Text" />
										<asp:ControlParameter ControlID="dvdStrandardChargeTxtBox" Name="StandardCharge" PropertyName="Text" Type="Byte" />
										<asp:ControlParameter ControlID="dvdPenaltyChargeTxtBox" Name="PenaltyCharge" PropertyName="Text" Type="Byte" />
										<asp:Parameter Name="CopiesOnLoan" Type="Byte" DefaultValue="0" />
										<asp:Parameter Name="CopiesOnStock" Type="Byte" DefaultValue="0" />
									</InsertParameters>
									<UpdateParameters>
										<asp:Parameter Name="CategoryNumber" Type="Int32" />
										<asp:Parameter Name="StudioNumber" Type="Int32" />
										<asp:Parameter Name="ProducerNumber" Type="Int32" />
										<asp:Parameter Name="DVDTitle" Type="String" />
										<asp:Parameter DbType="Date" Name="DateReleased" />
										<asp:Parameter Name="StandardCharge" Type="Byte" />
										<asp:Parameter Name="PenaltyCharge" Type="Byte" />
										<asp:Parameter Name="CopiesOnLoan" Type="Byte" />
										<asp:Parameter Name="CopiesOnStock" Type="Byte" />
										<asp:Parameter Name="original_DVDNumber" Type="Int32" />
										<asp:Parameter Name="original_CategoryNumber" Type="Int32" />
										<asp:Parameter Name="original_StudioNumber" Type="Int32" />
										<asp:Parameter Name="original_ProducerNumber" Type="Int32" />
										<asp:Parameter Name="original_DVDTitle" Type="String" />
										<asp:Parameter DbType="Date" Name="original_DateReleased" />
										<asp:Parameter Name="original_StandardCharge" Type="Byte" />
										<asp:Parameter Name="original_PenaltyCharge" Type="Byte" />
										<asp:Parameter Name="original_CopiesOnLoan" Type="Byte" />
										<asp:Parameter Name="original_CopiesOnStock" Type="Byte" />
									</UpdateParameters>
								</asp:SqlDataSource>
                     </div>
                  </div>
               </div>
            </div>
      
         </div>
          <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>DVD Category List</h4>
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
                        <asp:GridView class="table table-striped table-bordered" ID="dvdCategoryGrid" runat="server" DataSourceID="categoryDataSource" AllowPaging="True">
									<Columns>
										<asp:CommandField ShowEditButton="True" />
									</Columns>
								</asp:GridView>
                     	<br />
                     </div>
                  </div>
                   
          <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                    <div class="row">
                     <div class="col">
                        <center>
                           <h4>DVD List</h4>
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
                        <asp:GridView class="table table-striped table-bordered table-responsive" ID="dvdGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="DVDNumber" DataSourceID="dvdDataSource" AllowPaging="True">
									<Columns>
										<asp:CommandField ShowEditButton="True" />
										<asp:BoundField DataField="DVDNumber" HeaderText="DVDNumber" InsertVisible="False" ReadOnly="True" SortExpression="DVDNumber" />
										<asp:BoundField DataField="CategoryNumber" HeaderText="CategoryNumber" SortExpression="CategoryNumber" />
										<asp:BoundField DataField="StudioNumber" HeaderText="StudioNumber" SortExpression="StudioNumber" />
										<asp:BoundField DataField="ProducerNumber" HeaderText="ProducerNumber" SortExpression="ProducerNumber" />
										<asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
										<asp:BoundField DataField="DateReleased" HeaderText="DateReleased" SortExpression="DateReleased" />
										<asp:BoundField DataField="StandardCharge" HeaderText="StandardCharge" SortExpression="StandardCharge" />
										<asp:BoundField DataField="PenaltyCharge" HeaderText="PenaltyCharge" SortExpression="PenaltyCharge" />
										<asp:BoundField DataField="CopiesOnLoan" HeaderText="CopiesOnLoan" SortExpression="CopiesOnLoan" />
										<asp:BoundField DataField="CopiesOnStock" HeaderText="CopiesOnStock" SortExpression="CopiesOnStock" />
									</Columns>
								</asp:GridView>
                     	<br />
								&nbsp;<h3>DVD Copy Creation</h3>
								<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dvdTitlefoCopyDropDownList" Display="Dynamic" ErrorMessage="DVD titile required" ForeColor="Red" ValidationGroup="dvdCopyAddValidationGroup"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
								<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="numericDropDownList" Display="Dynamic" ErrorMessage="No of copies required" ForeColor="Red" ValidationGroup="dvdCopyAddValidationGroup"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;
								<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="purchaseDateTxtBox" Display="Dynamic" ErrorMessage="Date of purchased required" ForeColor="Red" ValidationGroup="dvdCopyAddValidationGroup"></asp:RequiredFieldValidator>
								<br />
                        <label>DVD</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:DropDownList ID="dvdTitlefoCopyDropDownList" runat="server" datasourceid="dvdTitleforCopyDataSource" DataTextField="DVDTitle" DataValueField="DVDNumber" AutoPostBack="True" ValidationGroup="dvdCopyAddValidationGroup">
										</asp:DropDownList>
										&nbsp;&nbsp;&nbsp;
										<asp:DropDownList ID="numericDropDownList" runat="server" ValidationGroup="dvdCopyAddValidationGroup">
											<asp:ListItem>1</asp:ListItem>
											<asp:ListItem>2</asp:ListItem>
											<asp:ListItem>3</asp:ListItem>
											<asp:ListItem>4</asp:ListItem>
											<asp:ListItem>5</asp:ListItem>
											<asp:ListItem>6</asp:ListItem>
											<asp:ListItem>7</asp:ListItem>
											<asp:ListItem>8</asp:ListItem>
											<asp:ListItem>9</asp:ListItem>
										</asp:DropDownList>
										&nbsp;<asp:TextBox CssClass="form-control" ID="purchaseDateTxtBox" runat="server" placeholder="Date" TextMode="Date" ValidationGroup="dvdCopyAddValidationGroup"></asp:TextBox>
										<br />

                           </div>
                        </div>
                     	<asp:SqlDataSource ID="dvdTitleforCopyDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT [DVDNumber], [DVDTitle] FROM [DVDTitle]"></asp:SqlDataSource>
                        <asp:Button ID="dvdCopyPurchaseBtn" class="btn btn-lg btn-block btn-success" runat="server" Text="DVD Copy Purchase" OnClick="dvdCopyPurchaseBtn_Click" ValidationGroup="dvdCopyAddValidationGroup" />
                     	<br />
								<br />
                  <div class="row">
                     <div class="col">
                        <center>
                           <h2>DVD Copy List</h2>
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
                        <asp:GridView class="table table-striped table-bordered" ID="dvdCopiesGridView" runat="server" AutoGenerateColumns="False" DataKeyNames="CopyNumber" DataSourceID="dvdCopiesDataSource" AllowPaging="True">
									<Columns>
										<asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
										<asp:BoundField DataField="CopyNumber" HeaderText="CopyNumber" SortExpression="CopyNumber" InsertVisible="False" ReadOnly="True" />
									</Columns>
								</asp:GridView>
                     	<br />
								<asp:SqlDataSource ID="dvdCopiesDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" DeleteCommand="DELETE FROM [Loan] WHERE [LoanNumber] = @original_LoanNumber AND [LoanTypeNumber] = @original_LoanTypeNumber AND [CopyNumber] = @original_CopyNumber AND [MemberNumber] = @original_MemberNumber AND [DateOut] = @original_DateOut AND [DateDue] = @original_DateDue AND (([DateReturned] = @original_DateReturned) OR ([DateReturned] IS NULL AND @original_DateReturned IS NULL))" InsertCommand="INSERT INTO [Loan] ([LoanTypeNumber], [CopyNumber], [MemberNumber], [DateOut], [DateDue], [DateReturned]) VALUES (@LoanTypeNumber, @CopyNumber, @MemberNumber, @DateOut, @DateDue, @DateReturned)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT DVDTitle.DVDTitle, DVDCopy.CopyNumber FROM DVDTitle INNER JOIN DVDCopy ON DVDTitle.DVDNumber = DVDCopy.DVDNumber" UpdateCommand="UPDATE [Loan] SET [LoanTypeNumber] = @LoanTypeNumber, [CopyNumber] = @CopyNumber, [MemberNumber] = @MemberNumber, [DateOut] = @DateOut, [DateDue] = @DateDue, [DateReturned] = @DateReturned WHERE [LoanNumber] = @original_LoanNumber AND [LoanTypeNumber] = @original_LoanTypeNumber AND [CopyNumber] = @original_CopyNumber AND [MemberNumber] = @original_MemberNumber AND [DateOut] = @original_DateOut AND [DateDue] = @original_DateDue AND (([DateReturned] = @original_DateReturned) OR ([DateReturned] IS NULL AND @original_DateReturned IS NULL))">
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
								<br />
								<h2>DVD365Old</h2><br />
								<asp:GridView class="table table-striped table-bordered" ID="oldDVDsGridview" runat="server" AllowPaging="True" DataSourceID="oldDVDsDataSource">
								</asp:GridView>
								<br />
                        <asp:Button ID="deleteOldCopiesBtn" class="btn btn-lg btn-block btn-success" runat="server" Text="Delete" OnClick="deleteOldCopiesBtn_Click" />
								<asp:SqlDataSource ID="oldDVDsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" DeleteCommand="DELETE FROM DVDCopy WHERE (DATEDIFF(DAY, DatePurchased, GETDATE()) &gt;= 365) AND (CopyNumber NOT IN (SELECT CopyNumber FROM Loan))" SelectCommand="SELECT DVDCopy.CopyNumber, DVDTitle.DVDTitle, DVDCopy.DatePurchased FROM DVDTitle INNER JOIN DVDCopy ON DVDTitle.DVDNumber = DVDCopy.DVDNumber WHERE (DATEDIFF(DAY, DVDCopy.DatePurchased, GETDATE()) &gt;= 365) AND (DVDCopy.CopyNumber NOT IN (SELECT CopyNumber FROM Loan))"></asp:SqlDataSource>
                     </div>
                  </div>
               </div>
            </div>
         </div>


        
      </div>
   </div>
</asp:Content>
