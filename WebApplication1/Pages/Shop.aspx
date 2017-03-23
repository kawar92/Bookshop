<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="Bookshop.Pages.Shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btnOk" CssClass="button" runat="server" Text="OK" Width="100px" OnCommand="CommandButton_Click" CommandName="Ok" Visible="False" />
    <asp:Button ID="btnCancel"  CssClass="button" runat="server" Text="Cancel" Width="100px" OnCommand="CommandButton_Click" CommandName="Cancel" Visible="False" />
    <br />
    <asp:Button ID="btnOrder"  CssClass="button" runat="server" Text="Order" Width="100px" OnCommand="CommandButton_Click" CommandName="Order" />
    <asp:Button ID="btnNewOrder"  CssClass="button"  runat="server" OnCommand="CommandButton_Click" CommandName="NewOrder" Text="New Order" Visible="False" Width="98px" />
    <br />
    <asp:Label ID="lblError" runat="server"></asp:Label>
    <br />
    <asp:Label ID="lblResult" runat="server"></asp:Label>
    <asp:Panel ID="pnlProducts" runat="server">
    </asp:Panel>
</asp:Content>
