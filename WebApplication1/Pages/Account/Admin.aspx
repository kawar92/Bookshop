<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Bookshop.Pages.Account.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="sdsUsers" runat="server" ConnectionString="<%$ ConnectionStrings:BooksDB_CS %>" DeleteCommand="DELETE FROM [users] WHERE [id] = @id" InsertCommand="IF NOT EXISTS (SELECT [name] from [users] WHERE [name] = @name) BEGIN INSERT INTO [users] ([name], [password], [email], [user_type]) VALUES (@name, @password, @email, @user_type) END" SelectCommand="SELECT * FROM [users]" UpdateCommand="UPDATE [users] SET [name] = @name, [password] = @password, [email] = @email, [user_type] = @user_type WHERE [id] = @id" >
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="user_type" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="name" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="user_type" Type="String" />
            <asp:Parameter Name="id" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="sdsUsers" Width="578px" ForeColor="#333333" GridLines="None" HorizontalAlign="Center">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="password" HeaderText="password" SortExpression="password" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="user_type" HeaderText="user_type" SortExpression="user_type" />
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
    
    <asp:Label runat="server" ID="lblResult" HorizontalAlign="Left" style="margin-left: 200px"></asp:Label>
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="sdsUsers" HorizontalAlign="Left" style="margin-left: 200px" OnItemInserted="FormView1_ItemInserted">
        <EditItemTemplate>
            id:
            <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
            <br />
            name:
            <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' />
            <br />
            password:
            <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
            <br />
            email:
            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
            <br />
            user_type:
            <asp:TextBox ID="user_typeTextBox" runat="server" Text='<%# Bind("user_type") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            <table class="c">
                <tr>
                    <td style="width: 150px">name: </td>
                    <td style="width: 387px">
                        <asp:TextBox ID="nameTextBox" runat="server" Text='<%# Bind("name") %>' Width="250px" />
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ForeColor="red" ControlToValidate="nameTextBox"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">password: </td>
                    <td style="width: 387px">
                        <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' Width="250px" Wrap="False" TextMode="Password" />
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ForeColor="red" ControlToValidate="passwordTextBox"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 120px; height: 25px;">email:</td>
                    <td style="height: 25px; width: 387px">
                        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' Width="250px" Height="22px" />
                        <asp:RequiredFieldValidator runat="server" ErrorMessage="*" ForeColor="red" ControlToValidate="emailTextBox"></asp:RequiredFieldValidator>
                        &nbsp;</td> 
                </tr>
                <tr>
                    <td style="width: 120px">user_type:</td>
                    <td style="width: 387px">
                        <asp:TextBox ID="user_typeTextBox" runat="server" Text='<%# Bind("user_type") %>' Width="250px" />

                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="user_typeTextBox" ErrorMessage="*" ForeColor="red"></asp:RequiredFieldValidator>

                    </td>
                </tr>
            </table>
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" ForeColor="#FF3300" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" ForeColor="#FF3300" Text="Cancel" />
        </InsertItemTemplate>

        <ItemTemplate>
            <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" ForeColor="Red" Text="New" />
        </ItemTemplate>
    </asp:FormView>
</asp:Content>
