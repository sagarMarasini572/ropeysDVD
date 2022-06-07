<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="DVDList.aspx.cs" Inherits="ADGroupCourseWork.AllAccess.DVDList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
	<div class="d-flex flex-column align-items-center">
	<div class="col-6">
	<h3>DVD title as per actor last name</h3>
	<asp:DropDownList ID="actorsDropdownList1" runat="server" AutoPostBack="True" DataSourceID="actorsDataSource" DataTextField="ActorSurname" DataValueField="ActorNumber"></asp:DropDownList>
	<asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="DVDStockDataSource" AllowPaging="True">
		<Columns>
			<asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
		</Columns>
</asp:GridView>
	<asp:SqlDataSource ID="DVDStockDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="select DVDTitle from DVDTitle inner join CastMember on DVDTitle.DVDNumber=CastMember.DVDNumber inner join Actor on CastMember.ActorNumber=Actor.ActorNumber where castmember.actornumber=@actor">
		<SelectParameters>
			<asp:ControlParameter ControlID="actorsDropdownList1" Name="actor" PropertyName="SelectedValue" />
		</SelectParameters>
</asp:SqlDataSource>
	<br />
	<h3>DVD copies as per actor last name</h3>
	<asp:DropDownList class="table table-striped table-bordered" ID="actorsDropdownList2" runat="server" AutoPostBack="True" DataSourceID="actorsDataSource" DataTextField="ActorSurname" DataValueField="ActorNumber"></asp:DropDownList>
	<asp:GridView class="table table-striped table-bordered" ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="DVDOnShelveDataSource" AllowPaging="True">
		<Columns>
			<asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
			<asp:BoundField DataField="Copies" HeaderText="Copies" SortExpression="Copies" />
		</Columns>
</asp:GridView>
	<asp:SqlDataSource ID="actorsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT [ActorNumber], [ActorSurname] FROM [Actor]"></asp:SqlDataSource>
	<asp:SqlDataSource ID="DVDOnShelveDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT DVDTitle.DVDTitle, DVDTitle.CopiesOnStock AS Copies FROM DVDTitle INNER JOIN CastMember ON DVDTitle.DVDNumber = CastMember.DVDNumber INNER JOIN Actor ON CastMember.ActorNumber = Actor.ActorNumber WHERE (CastMember.ActorNumber = @actor) AND (DVDTitle.CopiesOnLoan &lt; DVDTitle.CopiesOnStock) AND (DVDTitle.CopiesOnStock &lt;&gt; 0)">
		<SelectParameters>
			<asp:ControlParameter ControlID="actorsDropdownList2" Name="actor" PropertyName="SelectedValue" />
		</SelectParameters>
</asp:SqlDataSource>
	<br />
	<asp:Panel ID="adminPanel" runat="server" Visible="False">
		<h3>DVD details with studio and producer</h3>
	<asp:GridView class="table table-striped table-bordered" ID="dvdDetailsGridview" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dvdDetailsDataSource">
		<Columns>
			<asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
			<asp:BoundField DataField="ProducerName" HeaderText="ProducerName" SortExpression="ProducerName" />
			<asp:BoundField DataField="StudioName" HeaderText="StudioName" SortExpression="StudioName" />
			<asp:BoundField DataField="DateReleased" HeaderText="DateReleased" SortExpression="DateReleased" />
		</Columns>
	</asp:GridView>
	<asp:SqlDataSource ID="dvdDetailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT DVDTitle.DVDTitle, Producer.ProducerName, Studio.StudioName, DVDTitle.DateReleased FROM Studio INNER JOIN DVDTitle ON Studio.StudioNumber = DVDTitle.StudioNumber INNER JOIN Producer ON DVDTitle.ProducerNumber = Producer.ProducerNumber ORDER BY DVDTitle.DateReleased"></asp:SqlDataSource>
	<br />
	<h3>DVD titles which no copy has been loaned in last 31 days</h3>
		<asp:GridView class="table table-striped table-bordered" ID="dvdCopiesNotLoanMonthGridview" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="dvdCopiesNotLoanMonthDataSource">
		<Columns>
			<asp:BoundField DataField="DVDTitle" HeaderText="DVDTitle" SortExpression="DVDTitle" />
		</Columns>
	</asp:GridView>
	<asp:SqlDataSource ID="dvdCopiesNotLoanMonthDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:ADGroupWorkConnectionString %>" SelectCommand="SELECT DVDTitle FROM DVDTitle WHERE (DVDNumber NOT IN (SELECT DVDTitle_1.DVDNumber FROM DVDTitle AS DVDTitle_1 INNER JOIN DVDCopy ON DVDTitle_1.DVDNumber = DVDCopy.DVDNumber INNER JOIN Loan ON DVDCopy.CopyNumber = Loan.CopyNumber WHERE (DATEDIFF(DAY, DVDCopy.DatePurchased, GETDATE()) &gt;= 31)))"></asp:SqlDataSource>
	</asp:Panel>
	</div>
		</div>
	</asp:Content>
