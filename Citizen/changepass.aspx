<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage23.master" AutoEventWireup="true" CodeFile="changepass.aspx.cs" Inherits="Account_changepass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" href="../StyleSheet.css" type="text/css" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
    <table class="registration_voterid"  style=" margin-top:150px; height:550px;  text-align:left; padding:20px; border:5px solid #9999FF; border-radius:5px" bgcolor="white" 
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
                &nbsp;<asp:Image ID="Voting_img" runat="server" CssClass="img"
                    ImageUrl="~/Images/login.png" Width="100px" />
                &nbsp; <asp:Label ID="Voting_lbl" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; position:absolute; top:60px; font-size: x-large; height:80px; margin-left:150px;" 
                     Text="Change Password Panel" Width="200px"></asp:Label>
            </td>
             </tr>

              <tr style="height:auto; position:absolute; top:220px; left:190px">
     <td>
     
         <asp:Label ID="Voterpwd_lbl" runat="server" Text="Enter Old Password:"></asp:Label>
         </td>
         <td style="width:20px"></td>
         <td>
         <asp:TextBox ID="Voterpwd_text" runat="server" CssClass="textbox_radius" TextMode="Password"></asp:TextBox>
         </td>
     </tr>

      
     <tr style="height:auto; position:absolute; top:300px; left:190px">
     <td>
     
         <asp:Label ID="Party_lbl" runat="server" Text="Enter New Password:"></asp:Label>
         </td>
          <td style="width:15px"></td>
         <td>
             <asp:TextBox ID="Confirmpass_txt" TextMode="Password" runat="server" CssClass="textbox_radius"></asp:TextBox>
         </td>
     </tr>
     <tr style="height:auto; position:absolute; top:380px; left:190px">
      <td>
     
         <asp:Label ID="pwd_lbl" runat="server" Text="Confirm Password:"></asp:Label>
         </td>
          <td style="width:35px"></td>
         <td>
         <asp:TextBox ID="Pwd_txt" runat="server" TextMode="Password" CssClass="textbox_radius"></asp:TextBox>
         </td>
     </tr>
      <tr style="height:auto; position:absolute; top:380px; left:190px">
     <td>
     
         <asp:Button ID="Vote_btn" runat="server" Text="Change Password" 
             CssClass="vote_btn"/></td>
             </tr>
             </table>
</asp:Content>

