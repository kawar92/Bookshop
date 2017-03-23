<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Bookshop.Pages.Account.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <table>
        <tr>
            <td style="width: 275px">Name:</td>
            <td>
                <asp:TextBox ID = "txtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="red" ControlToValidate="txtName" runat="server"></asp:RequiredFieldValidator>
            </td>
        </tr>
           <tr>
            <td style="width: 275px">Password:</td>
            <td>
                <asp:TextBox ID = "txtPassword" TextMode="Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="red" ControlToValidate="txtPassword" runat="server"></asp:RequiredFieldValidator>
            </td>
        </tr>
           <tr>
            <td style="width: 275px">Confirm password:</td>
            <td>
                <asp:TextBox ID = "txtConfirmPassword" TextMode="Password" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="red" ControlToValidate="txtConfirmPassword" runat="server"></asp:RequiredFieldValidator>
            </td>
        </tr>
           <tr>
              <td style="width: 275px">Email:&nbsp;
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Incorrect mail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
               </td>
            <td>
                <asp:TextBox ID = "txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ErrorMessage="*" ForeColor="red" ControlToValidate="txtEmail" runat="server"></asp:RequiredFieldValidator>
            </td>
        </tr>
           <tr>
            <td style="width: 275px">
                <asp:Button ID="btnRegister" Text="Register" runat="server" OnClick="btnRegister_Click"/>
                <asp:CompareValidator  ErrorMessage="Passwords don't match" ControlToValidate="txtPassword" ControlToCompare="txtConfirmPassword" Operator="Equal" Type="String" ForeColor="red" runat="server"></asp:CompareValidator>
                <br />
                <asp:Label ID="lblResult" runat="server"></asp:Label>
            </td>
            
        </tr>
    </table>
</asp:Content>
