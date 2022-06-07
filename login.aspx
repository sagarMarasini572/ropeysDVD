<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="ADGroupCourseWork.adminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
	 <div class="container">
      <div class="row">
         <div class="col-md-6 mx-auto">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                        </center>
                     </div>
                  </div>
                  <div class="row pt-3">
                     <div class="col">
                        <center>
                           <h1>Welcome</h1>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row ">
                     <div class="col">
                                UserName
								<div class="form-group pb-2">
									<asp:TextBox CssClass="form-control" ID="usernameTxtBox" runat="server" placeholder="User Name"></asp:TextBox><asp:RequiredFieldValidator ID="UserNameRequiredValidator" runat="server" ErrorMessage="User Name is Required" ControlToValidate="usernameTxtBox" ForeColor="Red"></asp:RequiredFieldValidator>
								</div>
								<label>
								Password</label>
								<div class="form-group pb-2">
									<asp:TextBox CssClass="form-control" ID="passwordTxtBox" runat="server" placeholder="***********" TextMode="Password"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="PasswordRequiredValidator" runat="server" ErrorMessage="Password is Required" ControlToValidate="passwordTxtBox" ForeColor="Red"></asp:RequiredFieldValidator>
								</div>
								<div class="form-group ">
									<asp:Button class="btn btn-success btn-block btn-lg" ID="loginBtn" runat="server" Text="Login" OnClick="loginBtn_Click" />
								</div>
                     </div>
                  </div>
               </div>
            </div>
         
				<br>
				<br>
         </div>
      </div>
   </div>
</asp:Content>
