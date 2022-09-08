<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Registration.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function Registration() {
            var username = $("#untxt").val();
            var password = $("#pstxt").val();
            var department = $("#Ddl option:selected").val();

            $.ajax({
                type: "post",
                url: "Registration.aspx/Register",
                data: JSON.stringify({ name: username, Password: password, specialization: department }),
                dataType: "JSON",
                contentType: "application/json; charset=utf-8",
                success: function () {

                },
                failure: function () {

                }
            });


            window.alert(username + "" + password + "" + department)
            return false
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            username:
            <asp:TextBox ID="untxt" runat="server"></asp:TextBox>
            <br /><br />
            password:
            <asp:TextBox ID="pstxt" runat="server"></asp:TextBox>
            <br /><br />
            Department:
            <asp:DropDownList runat="server" ID="Ddl">
                <asp:ListItem text="--selected--" Value="0" Selected="False"></asp:ListItem>
                <asp:ListItem Text="ortho" Value="1" ></asp:ListItem>
                <asp:ListItem Text="gynic" Value="2"></asp:ListItem>
                <asp:ListItem Text="neuro" Value="3"></asp:ListItem>
            </asp:DropDownList><br /><br />
            <asp:Button Text="Register"  runat="server" OnClientClick="return Registration()" />
        </div>
    </form>
</body>
</html>
