<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Temperaturer.Default" ViewStateMode="Disabled"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Temperaturer</title>
    <link rel="stylesheet" href="css/style.css" />
</head>
<body>
    <h1>Konvertera temperaturer!</h1>
    <form id="form1" runat="server">
    <div>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="red" />
        <%-- Starttemperatur --%>
        <asp:Label ID="StartText" runat="server" Text="Starttemperatur"></asp:Label>
        <asp:CompareValidator ID="CompareValidator1"
            runat="server"
            ErrorMessage="Måste vara mindre än sluttemperatur"
            ControlToValidate="StartInput"
            Operator="LessThan"
            Type="Integer"
            ControlToCompare="EndInput" 
            Display="Dynamic" 
            Text="*" CssClass="red"></asp:CompareValidator>
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
            runat="server" 
            ErrorMessage="Får inte vara tom" 
            ControlToValidate="StartInput" 
            Display="Dynamic" 
            Text="*" CssClass="red"></asp:RequiredFieldValidator>        
        <asp:TextBox ID="StartInput" runat="server" OnTextChanged="StartInput_TextChanged"></asp:TextBox>

        <%-- Sluttemperarur --%>
        <asp:Label ID="EndText" runat="server" Text="Sluttemperatur"></asp:Label>
        <asp:CompareValidator ID="CompareValidator2"
            runat="server"
            ErrorMessage="Måste va större än starttemperatur"
            ControlToCompare="StartInput"
            ControlToValidate="EndInput"
            Operator="GreaterThan"
            Type="Integer" 
            Display="Dynamic" 
            Text="*" CssClass="red"></asp:CompareValidator>
        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2"
            runat="server"
            ErrorMessage="Får inte vara tom"
            ControlToValidate="EndInput" 
            Display="Dynamic" 
            Text="*" CssClass="red"></asp:RequiredFieldValidator>
        <asp:TextBox ID="EndInput" runat="server"></asp:TextBox>

        <asp:Label ID="StepText" runat="server" Text="Temperatursteg"></asp:Label>
        
        <%-- Temperatursteg --%>
        <asp:RangeValidator ID="RangeValidator1"
            runat="server"
            ErrorMessage="Får bara vara mellan 1 och 100"
            ControlToValidate="StepInput"
            MaximumValue="100"
            MinimumValue="1"
            Type="Integer" 
            Display="Dynamic" 
            Text="*" CssClass="red"></asp:RangeValidator>

        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
            runat="server"
            ErrorMessage="Får inte vara tom"
            ControlToValidate="StepInput" 
            Display="Dynamic" 
            Text="*" CssClass="red"></asp:RequiredFieldValidator>
        <asp:TextBox ID="StepInput" runat="server"></asp:TextBox>

        <%-- Konverteringstyp (radiobuttons) --%>
        <asp:Label ID="TypText" runat="server" Text="Konverteringstyp"></asp:Label>
        <asp:RadioButtonList ID="BulletList" runat="server">
            <asp:ListItem Selected="True" Value="CtF">Celsius till Fahrenheit</asp:ListItem>
            <asp:ListItem Value="FtC">Fahrenheit till Celsius</asp:ListItem>
        </asp:RadioButtonList>

        <asp:Button ID="ConvertButton" runat="server" Text="Button" OnClick="ConvertButton_Click" />


        <%-- placeholdern där graderna renderas ut --%>
        <asp:Panel ID="TheBoard" runat="server" Visible="False">
            <asp:Panel ID="FirstBoard" runat="server">
                <asp:Label ID="First" runat="server" Text=""></asp:Label>
                <asp:Label ID="FirstHolder" runat="server" Text=""></asp:Label>
            </asp:Panel>
            <asp:Panel ID="SecondBoard" runat="server">
                <asp:Label ID="Second" runat="server" Text=""></asp:Label>
                <asp:Label ID="SecondHolder" runat="server"></asp:Label>
            </asp:Panel>
        </asp:Panel>

    </div>
    </form>
</body>
</html>
