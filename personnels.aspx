<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="personnels.aspx.cs" Inherits="ADGroupCourseWork.personnels" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="container">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">

                        
                    
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h2>Producer Details</h2>
                                    </center>
                            </div>
                        </div>


                        <div class="row">
                            <div class="col-md-8 pb-2">
                                <label>Producer Name</label>
                                <div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="producerNameTxtBox" runat="server" placeholder="Producer Name" ValidationGroup="addProducerValidationGroup"></asp:TextBox>
                                </div>
                               <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Producer Name Required" ControlToValidate="producerNameTxtBox" ForeColor="Red" ValidationGroup="addProducerValidationGroup"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="addProducerBtn" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="addProducerBtn_Click" ValidationGroup="addProducerValidationGroup" />
                            </div>
                            <div class="col-4">
                            </div>
                            <div class="col-4">
                            </div>
                        </div>
                    </div>
                </div>
              
                <asp:SqlDataSource ID="producerDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" DeleteCommand="DELETE FROM [Producer] WHERE [ProducerNumber] = @original_ProducerNumber AND [ProducerName] = @original_ProducerName" InsertCommand="INSERT INTO [Producer] ([ProducerName]) VALUES (@ProducerName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT ProducerName FROM Producer" UpdateCommand="UPDATE [Producer] SET [ProducerName] = @ProducerName WHERE [ProducerNumber] = @original_ProducerNumber AND [ProducerName] = @original_ProducerName">
						 <DeleteParameters>
							 <asp:Parameter Name="original_ProducerNumber" Type="Int32" />
							 <asp:Parameter Name="original_ProducerName" Type="String" />
						 </DeleteParameters>
						 <InsertParameters>
							 <asp:ControlParameter ControlID="producerNameTxtBox" Name="ProducerName" PropertyName="Text" Type="String" />
						 </InsertParameters>
						 <UpdateParameters>
							 <asp:Parameter Name="ProducerName" Type="String" />
							 <asp:Parameter Name="original_ProducerNumber" Type="Int32" />
							 <asp:Parameter Name="original_ProducerName" Type="String" />
						 </UpdateParameters>
					 </asp:SqlDataSource>
                <br>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h2>Producer List</h2>
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
                                <asp:GridView class="table table-striped table-bordered" ID="producerGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="producerDataSource">
											  <Columns>
												  <asp:BoundField DataField="ProducerName" HeaderText="ProducerName" SortExpression="ProducerName" />
											  </Columns>
										  </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <div class="container">
        <div class="row">
            <div class="col-md-5">
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
                                        <h2>Studio Details</h2>
                                    </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>
                        <div class="row">
                            
                            <div class="col-md-8 pb-2">
                                <label>Studio Name</label><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="studioNameTxtBox" ErrorMessage="Studio Name Required" ForeColor="Red" ValidationGroup="addStudioValidationGroup"></asp:RequiredFieldValidator>
&nbsp;<div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="studioNameTxtBox" runat="server" placeholder="Studio Name" ValidationGroup="addStudioValidationGroup"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-4">
                                <asp:Button ID="addStudioBtn" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="addStudioBtn_Click" ValidationGroup="addStudioValidationGroup" />
                            </div>
                        </div>
                    </div>
                </div>
      
                <asp:SqlDataSource ID="studioDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" DeleteCommand="DELETE FROM [Studio] WHERE [StudioNumber] = @StudioNumber" InsertCommand="INSERT INTO [Studio] ([StudioName]) VALUES (@studioName)" SelectCommand="SELECT StudioName FROM Studio" UpdateCommand="UPDATE [Studio] SET [StudioName] = @StudioName WHERE [StudioNumber] = @StudioNumber">
						 <DeleteParameters>
							 <asp:Parameter Name="StudioNumber" Type="Int32" />
						 </DeleteParameters>
						 <InsertParameters>
							 <asp:ControlParameter ControlID="studioNameTxtBox" Name="studioName" PropertyName="Text" />
						 </InsertParameters>
						 <UpdateParameters>
							 <asp:Parameter Name="StudioName" Type="String" />
							 <asp:Parameter Name="StudioNumber" Type="Int32" />
						 </UpdateParameters>
					 </asp:SqlDataSource>
                <br>
            </div>
            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                        <h2>Studio List</h2>
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
                                <asp:GridView class="table table-striped table-bordered" ID="studioGrid" runat="server" AutoGenerateColumns="False" DataSourceID="studioDataSource" AllowPaging="True">
											  <Columns>
												  <asp:BoundField DataField="StudioName" HeaderText="StudioName" SortExpression="StudioName" />
											  </Columns>
										  </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
   <div class="container">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h2>Actor Details</h2>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-8 pb-2">
                                <label>Actor First Name</label><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="actorFirstNameTxtBox" ErrorMessage="Actor First name required" ForeColor="Red" ValidationGroup="addActorValidationGroup"></asp:RequiredFieldValidator>
&nbsp;<div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="actorFirstNameTxtBox" runat="server" placeholder="Actor First Name" ValidationGroup="addActorValidationGroup"></asp:TextBox>

                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Actor Last Name<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="actorLastNameTxtBox" ErrorMessage="Actor Last name required" ForeColor="Red" ValidationGroup="addActorValidationGroup"></asp:RequiredFieldValidator>
										  </label>
                                &nbsp;<div class="form-group">
                                    <asp:TextBox CssClass="form-control" ID="actorLastNameTxtBox" runat="server" placeholder="Actor Last Name" ValidationGroup="addActorValidationGroup"></asp:TextBox>

                                </div>
                            </div>
                        </div>

                        <div class="row pt-2">
                            <div class="col-4">
                                <asp:Button ID="addActorBtn" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="addActorBtn_Click" ValidationGroup="addActorValidationGroup" />
                            </div>
                        </div>


                    </div>
                </div>

                <asp:SqlDataSource ID="actorDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" DeleteCommand="DELETE FROM [Actor] WHERE [ActorNumber] = @original_ActorNumber AND [ActorSurname] = @original_ActorSurname AND [ActorFirstName] = @original_ActorFirstName" InsertCommand="INSERT INTO [Actor] ([ActorSurname], [ActorFirstName]) VALUES (@ActorSurname, @ActorFirstName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT ActorFirstName, ActorSurname FROM Actor" UpdateCommand="UPDATE [Actor] SET [ActorSurname] = @ActorSurname, [ActorFirstName] = @ActorFirstName WHERE [ActorNumber] = @original_ActorNumber AND [ActorSurname] = @original_ActorSurname AND [ActorFirstName] = @original_ActorFirstName">
						 <DeleteParameters>
							 <asp:Parameter Name="original_ActorNumber" Type="Int32" />
							 <asp:Parameter Name="original_ActorSurname" Type="String" />
							 <asp:Parameter Name="original_ActorFirstName" Type="String" />
						 </DeleteParameters>
						 <InsertParameters>
							 <asp:ControlParameter ControlID="actorLastNameTxtBox" Name="ActorSurname" PropertyName="Text" Type="String" />
							 <asp:ControlParameter ControlID="actorFirstNameTxtBox" Name="ActorFirstName" PropertyName="Text" Type="String" />
						 </InsertParameters>
						 <UpdateParameters>
							 <asp:Parameter Name="ActorSurname" Type="String" />
							 <asp:Parameter Name="ActorFirstName" Type="String" />
							 <asp:Parameter Name="original_ActorNumber" Type="Int32" />
							 <asp:Parameter Name="original_ActorSurname" Type="String" />
							 <asp:Parameter Name="original_ActorFirstName" Type="String" />
						 </UpdateParameters>
					 </asp:SqlDataSource>
                <br>
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">



                        <div class="row">
                            <div class="col">
                                <center>
                                        <h2>Actor List</h2>
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
                                <asp:GridView class="table table-striped table-bordered" ID="actorGrid" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="actorDataSource">
											  <Columns>
												  <asp:BoundField DataField="ActorFirstName" HeaderText="ActorFirstName" SortExpression="ActorFirstName" />
												  <asp:BoundField DataField="ActorSurname" HeaderText="ActorSurname" SortExpression="ActorSurname" />
											  </Columns>
										  </asp:GridView>
                            </div>
                        </div>


                    </div>
                </div>


            </div>

        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-5">

                <div class="card">
                    <div class="card-body">

                        <div class="row">
                            <div class="col">
                                <center>
                                        <h2>Add Cast Members</h2>
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <center>
                                       
                                    </center>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col">
                                <hr>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-8 pb-2">
                                DVD <div class="form-group">
                                    <asp:DropDownList ID="dvdDropDownList" runat="server" DataSourceID="dvdDataSource" DataTextField="DVDTitle" DataValueField="DVDNumber" ValidationGroup="addCastMemberValidationGroup">
												</asp:DropDownList>
												<br />
												<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="dvdDropDownList" ErrorMessage="DVD Title required to enter cast member" ForeColor="Red" ValidationGroup="addCastMemberValidationGroup"></asp:RequiredFieldValidator>
												<asp:SqlDataSource ID="dvdDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT [DVDNumber], [DVDTitle] FROM [DVDTitle]"></asp:SqlDataSource>

                                </div>
                            </div>

                            <div class="col-md-8">
                                <label>Actor</label>
                                <div class="form-group">
                                    <asp:DropDownList ID="actorDropDownList" runat="server" DataSourceID="actorDataSource1" DataTextField="ActorFirstName" DataValueField="ActorNumber" ValidationGroup="addCastMemberValidationGroup">
												</asp:DropDownList>
												<br />
                						  <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="actorDropDownList" ErrorMessage="Actor required to enter cast member" ForeColor="Red" ValidationGroup="addCastMemberValidationGroup"></asp:RequiredFieldValidator>
                <asp:SqlDataSource ID="actorDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Actor]">
					 </asp:SqlDataSource>

                                </div>
                            </div>
                        </div>

                        <div class="row pt-2">
                            <div class="col-4">
                                <asp:Button ID="addCastMemberBtn" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="addCastMemberBtn_Click" ValidationGroup="addCastMemberValidationGroup" />
                            </div>
                        </div>


                    </div>
                </div>

              
					 <asp:SqlDataSource ID="castMembersDataSource" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" DeleteCommand="DELETE FROM [CastMember] WHERE [DVDNumber] = @original_DVDNumber AND [ActorNumber] = @original_ActorNumber" InsertCommand="INSERT INTO [CastMember] ([DVDNumber], [ActorNumber]) VALUES (@DVDNumber, @ActorNumber)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [CastMember]">
						 <DeleteParameters>
							 <asp:Parameter Name="original_DVDNumber" Type="Int32" />
							 <asp:Parameter Name="original_ActorNumber" Type="Int32" />
						 </DeleteParameters>
						 <InsertParameters>
							 <asp:ControlParameter ControlID="dvdDropDownList" Name="DVDNumber" PropertyName="SelectedValue" Type="Int32" />
							 <asp:ControlParameter ControlID="actorDropDownList" Name="ActorNumber" PropertyName="SelectedValue" Type="Int32" />
						 </InsertParameters>
					 </asp:SqlDataSource>
					 <br>
                <asp:SqlDataSource ID="castMembersShowDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT DVDTitle.DVDTitle, Actor.ActorSurname, Actor.ActorFirstName FROM Actor INNER JOIN CastMember ON Actor.ActorNumber = CastMember.ActorNumber INNER JOIN DVDTitle ON CastMember.DVDNumber = DVDTitle.DVDNumber" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}"></asp:SqlDataSource>
                <br>
            </div>

            <div class="col-md-7">

                <div class="card">
                    <div class="card-body">



                        <div class="row">
                            <div class="col">
                                <center>
                                        <h2>Cast Member List</h2>
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
                                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="castMembersShowDataSource">
											  <Columns>
												  <asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
												  <asp:BoundField DataField="ActorSurname" HeaderText="ActorSurname" SortExpression="ActorSurname" />
												  <asp:BoundField DataField="ActorFirstName" HeaderText="ActorFirstName" SortExpression="ActorFirstName" />
											  </Columns>
										  </asp:GridView>
                            </div>
                        </div>


                    </div>
                </div>


            </div>

        </div>
    </div>
</asp:Content>
