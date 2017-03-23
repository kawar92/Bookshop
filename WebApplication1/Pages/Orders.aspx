<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="Bookshop.Pages.Account.Orders" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
        
        
  
    <ajaxToolkit:TabContainer ID="TabContainer1" CssClass="tabstyle" runat="server" ActiveTabIndex="0" Width="666px" ForeColor="Black">
        <ajaxToolkit:TabPanel runat="server" HeaderText="TabPanel1" ID="TabPanel1">
            <HeaderTemplate>
                Open orders
            </HeaderTemplate>
            <ContentTemplate>
                Show orders between
                <asp:TextBox ID="txtOpenOrder1" runat="server" AutoPostBack="True"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtOpenOrder1_CalendarExtender" runat="server" TargetControlID="txtOpenOrder1" BehaviorID="_content_txtOpenOrder1_CalendarExtender" />
                &nbsp;and
                <asp:TextBox ID="txtOpenOrder2" runat="server" AutoPostBack="True"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtOpenOrder2_CalendarExtender" runat="server" TargetControlID="txtOpenOrder2" BehaviorID="_content_txtOpenOrder2_CalendarExtender" />
                <br />
                <asp:Label ID="lblOpenOrders" runat="server" ForeColor="Black"></asp:Label>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
        <ajaxToolkit:TabPanel ID="TabPanel2" runat="server" HeaderText="TabPanel2">
            <HeaderTemplate>
                Closed orders
            </HeaderTemplate>
            <ContentTemplate>
                Show orders between
                <asp:TextBox ID="txtClosedOrders1" runat="server" AutoPostBack="True"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtClosedOrders1_CalendarExtender" runat="server" BehaviorID="_content_txtOpenOrder1_CalendarExtender" TargetControlID="txtClosedOrders1" />
                &nbsp;and
                <asp:TextBox ID="txtClosedOrders2" runat="server" AutoPostBack="True"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="txtClosedOrders2_CalendarExtender" runat="server" BehaviorID="_content_txtOpenOrder2_CalendarExtender" TargetControlID="txtClosedOrders2" />
                <br />
                <asp:Label ID="lblClosedOrders" runat="server" ForeColor="Black"></asp:Label>
            </ContentTemplate>
        </ajaxToolkit:TabPanel>
</ajaxToolkit:TabContainer>
    <br />
           
</asp:Content>
