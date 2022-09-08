<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Employee.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function showlogin() {
            var Login = $("#Lgtxt").val();
            var Password = $("#pstxt").val();
            var City = $("#Ddl option:selected").val();
            // var cityname = city.options[city.selectedIndex].text;
            if (Login == "" || Login == undefined || Password == "" || Password == undefined) {
                window.alert("please enter login and password")
                return false;
            }
            

            $.ajax({
                type: "POST",
                url: "Login.aspx/Register",
                data: JSON.stringify({ login: Login, password: Password, city: City }),
                dataType: "Json",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    OnSuccess_login(response);
                },
                failure: function (error) {
                    window.alert(error)
                }
            });

            return false;
        }
        function Deleterow() {
            window.alert("row deleted");
        }
        function OnSuccess_login(response) {
            window.alert(response.d.Errormsg);
        }
        

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            Login:
            <asp:textbox ID="Lgtxt"  runat="server" />
            <br />
            Password:
            <asp:textbox ID="pstxt"  runat="server" />
            <br />
            Dropdownlist:
            <asp:DropDownList ID="Ddl" runat="server">
                <asp:ListItem Text="--selected--" value="0" selecte="true"></asp:ListItem>
                <asp:ListItem Text="nandyala" Value="1" ></asp:ListItem>
                <asp:ListItem Text="kurnool" Value="2"></asp:ListItem>
            </asp:DropDownList><br /><br />
            <asp:button Text="submit" runat="server" onClientClick="return showlogin()"/>
            <asp:Button Text="Delete" runat="server"  Onclientclick="Deleterow()"/>

        </div>
    </form>
</body>
</html>
