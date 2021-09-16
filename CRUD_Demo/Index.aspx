<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CRUD_Demo.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>CRUD Demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    <style type="text/css">
        .auto-style1 {
            width: 133px;
        }
        .auto-style2 {
            width: 229px;
        }
        .auto-style4 {
            width: 74px;
        }
        .auto-style5 {
            width: 105px;
        }
        .auto-style6 {
            margin-left: 0px;
        }
        .auto-style7 {
            width: 100px;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
        <div class="col-9 text-center" style="margin:auto">
            <asp:Label CssClass="h2" Text="Crud Demo" runat="server" /> <br /> <br />
            <asp:Label  ID="Label1" runat="server" Text="This Web page is a demo as an example of CRUD operations using ASP.NET and SQL Server. CRUD Operations are Create, Read, Update and Delete registers from a SQL table."></asp:Label>
        </div>
        <br />
        <br />
        <div style="height: 294px" >
            <table class="w-100">
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label2" runat="server" Text="ID"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox CssClass="input-group-text" ID="txtID" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button ID="btnGet" runat="server" OnClick="btnGet_Click" Text="Get" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">Name</td>
                    <td class="auto-style2">
                        <asp:TextBox CssClass="input-group-text" ID="txtName" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label3" runat="server" Text="Last Name"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox CssClass="input-group-text" ID="txtLastName" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label4" runat="server" Text="Country"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="ddlCountries" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label5" runat="server" Text="Phone"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox CssClass="input-group-text" ID="txtPhone" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">Email</td>
                    <td class="auto-style2">
                        <asp:TextBox CssClass="input-group-text" ID="txtEmail" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                </table>
            <br />
            <table class="w-100">
                <tr>
                    <td class="auto-style4">
                        <asp:Button ID="btnCreate" runat="server" OnClick="btnCreate_Click" Text="Create" />
                    </td>
                    <td class="auto-style4">
                        <asp:Button ID="btnRead" runat="server" OnClick="btnRead_Click" Text="Read" />
                    </td>
                    <td class="auto-style7">
                        <asp:Button ID="btnUpdate" runat="server" OnClick="btnUpdate_Click" Text="Update" />
                    </td>
                    <td class="auto-style5">
                        <asp:Button ID="btnDelete" runat="server" CssClass="auto-style6" OnClientClick="return confirm('Are you sure you want to delete this register?');" OnClick="btnDelete_Click" Text="Delete" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
            <asp:GridView ID="gridData" runat="server" Height="142px" Width="428px">
            </asp:GridView>
        </div>
    </form>
</body>
</html>
