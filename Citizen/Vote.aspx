<%@ Page Language="C#" MasterPageFile="~/MasterPage23.master" AutoEventWireup="true" CodeFile="Vote.aspx.cs" Inherits="Citizen_Vote" Title="Untitled Page" %>

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
     <asp:Button ID="Logout_btn"  style="margin-top:300px" Font-Bold="true" CssClass="logout_btn" runat="server" 
                Text="Logout" onclick="Logout_btn_Click" ValidationGroup="xyz"  />  
    
    </div>

    <asp:Panel ID="CheckUserDistrict_pnl" runat="server">
    
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
                     Text="Voting Panel" Width="200px"></asp:Label>
            </td>
             </tr>
             <tr>
                 <asp:Label ID="msg_lbl" runat="server" Font-Bold="true" Visible="false" CssClass="hit-the-floor"   Style=" vertical-align:middle; position:absolute; right:380px; top:505px; font-size: x-large; height:80px"  Width="500px"  ForeColor="Red"></asp:Label>
             </tr>
             <tr>
             <td>
         <asp:Label ID="Welcome1_lbl" Text="Welcome:" Font-Bold="true" CssClass="hit-the-floor" 
         Style=" vertical-align:middle; position:absolute; right:180px; top:155px; font-size: x-large; height:80px"  Width="300px" runat="server"></asp:Label>
  <asp:Label ID="Welcome_lbl" Visible="true" runat="server" Font-Bold="True"  CssClass="hit-the-floor" 
                     Style=" vertical-align:middle; position:absolute; left:340px; top:155px; font-size: x-large; height:80px" 
                      Width="300px"></asp:Label>
         </td>      
             </tr>
             <tr>
             
             <asp:Label ID="NumberOfVotes" runat="server" Text="You Have Voted" Font-Bold="true" CssClass="hit-the-floor" 
         Style=" vertical-align:middle; position:absolute; right:570px; text-decoration:underline; top:765px; font-size: x-large; height:80px"  Width="300px"></asp:Label>
             <asp:Label ID="Votes_lbl" CssClass="hit-the-floor" 
         Style=" vertical-align:middle; position:absolute; text-decoration:underline; right:290px; top:765px; font-size: x-large; height:80px"  Width="390px" runat="server"></asp:Label>
             </tr>

              <tr style="height:auto; position:absolute; top:240px; left:190px">
      
     
     <td>
     
         <asp:Label ID="Voterid1_lbl" runat="server" Text="Unique Voter Id:"></asp:Label>
         </td>
         <td>
         <asp:TextBox ID="Voterid_text" runat="server" CssClass="textbox_radius" ReadOnly="true"></asp:TextBox>
         </td>
     </tr>

      
     <tr style="height:auto; position:absolute; top:300px; left:190px">
     <td>
         <asp:Label ID="Party_lbl" runat="server" Text="Select Party:"></asp:Label>
         </td>
         <td>
        <asp:DropDownList ID="Party_ddl" runat="server" Height="22px"  CssClass="textbox_radius" style="position:absolute; left:142px; top:2px"
                  Width="170px" EnableViewState="true">
              </asp:DropDownList>
             <asp:RequiredFieldValidator ID="Party_validate" ValidationGroup="abc" runat="server" style="position:absolute; left:320px" ErrorMessage="*" Text="*" InitialValue="-1" ControlToValidate="Party_ddl" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
     </tr>
     <tr style="height:auto; position:absolute; top:360px; left:190px">
      <td>
     
         <asp:Label ID="pwd_lbl" runat="server" Text="Enter Password:"></asp:Label>
         </td>
         <td>
         <asp:TextBox ID="Pwd_txt" runat="server" TextMode="Password" CssClass="textbox_radius"></asp:TextBox>
             <asp:RequiredFieldValidator ID="Pwd_validate" runat="server" ValidationGroup="abc" ErrorMessage="*" Text="*" ControlToValidate="Pwd_txt" ForeColor="Red"></asp:RequiredFieldValidator>

         </td><td></td>
     </tr>
      <tr style="height:auto; position:absolute; top:380px; left:190px">
     <td>
     
         <asp:Button ID="Vote_btn" runat="server" Text="Vote" 
             CssClass="vote_btn" onclick="Vote_btn_Click" ValidationGroup="abc"/></td>
             </tr>
             </table>
             </asp:Panel>
          
</asp:Content>

