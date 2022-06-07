<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="ADGroupCourseWork.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--Adds Banner Starts Here--%>
    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
      <ol class="carousel-indicators">
        <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></li>
        <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
        <li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
      </ol>
      <div class="carousel-inner">
        <div class="carousel-item active">
            <asp:Image class="d-block w-100 " ID="dvdImage1" runat="server" Height="500px" ImageUrl="../images/kgf2banner.jpg" alt="First slide" />
        </div>
        <div class="carousel-item">
          <asp:Image class="d-block w-100 " ID="dvdImage2" runat="server" Height="500px" ImageUrl="../images/rrrBanner.jpg" alt="Second slide" />
        </div>
        <div class="carousel-item">
          <asp:Image class="d-block w-100 " ID="dvdImage3" runat="server" Height="500px" ImageUrl="../images/pushpaBanner.jpg" alt="Third slide" />
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    
    <%--Add Banner Ends Here--%>
   
</asp:Content>
