<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="ADGroupCourseWork.profile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	 <div class="container d-flex flex-column align-items-center">
        <div class="row">
            <div class="">

                <div class="card">
                    <div class="card-body">

                        

                        <div class="row">
                            <div class="col">
                                <center>
                                        <asp:Image ID="profileImage" runat="server" Height="220px" Width="220px" ImageUrl="https://ui-avatars.com/api/?rounded=true&background=random" /> 
                                       
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h2>Profile Details</h2>
                                    </center>
                            </div>
                        </div>

                       <asp:Panel ID="adminPannel" runat="server" Visible="False">

                        <div class="d-flex flex-column align-items-center">
                            <div class="col-md-8 pb-2">
                                <label>Username<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="usernameTxtBox" ErrorMessage="Username Required" ForeColor="Red" ValidationGroup="addUserValidationGroup"></asp:RequiredFieldValidator>
										  </label>
                                &nbsp;<div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="usernameTxtBox" runat="server" placeholder="User Name" ValidationGroup="addUserValidationGroup"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-8">
                                Password<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="passwordTxtBox" ErrorMessage="Password Required" ForeColor="Red" ValidationGroup="addUserValidationGroup"></asp:RequiredFieldValidator>
&nbsp;<div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="passwordTxtBox" runat="server" placeholder="**********" ValidationGroup="addUserValidationGroup"></asp:TextBox>

                                	 <asp:CheckBox ID="userTypeCheckBox" runat="server" ForeColor="#FF3300" Text="Admin?" ValidationGroup="changePasswordValidationGroup" />

                                </div>
                            </div>
                       

                        <div class="row col-4">
                                <asp:Button ID="registerBtn" class="btn btn-block btn-success" runat="server" Text="Register" OnClick="registerBtn_Click" ValidationGroup="addUserValidationGroup" />
                        &nbsp;&nbsp;&nbsp;
                        </div> </div>

                          
                <asp:SqlDataSource ID="assistantsDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" DeleteCommand="DELETE FROM [User] WHERE [UserNumber] = @original_UserNumber AND [UserName] = @original_UserName AND [UserType] = @original_UserType AND [UserPassword] = @original_UserPassword" InsertCommand="INSERT INTO [User] ([UserName], [UserType], [UserPassword]) VALUES (@UserName, @UserType, @UserPassword)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [User]" UpdateCommand="UPDATE [User] SET [UserName] = @UserName, [UserType] = @UserType, [UserPassword] = @UserPassword WHERE [UserNumber] = @original_UserNumber AND [UserName] = @original_UserName AND [UserType] = @original_UserType AND [UserPassword] = @original_UserPassword">
						 <DeleteParameters>
							 <asp:Parameter Name="original_UserNumber" Type="Int32" />
							 <asp:Parameter Name="original_UserName" Type="String" />
							 <asp:Parameter Name="original_UserType" Type="Boolean" />
							 <asp:Parameter Name="original_UserPassword" Type="String" />
						 </DeleteParameters>
						 <InsertParameters>
							 <asp:ControlParameter ControlID="usernameTxtBox" DefaultValue="" Name="UserName" PropertyName="Text" Type="String" />
							 <asp:ControlParameter ControlID="userTypeCheckBox" DefaultValue="notadmin" Name="UserType" PropertyName="Checked" Type="Boolean" />
							 <asp:ControlParameter ControlID="passwordTxtBox" Name="UserPassword" PropertyName="Text" Type="String" />
						 </InsertParameters>
						 <UpdateParameters>
							 <asp:Parameter Name="UserName" Type="String" />
							 <asp:Parameter Name="UserType" Type="Boolean" />
							 <asp:Parameter Name="UserPassword" Type="String" />
							 <asp:Parameter Name="original_UserNumber" Type="Int32" />
							 <asp:Parameter Name="original_UserName" Type="String" />
							 <asp:Parameter Name="original_UserType" Type="Boolean" />
							 <asp:Parameter Name="original_UserPassword" Type="String" />
						 </UpdateParameters>
					 </asp:SqlDataSource>
                <br>

                         

                          <div class="col-md-12">

                				 <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AllowPaging="True" DataSourceID="assistantsDataSource">
										 <Columns>
											 <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
										 </Columns>
									  </asp:GridView>


            </div>
                        </asp:Panel>


                       <asp:Panel ID="assistantPannel" runat="server">

                        <div class="d-flex flex-column align-items-center">
                            
										   <div class=" col-md-8 form-group">
                                <label>Old Password<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Old Password Required" ForeColor="Red" ValidationGroup="changePasswordValidationGroup" ControlToValidate="oldPasswordTxtBox"></asp:RequiredFieldValidator>
										  </label>
                                
                                    <asp:TextBox CssClass="form-control" ID="oldPasswordTxtBox" runat="server" placeholder="Old Password" ValidationGroup="changePasswordValidationGroup"></asp:TextBox>

                                </div>
                           

                            <div class="col-md-8 form-group">
                                <label>New Password<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="New Password Required" ForeColor="Red" ControlToValidate="newPasswordTxtBox" ValidationGroup="changePasswordValidationGroup"></asp:RequiredFieldValidator>
										  </label>
                                
                                    <asp:TextBox CssClass="form-control" ID="newPasswordTxtBox" runat="server" placeholder="New Password" ValidationGroup="changePasswordValidationGroup"></asp:TextBox>

                                </div>
                            
                        
                        

                      
                            <div class="col-md-8 form-group">
                                <label>Confirm Password<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" Display="Dynamic" ErrorMessage="Confirm Password Requred" ForeColor="Red" ControlToValidate="confirmPassword" ValidationGroup="changePasswordValidationGroup"></asp:RequiredFieldValidator>
										  <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="newPasswordTxtBox" ControlToValidate="confirmPassword" Display="Dynamic" ErrorMessage="New Password Does Not Match" ForeColor="Red" ValidationGroup="changePasswordValidationGroup"></asp:CompareValidator>
										  </label>
                                <asp:TextBox CssClass="form-control" ID="confirmPassword" runat="server" placeholder="Re-Type New Password" ValidationGroup="changePasswordValidationGroup"></asp:TextBox>
                             </div>

                              
                           
                            <div class="form-group">
                               
                                <asp:Button ID="saveBtn" class="btn btn-success" runat="server" Text="Save" OnClick="saveBtn_Click" ValidationGroup="changePasswordValidationGroup" />
                            </div>

                           </div>
                       </asp:Panel>

                    

                    </div>
                </div>

                
            </div>

            

        </div>
    </div>
</asp:Content>
