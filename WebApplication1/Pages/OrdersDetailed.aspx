<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="OrdersDetailed.aspx.cs" Inherits="Bookshop.Pages.OrdersDetailed" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lblTitle" runat="server"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="sdsOrdersDetailed" GridLines="None" Height="172px" Width="562px" ForeColor="#333333">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="book" HeaderText="book" SortExpression="book" />
            <asp:BoundField DataField="amount" HeaderText="amount" ReadOnly="True" SortExpression="amount" />
            <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
            <asp:CheckBoxField DataField="orderShipped" HeaderText="orderShipped" SortExpression="orderShipped" />
            <asp:BoundField DataField="total" HeaderText="total" ReadOnly="True" SortExpression="total" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" ForeColor="White" Font-Bold="True" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <asp:SqlDataSource ID="sdsOrdersDetailed" runat="server" ConnectionString="<%$ ConnectionStrings:BooksDB_CS %>" SelectCommand="spGetOrdersDetailed" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:QueryStringParameter Name="client" QueryStringField="client" Type="String" />
            <asp:QueryStringParameter DbType="Date" Name="date" QueryStringField="date" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:Button ID="btnShip" runat="server" OnClick="btnShip_Click" Text="Ship order" />
    </asp:Content>
