<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Books_Add.aspx.cs" Inherits="Bookshop.Pages.Book_Add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table cellspacing="15" class="bookTable">

        <tr>
            <td style="width: 80px; height: 39px;">

                Name:</td>
            <td style="height: 39px; width: 332px;">

                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>

            </td>
        </tr>
        
        <tr>
            <td style="width: 80px">

                Author:</td>
            <td style="width: 332px">

                <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtAuthor" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>

            </td>
        </tr>
        
        <tr>
            <td style="width: 80px">

                Price:</td>
            <td style="width: 332px">

                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPrice" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>

            </td>
        </tr>
        
        <tr>
            <td style="width: 80px">

                Genre:</td>
            <td style="width: 332px">

                <asp:TextBox ID="txtGenre" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtGenre" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>

            </td>
        </tr>
        
        <tr>
            <td style="width: 80px; height: 43px;">

                Country:</td>
            <td style="width: 332px; height: 43px;">

                <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtCountry" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>

            </td>
        </tr>
        
        <tr>
            <td style="width: 80px; height: 63px;">

                Image:</td>
            <td style="height: 63px; width: 332px; text-align: left">

                <asp:DropDownList ID="ddlImage" runat="server" Height="16px" Width="119px">
                </asp:DropDownList>
                <br />
                <asp:FileUpload ID="FileUpload1" runat="server" Width="328px" onchange="fileinfo()" style="display: none" />
                <asp:TextBox ID="txtBrowse" runat="server"></asp:TextBox>
                <asp:LinkButton ID="lbtBrowse" CssClass="button" runat="server" >Browse</asp:LinkButton>
                <br />
                <script type="text/javascript" >
                    function fileinfo() {
                        document.getElementById('<%=txtBrowse.ClientID%>').value = document
                            .getElementById('<%=FileUpload1.ClientID%>').value;
                    }
                </script>

                <asp:Button ID="btnUploadImage" runat="server" Text="Upload Image" CausesValidation="False" OnClick="btnUploadImage_Click" CssClass="button" />


            </td>
        </tr>
        
        <tr>
            <td style="width: 80px">

                Review:</td>
            <td style="width: 332px">

                <asp:TextBox ID="txtReview" runat="server" TextMode="MultiLine"></asp:TextBox>

                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtReview" ErrorMessage="*" ForeColor="#FF3300"></asp:RequiredFieldValidator>

            </td>
        </tr>
    </table>

    <asp:Label ID="lblResult" runat="server" Text=""></asp:Label>
    <br />
    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="button" Width="79px" />

</asp:Content>
