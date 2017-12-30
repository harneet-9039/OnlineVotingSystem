<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage23.master" AutoEventWireup="true" CodeFile="officeradminlogin.aspx.cs" Inherits="Admin_officeradminlogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link rel="Stylesheet" href="../StyleSheet.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <style>
    .img
        {
            vertical-align:middle;
            background-color:transparent;
            margin-left:50px;
            position:absolute;
            top:30px;
            

           
        }
    
    </style>
    <table class="registration_voterid"  style="margin-top:150px; height:550px;  text-align:left; padding:20px; border:5px solid #9999FF; border-radius:5px" bgcolor="white" 
        >
        <tr>
             <td colspan="3" style="padding-bottom:10px;">
                &nbsp;
                 &nbsp;
                  &nbsp;
                   &nbsp;
                    &nbsp;
                    &nbsp; &nbsp;
                     &nbsp;
                   &nbsp;
                    &nbsp;
                    &nbsp;
                     &nbsp;
                   &nbsp;
                    &nbsp;
                    &nbsp;
                &nbsp;<asp:Image ID="Voting_img" runat="server" CssClass="img" style="position:absolute; left:160px"
                    ImageUrl="~/Images/login_user_profile_account_logout_people_man_human-512.png" Width="100px" />
                &nbsp; <asp:Label ID="Voting_lbl" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; position:absolute; top:60px; font-size: x-large; height:80px; margin-left:120px;" 
                     Text="Admin Login Panel" Width="300px"></asp:Label>
            </td>
             </tr>
      
     <tr style="height:auto; position:absolute; top:230px; left:190px">
     <td>
     
         <asp:Label ID="User_lbl" runat="server" Text="Enter User Name:"></asp:Label>
         </td>
          <td style="width:15px"></td>
         <td>
             <asp:TextBox ID="User_txt" runat="server" CssClass="textbox_radius"></asp:TextBox>
             <asp:RequiredFieldValidator ID="Admin_validate" runat="server" ErrorMessage="*" Text="*" ControlToValidate="User_txt" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
     </tr>
     <tr style="height:auto; position:absolute; top:310px; left:190px">
      <td>
     
         <asp:Label ID="pwd_lbl" runat="server" Text="Password:"></asp:Label>
         </td>
          <td style="width:75px"></td>
         <td>
         <asp:TextBox ID="Pwd_txt" runat="server" TextMode="Password" CssClass="textbox_radius"></asp:TextBox>
      <asp:RequiredFieldValidator ID="Password_validate" runat="server" ErrorMessage="*" Text="*" ControlToValidate="Pwd_txt" ForeColor="Red"></asp:RequiredFieldValidator>

         </td>
     </tr>
      <tr style="height:auto; position:absolute; top:350px; left:190px">
     <td>
     
         <asp:Button ID="Vote_btn" runat="server" Text="Sign In" 
             CssClass="vote_btn" Width="80px" onclick="Vote_btn_Click" /></td>
             </tr>
             </table>
</asp:Content>

