<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Bookshop.Pages.Account.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table>
        <tr>
            <td>
                
                Login:</td>
            <td>
                <asp:TextBox ID="txtLogin" runat="server" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtLogin" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
          <tr>
            <td>
                
                Password:</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"/>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtPassword" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="#FF3300">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnLogin" runat="server" CssClass="button" Text="Login" OnClick="btnLogin_Click" /><br />
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                <br />
                <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/Pages/Account/Registration.aspx">New user registration</asp:LinkButton>
            </td>
        </tr>
    </table>

</asp:Content>
