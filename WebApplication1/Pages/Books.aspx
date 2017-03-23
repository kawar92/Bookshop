<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="Bookshop.Pages.Books" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        Choose a genre:
        <asp:DropDownList ID="DropDownList1" runat="server"
                          AutoPostBack="True" DataSourceID="sdsGenre"
                          DataTextField="genre" DataValueField="genre" 
                          OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            
           
        </asp:DropDownList>
        <asp:SqlDataSource  ID="sdsGenre" runat="server"
                            ConnectionString="<%$ ConnectionStrings:BooksDB_CS %>"
                            SelectCommand="SELECT DISTINCT [genre] FROM [book] ORDER BY [genre]">
        </asp:SqlDataSource>
    </p>
<p><asp:Label ID="lblOutput" runat="server" Text="Label"></asp:Label></p>
</asp:Content>
