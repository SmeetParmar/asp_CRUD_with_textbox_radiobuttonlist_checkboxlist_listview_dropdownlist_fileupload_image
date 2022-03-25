<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
        }
        .style2
        {
        }
        .style3
        {
            width: 127px;
        }
        .style4
        {
            width: 127px;
            height: 12px;
        }
        .style5
        {
            height: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table align="center" bgcolor="Aqua" style="width:100%;">
        <tr>
            <td align="center" bgcolor="#FFFF66" class="style1" colspan="2">
                <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Italic="True" 
                    Font-Size="XX-Large" ForeColor="Red" Text="Form"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" class="style3">
                Name</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="362px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" class="style3">
                Address</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Height="75px" TextMode="MultiLine" 
                    Width="362px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center" class="style3">
                Xender</td>
            <td align="left">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" 
                    RepeatDirection="Horizontal" Width="162px">
                    <asp:ListItem>Purush</asp:ListItem>
                    <asp:ListItem>Stri</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td align="center" class="style3">
                Hobi</td>
            <td align="left">
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                    RepeatDirection="Horizontal" style="margin-left: 0px" Width="407px">
                    <asp:ListItem>PHP</asp:ListItem>
                    <asp:ListItem>Android</asp:ListItem>
                    <asp:ListItem>ASP</asp:ListItem>
                    <asp:ListItem>Codeignitor</asp:ListItem>
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td align="center" class="style3">
                Food</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="151px">
                    <asp:ListItem>South_Indian</asp:ListItem>
                    <asp:ListItem>Punjabi</asp:ListItem>
                    <asp:ListItem>Chinese</asp:ListItem>
                    <asp:ListItem>Gujrati</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td align="center" class="style3">
                Food_Item</td>
            <td>
                <asp:ListBox ID="ListBox1" runat="server" Width="99px">
                    <asp:ListItem>Pizza</asp:ListItem>
                    <asp:ListItem>Momos</asp:ListItem>
                    <asp:ListItem>Vadapav</asp:ListItem>
                    <asp:ListItem>Manchurian</asp:ListItem>
                </asp:ListBox>
            </td>
        </tr>
        <tr>
            <td align="center" class="style4">
                Foto</td>
            <td class="style5">
                <asp:FileUpload ID="FileUpload1" runat="server" Width="360px" />
                <br />
                <asp:Image ID="Image2" runat="server" Height="100px" Width="100px" />
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="Fuchsia" class="style2" colspan="2">
                <asp:Button ID="Button1" runat="server" BackColor="#66FF33" Font-Bold="True" 
                    Font-Italic="True" Height="35px" Text="Insert" Width="107px" 
                    onclick="Button1_Click" />
            </td>
        </tr>
    </table>
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
            CellPadding="3" GridLines="Vertical" 
             Width="710px">
            <AlternatingRowStyle BackColor="Gainsboro" />
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Literal ID="Literal1" runat="server" Text='<%# Eval("id") %>'></asp:Literal>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <asp:Literal ID="Literal2" runat="server" Text='<%# Eval("name") %>'></asp:Literal>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <asp:Literal ID="Literal3" runat="server" Text='<%# Eval("address") %>'></asp:Literal>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Xender">
                    <ItemTemplate>
                        <asp:Literal ID="Literal4" runat="server" Text='<%# Eval("xender") %>'></asp:Literal>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Hobi">
                    <ItemTemplate>
                        <asp:Literal ID="Literal5" runat="server" Text='<%# Eval("hobi") %>'></asp:Literal>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Food">
                    <ItemTemplate>
                        <asp:Literal ID="Literal6" runat="server" Text='<%# Eval("food") %>'></asp:Literal>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Food_Item">
                    <ItemTemplate>
                        <asp:Literal ID="Literal7" runat="server" Text='<%# Eval("item") %>'></asp:Literal>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Foto">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="100px" Width="100px"
                            ImageUrl='<%# Eval("foto","~/uploads/{0}") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Edit">
                    <ItemTemplate>
                        <asp:Button ID="Button2" runat="server" CommandArgument='<%# Eval("id") %>' 
                            Text="Edit" onclick="Button2_Click" Width="92px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Delete">
                    <ItemTemplate>
                        <asp:Button ID="Button3" runat="server" CommandArgument='<%# Eval("id") %>' 
                            Height="26px" onclick="Button3_Click" Text="Delete" Width="100px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#0000A9" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#000065" />
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
