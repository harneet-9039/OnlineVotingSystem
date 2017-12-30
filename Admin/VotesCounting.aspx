<%@ Page Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="VotesCounting.aspx.cs" Inherits="Admin_VotesCounting" Title="Untitled Page" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>
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
<ajax:ToolkitScriptManager ID="toolkit1" runat="server"></ajax:ToolkitScriptManager>
 <asp:Button ID="Logout_btn" runat="server" Text="Logout" Font-Bold="true" 
             CssClass="logout_btn" ValidationGroup="xyz" 
        onclick="Logout_btn_Click" />
</div>
   


      <table class="registration_voterid"  style=" position:absolute; right:230px; top:300px; height:550px;  text-align:left; padding:20px; border:5px solid #9999FF; border-radius:5px" bgcolor="white" 
        >

        <tr>
             <td style="padding-bottom:10px;">
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
                &nbsp;<asp:Image ID="Voting_img" runat="server" CssClass="img" style="position:absolute; left:130px"
                    ImageUrl="~/Images/ballot-box-3.jpg" Width="100px" Height="100px" />
                &nbsp; <asp:Label ID="Voting_lbl" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; position:absolute; top:60px; font-size: x-large; height:80px; margin-left:100px;" 
                     Text="Votes Counting Panel" Width="300px"></asp:Label>
            </td>
             </tr>
          <asp:Panel ID="StateSelect_pnl" Visible="false" runat="server">
          <tr>
          <asp:Label ID="PreseentElectionState_lbl" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; position:absolute; top:480px; font-size: x-large; height:80px; margin-left:250px; text-decoration:underline" 
                     Text="Current Election States" Width="300px"></asp:Label>
 
          </tr>
           <tr style="height:auto; position:absolute; top:260px; left:190px">
     <td>
     
         <asp:Label ID="State_lbl" runat="server" Text="Select State:"></asp:Label>
         </td>
         <td style="width:62px"></td>
         <td>
             <asp:DropDownList ID="State_ddl" runat="server"  CssClass="textbox_radius" style="position:absolute; left:142px; top:1px "
                  Width="200px" Height="25px" EnableViewState="true">
             </asp:DropDownList>
             <asp:RequiredFieldValidator ID="Party_validate" ValidationGroup="abc" runat="server" ForeColor="Red" InitialValue="-1" ControlToValidate="State_ddl" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
         </td>
     </tr>
       <tr style="position:absolute; top:350px; left:130px">
        <td>
        <asp:Label ID="sdate_lbl" runat="server" style="margin-right:50px" Text="Select Election Date:"></asp:Label>
        </td>
        
        <td style="position:absolute; left:200px; bottom:-14px">
            <asp:TextBox ID="Sdate_txt" runat="server" Height="20px" Width="200px"  CssClass="textbox_radius"></asp:TextBox>
            <asp:RequiredFieldValidator ID="Sdate_validate" runat="server" ErrorMessage="*" Text="*" ForeColor="Red" ControlToValidate="Sdate_txt" ValidationGroup="abc"></asp:RequiredFieldValidator>
            
        </td>
         <td>
                <asp:ImageButton ID="Sdate_img" runat="server" CssClass="sdate_imgbtn" style="position:absolute; top:2px; left:410px"
                ImageUrl="~/Images/stock-illustration-79372323-calendar-or-mobile-app-organizer-icon-vector-illustration-flat-design.jpg" />
                 <ajax:CalendarExtender ID="CalendarExtender1" FirstDayOfWeek="Monday" Format="MM/dd/yyyy" TargetControlID="Sdate_txt" PopupButtonID="sdate_img" runat="server" />

                </td>  
        </tr>
        <tr>
        <td>
        
            <asp:Button ID="GetVote_btn" onclick="GetVote_btn_Click" CssClass="Start_vote_btn" style="margin-top:-1px; margin-left:-20px" ValidationGroup="abc" runat="server" Text="Get Votes" /></td>
        </tr>
        
<%--            <asp:Button ID="GetVote_Btn" onclick="GetVote_btn_Click" CssClass="Start_vote_btn" style="margin-top:250px; margin-left:350px" ValidationGroup="abc"  runat="server" Text="Get Vote" /></tr>
--%>      
          </asp:Panel>
      
      
          <asp:Panel ID="DistrictWiseSelect_pnl" Visible="false" runat="server">
          <tr>
          <asp:Label ID="Label1" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; position:absolute; top:480px; font-size: x-large; height:80px; margin-left:250px; text-decoration:underline" 
                     Text="Current Election Districts" Width="300px"></asp:Label>
 
          </tr>
           <tr style="height:auto; position:absolute; top:260px; left:190px">
     <td>
     
         <asp:Label ID="Select_lbl" runat="server" Text="Select District:"></asp:Label>
         </td>
         <td style="width:62px"></td>
         <td>
             <asp:DropDownList ID="DistrictWise_ddl" runat="server"  CssClass="textbox_radius" style="position:absolute; left:142px; top:1px "
                  Width="200px" Height="25px" EnableViewState="true">
             </asp:DropDownList>
             <asp:RequiredFieldValidator ID="DistrictValidate" ValidationGroup="abc" runat="server" ForeColor="Red" InitialValue="-1" ControlToValidate="DistrictWise_ddl" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
         </td>
     </tr>
       <tr style="position:absolute; top:350px; left:130px">
        <td>
        <asp:Label ID="Sdate1_lbl" runat="server" style="margin-right:50px" Text="Select Election Date:"></asp:Label>
        </td>
        
        <td style="position:absolute; left:200px; bottom:-14px">
            <asp:TextBox ID="Sdate1_txt" runat="server" Height="20px" Width="200px"  CssClass="textbox_radius"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*" Text="*" ForeColor="Red" ControlToValidate="Sdate_txt" ValidationGroup="abc"></asp:RequiredFieldValidator>
            
        </td>
         <td>
                <asp:ImageButton ID="ImageButton1" runat="server" CssClass="sdate_imgbtn" style="position:absolute; top:2px; left:410px"
                ImageUrl="~/Images/stock-illustration-79372323-calendar-or-mobile-app-organizer-icon-vector-illustration-flat-design.jpg" />
                 <ajax:CalendarExtender ID="CalendarExtender2" FirstDayOfWeek="Monday" Format="MM/dd/yyyy" TargetControlID="Sdate1_txt" PopupButtonID="ImageButton1" runat="server" />

                </td>  
        </tr>
        <tr>
        <td>
        
            <asp:Button ID="DistrictWise22_btn" onclick="GetDistrictVote_btn_Click" CssClass="Start_vote_btn" style="margin-top:-1px; margin-left:-20px" ValidationGroup="abc" runat="server" Text="Get Votes" /></td>
        </tr>
        
<%--            <asp:Button ID="GetVote_Btn" onclick="GetVote_btn_Click" CssClass="Start_vote_btn" style="margin-top:250px; margin-left:350px" ValidationGroup="abc"  runat="server" Text="Get Vote" /></tr>
--%>      
          </asp:Panel>
      
      
      
      
          <asp:Panel ID="Select_pnl" runat="server">
        

                <tr style="height:auto; position:absolute; top:200px; left:-30px">
     <td>
     
         <asp:Button ID="DistrictWise_btn" runat="server" Text="District Wise Votes Counter" onclick="Districtwise_btn_Click" CssClass="vote_btn" Width="200px" style="position:absolute; right:350px" />
         </td>
          
     </tr>

              <tr style="height:auto; position:absolute; top:120px; left:-30px">
     <td>
     
         <asp:Button ID="StateWise_btn" runat="server" onclick="Statewise_btn_Click" Text="State Wise Votes Counter" CssClass="vote_btn" Width="200px" style="position:absolute; right:350px"/>
         </td>
         </tr>
           
         </asp:Panel>
          <asp:Panel ID="StateWise_pnl" Visible="false"  runat="server">
          <tr>
          <asp:Label ID="StateWise_lbl" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; text-decoration:underline; position:absolute; top:480px; font-size: x-large; height:80px; margin-left:50px;" 
                     Text="Selected State Votes:" Width="300px"></asp:Label>
          </tr>
          <tr>
           <asp:Repeater ID="Electionprocess_rpt" Visible="true" runat="server">
    <HeaderTemplate>
    <table style="position:absolute; top:600px; left:480px; border:1px solid #9999FF; width:500px" cellpadding="0">
    <tr style="background-color:#9999FF; color:#000000; font-size: large; font-weight: bold;">
    <th style="width:100px; height:20px; text-align:center">Party Name</th>
    <th style="width:100px; height:20px; text-align:center">Votes Count</th>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td style="text-align:center; border:1px solid #9999ff">
        <asp:Label ID="State_lbl" runat="server" Text='<%# Eval("PartyName") %>'></asp:Label>
    </td>
    <td  style="text-align:center; border:1px solid #9999ff">
        <asp:Label ID="Post_lbl" runat="server" Text='<%# Eval("Votes") %>'></asp:Label>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
   
    </table>
    </FooterTemplate>
    </asp:Repeater>
  
          </tr>
          
          </asp:Panel>

           <asp:Panel ID="DistrictVotes_pnl" Visible="false"  runat="server">
          <tr>
          <asp:Label ID="DistrictWise1_lbl" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; text-decoration:underline; position:absolute; top:480px; font-size: x-large; height:80px; margin-left:50px;" 
                     Text="Selected District Votes:" Width="300px"></asp:Label>
          </tr>
          <tr>
           <asp:Repeater ID="DistrictWise_rpt" Visible="true" runat="server">
    <HeaderTemplate>
    <table style="position:absolute; top:600px; left:480px; border:1px solid #9999FF; width:500px" cellpadding="0">
    <tr style="background-color:#9999FF; color:#000000; font-size: large; font-weight: bold;">
    <th style="width:100px; height:20px; text-align:center">Party Name</th>
    <th style="width:100px; height:20px; text-align:center">Votes Count</th>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td style="text-align:center; border:1px solid #9999ff">
        <asp:Label ID="State_lbl" runat="server" Text='<%# Eval("PartyName") %>'></asp:Label>
    </td>
    <td  style="text-align:center; border:1px solid #9999ff">
        <asp:Label ID="Post_lbl" runat="server" Text='<%# Eval("Votes") %>'></asp:Label>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
   
    </table>
    </FooterTemplate>
    </asp:Repeater>
  
          </tr>
          
          </asp:Panel>
        </table>
 
   

 </asp:Content>

