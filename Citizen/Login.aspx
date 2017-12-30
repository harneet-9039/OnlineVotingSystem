<%@ Page Language="C#" MasterPageFile="~/MasterPage23.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Citizen_Login" Title="Untitled Page" %>

<%@ Register Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link rel="Stylesheet" href="../StyleSheet.css" type="text/css" />
    <style type="text/css">
        .style5
        {
            height: 26px;
            width: 99px;
        }
        
        .lbl
        {
            margin-left:50px;
            width:150px;
         
        }
         .img
        {
            vertical-align:middle;
            background-color:transparent;
            margin-left:60px;
            
        }
         .style10
        {
            height: 37px;
        }
        .pwd_lbl
        {
            margin-left:53px;
            width:150px;
            position:absolute;
            top:820px; 
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
    <asp:HiddenField ID="ID_hfd" runat="server" />
<table  style="width: 350px; margin-top:150px; margin-left:350px; text-align:left; padding:20px; border:5px solid #9999FF; margin-bottom: 0px; border-radius:5px" bgcolor="#CCCCFF" 
        frame="box">
        <tr>
             <td colspan="3" style="padding-bottom:10px;">
                &nbsp;
                &nbsp;<asp:Image ID="Image2" runat="server" CssClass="img"
                    ImageUrl="~/Citizen/user_man_lock_password_security-512.png" Width="80px" />
                &nbsp; <asp:Label ID="Label8" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    Style=" width:300px; vertical-align:middle; font-size: x-large; height:60px; margin-left:20px;" Text="Voter Login"></asp:Label>
            </td>
        </tr>
        <tr>

         <td style=" height: 21px; text-align:left">
                <asp:Label ID="Userid_lbl" runat="server" Width="150px"  CssClass="lbl"  Font-Bold="true" 
                    Text="Citizen Voter ID:" BorderColor="#FF0066"></asp:Label>
            </td>
            <td style="height: 21px" colspan="2">
                <asp:TextBox ID="Userid_txt" runat="server"  CssClass="textbox_radius"></asp:TextBox>

            </td>
        </tr>
        <tr>
        
        <td style="width: 100px; height: 21px; margin-right:200px">
                <asp:Label ID="Username_lbl" runat="server" CssClass="lbl" Width="100px"  Font-Bold="true" 
                    Text="Citizen Name:" BorderColor="#FF0066"></asp:Label>
            </td>
            <td colspan="2"> 
                <asp:TextBox ID="UserName_txt" runat="server"  CssClass="textbox_radius"></asp:TextBox>
            </td>
        
        </tr>
        <tr>
            <td>
                <asp:Label ID="Pwd_lbl" runat="server" Font-Bold="true" 
                     CssClass="pwd_lbl" Text="Password:"></asp:Label>
            </td>
            <td colspan="2" >
               <asp:TextBox ID="Txt_pwd" runat="server" 
                    TextMode="Password"  CssClass="textbox_radius"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="validate" 
                    ErrorMessage="*" ControlToValidate="Txt_pwd" ForeColor="Red" ></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
                <asp:Label ID="Error_lbl" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 100px; height: 26px;">
            </td>
            <td style="width: 100px; height: 36px;">
                <asp:Button ID="Signin_btn" runat="server" 
                   Text="Sign In" CssClass="Admin_Login" onclick="Signin_btn_Click"  />
            </td>
            <td class="style5">
               
                
                <asp:Button ID="clear_btn" runat="server" Text="Clear"
                    CssClass="Admin_Login" CausesValidation="False" 
                    onclick="clear_btn_Click1" />
                    
                    
            </td>
        </tr>

    </table>
 
</asp:Content>

