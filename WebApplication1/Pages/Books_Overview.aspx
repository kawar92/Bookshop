<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Books_Overview.aspx.cs" Inherits="Bookshop.Pages.Books_Overview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="/Pages/Books_Add.aspx">Add new book</asp:LinkButton>
       <h3>Available books:<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="id" DataSourceID="sdsBooks" ForeColor="#333333" GridLines="None" Width="737px">
           <AlternatingRowStyle BackColor="White" />
           <Columns>
               <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
               <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
               <asp:BoundField DataField="name" HeaderText="name" SortExpression="name">
               <ItemStyle Wrap="True" />
               </asp:BoundField>
               <asp:BoundField DataField="author" HeaderText="author" SortExpression="author" />
               <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
               <asp:BoundField DataField="genre" HeaderText="genre" SortExpression="genre" />
               <asp:BoundField DataField="country" HeaderText="country" SortExpression="country" />
               <asp:TemplateField HeaderText="image" SortExpression="image">
                   <EditItemTemplate>
                       
                       <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("image") %>'></asp:TextBox>
                   </EditItemTemplate>
                   <ItemTemplate>
                       <div style="overflow:auto; height: 100px; max-width: 150px;">
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("image") %>'></asp:Label>
                       </div>
                   </ItemTemplate>
                   <ItemStyle Font-Size="Small" Wrap="True" Width="100px" />
               </asp:TemplateField>
               <asp:TemplateField HeaderText="review" SortExpression="review">
                   <EditItemTemplate>
                       <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("review") %>'></asp:TextBox>
                   </EditItemTemplate>
                   <ItemTemplate><div style="overflow:auto; height: 100px;">
                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("review") %>'></asp:Label>
                       </div>
                   </ItemTemplate>
                   <ItemStyle Font-Size="Small" Wrap="True" />
               </asp:TemplateField>
           </Columns>
           <EditRowStyle BackColor="#7C6F57" />
           <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
           <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
           <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
           <RowStyle BackColor="#E3EAEB" />
           <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
           <SortedAscendingCellStyle BackColor="#F8FAFA" />
           <SortedAscendingHeaderStyle BackColor="#246B61" />
           <SortedDescendingCellStyle BackColor="#D4DFE1" />
           <SortedDescendingHeaderStyle BackColor="#15524A" />
           </asp:GridView>
           <asp:SqlDataSource ID="sdsBooks" runat="server" ConnectionString="<%$ ConnectionStrings:BooksDB_CS %>" DeleteCommand="DELETE FROM [book] WHERE [id] = @id" InsertCommand="INSERT INTO [book] ([name], [author], [price], [genre], [country], [image], [review]) VALUES (@name, @author, @price, @genre, @country, @image, @review)" SelectCommand="SELECT * FROM [book] ORDER BY [id]" UpdateCommand="UPDATE [book] SET [name] = @name, [author] = @author, [price] = @price, [genre] = @genre, [country] = @country, [image] = @image, [review] = @review WHERE [id] = @id">
               <DeleteParameters>
                   <asp:Parameter Name="id" Type="Int32" />
               </DeleteParameters>
               <InsertParameters>
                   <asp:Parameter Name="name" Type="String" />
                   <asp:Parameter Name="author" Type="String" />
                   <asp:Parameter Name="price" Type="Double" />
                   <asp:Parameter Name="genre" Type="String" />
                   <asp:Parameter Name="country" Type="String" />
                   <asp:Parameter Name="image" Type="String" />
                   <asp:Parameter Name="review" Type="String" />
               </InsertParameters>
               <UpdateParameters>
                   <asp:Parameter Name="name" Type="String" />
                   <asp:Parameter Name="author" Type="String" />
                   <asp:Parameter Name="price" Type="Double" />
                   <asp:Parameter Name="genre" Type="String" />
                   <asp:Parameter Name="country" Type="String" />
                   <asp:Parameter Name="image" Type="String" />
                   <asp:Parameter Name="review" Type="String" />
                   <asp:Parameter Name="id" Type="Int32" />
               </UpdateParameters>
           </asp:SqlDataSource>
           <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
</h3>
    </p>
</asp:Content>
