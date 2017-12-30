<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="OficerRegistration.aspx.cs" Inherits="Admin_OficerRegistration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" href="../StyleSheet.css" type="text/css" />
        <style type="text/css">
    .img
        {
            vertical-align:middle;
            background-color:transparent;
            margin-left:50px;
            position:absolute;
            top:30px;
            
        }
    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
 <asp:Button ID="Logout_btn" runat="server" Text="Logout" Font-Bold="true" 
             CssClass="logout_btn" onclick="Logout_btn_Click" ValidationGroup="abc" />
</div>
    <table class="registration_voterid"  style=" position:absolute; right:230px; top:300px; height:550px;  text-align:left; padding:20px; border:5px solid #9999FF; border-radius:5px" bgcolor="white" 
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
                     Text="Officer Registration Panel" Width="300px"></asp:Label>
            </td>
             </tr>
          

                <tr style="height:auto; position:absolute; top:300px; left:135px">
     <td>
     
         <asp:Label ID="User_lbl" runat="server" Text="Enter Officer Name:"></asp:Label>
         </td>
          <td style="width:15px"></td>
         <td style="height:auto; position:absolute; top:0px; left:200px" >
             <asp:TextBox ID="User_txt" Height="20px" Width="200px" runat="server" CssClass="textbox_radius"></asp:TextBox>
             <asp:RequiredFieldValidator ID="Name_validate" ValidationGroup="abcd" runat="server" ErrorMessage="*" ForeColor="Red" Text="*" ControlToValidate="User_txt"></asp:RequiredFieldValidator>
         </td>
     </tr>

              <tr style="height:auto; position:absolute; top:220px; left:190px">
     <td>
     
         <asp:Label ID="Party_lbl" runat="server" Text="Select Party:"></asp:Label>
         </td>
         <td style="width:62px"></td>
         <td>
             <asp:DropDownList ID="Party_ddl" runat="server"  CssClass="textbox_radius" style="position:absolute; left:142px; top:1px "
                  Width="200px" Height="25px" EnableViewState="true">
             </asp:DropDownList>
             <asp:RequiredFieldValidator ID="Party_validate" ValidationGroup="abcd" runat="server" ForeColor="Red" InitialValue="-1" ControlToValidate="Party_ddl" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
         </td>
     </tr>
  
     <tr style="height:auto; position:absolute; top:380px; left:172px">
      <td>
     
         <asp:Label ID="District_lbl" runat="server" Text="Select District:"></asp:Label>
         </td>
          <td style="width:35px"></td>
         <td>
             <asp:DropDownList ID="District_ddl" Width="200px" CssClass="textbox_radius" Height="25px" runat="server">
             </asp:DropDownList>
             <asp:RequiredFieldValidator ID="District_validate" ValidationGroup="abcd" runat="server" ErrorMessage="*" Text="*" ForeColor="Red" ControlToValidate="District_ddl" InitialValue="-1"></asp:RequiredFieldValidator>
         </td>
     </tr>
     <tr>
     <td>
     
         <asp:Label ID="Confirm_lbl" Visible="true" runat="server" Font-Bold="True"  CssClass="hit-the-floor" 
                     Style=" vertical-align:middle; position:absolute; left:100px; top:-80px; font-size: x-large; height:80px" 
                    Width="800px"></asp:Label></td>
     </tr>
      <tr style="height:auto; position:absolute; top:380px; left:190px">
     <td>
     
     
         <asp:Button ID="Confirm_btn" runat="server" Text="Confirm" ValidationGroup="abcd"
             CssClass="vote_btn" Width="80px" onclick="Confirm_btn_Click"/></td>
             </tr>
             </table>
</asp:Content>

