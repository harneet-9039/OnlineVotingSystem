<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AddPost.aspx.cs" Inherits="Admin_AddPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link rel="Stylesheet" href="../StyleSheet.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>

 <asp:Button ID="Logout_btn" Font-Bold="true" CssClass="logout_btn" runat="server" 
                Text="Logout" OnClick="Logout_btn_Click"   />  
</div>

    <table class="District_registration"  style=" width:700px; position:absolute; right:200px; top:300px; height:550px;  text-align:left; padding:20px; border:5px solid #9999FF; border-radius:5px" bgcolor="white" 
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
                &nbsp;<asp:Image ID="Voting_img" runat="server" CssClass="img" style="position:absolute; left:240px; top:18px"
                    ImageUrl="~/Images/Commercial.png" Width="100px" />
                &nbsp; <asp:Label ID="Voting_lbl" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; position:absolute; top:60px; font-size: x-large; height:80px; margin-left:200px;" 
                     Text="Add Post" Width="350px"></asp:Label>
            </td>
             </tr>
             <tr style="height:auto; position:absolute; top:270px; left:172px">
      <td>
     
         <asp:Label ID="Post_lbl" style=" font-family:Verdana, Arial, Helvetica, sans-serif; " runat="server" Text="Current Posts:"></asp:Label>
         </td>
          <td style="width:35px"></td>
         <td>
             <asp:DropDownList ID="Post_ddl" Width="200px" CssClass="textbox_radius" Height="25px" runat="server">
             </asp:DropDownList>
             
         </td>
     </tr>

                <tr style="height:auto; position:absolute; top:350px; left:135px">
     <td>
     
         <asp:Label ID="Add_lbl" runat="server" Width="170px" style=" font-family:Verdana, Arial, Helvetica, sans-serif; position:absolute; left:20px " Text="Enter Post Name:"></asp:Label>
         </td>
          <td style="width:15px"></td>
         <td style="height:auto; position:absolute; top:0px; left:195px" >
             <asp:TextBox ID="Post_txt" Height="20px" Width="200px" runat="server" CssClass="textbox_radius"></asp:TextBox>
             <asp:RequiredFieldValidator ID="Name_validate" ValidationGroup="abcd" runat="server" ErrorMessage="*" ForeColor="Red" Text="*" ControlToValidate="Post_txt"></asp:RequiredFieldValidator>
         </td>
     </tr>
  
     
      <tr style="height:auto; position:absolute; top:380px; left:190px">
     <td>
     
     
         <asp:Button ID="Confirm_btn" runat="server" Text="Confirm" ValidationGroup="abcd"
             CssClass="vote_btn" Width="80px" OnClick="Confirm_btn_Click" /></td>
             </tr>
             </table>

</asp:Content>

