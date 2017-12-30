<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ElectionProcess.aspx.cs" Inherits="Admin_ElectionProcess" %>

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
 <%-- <table class="Election_Process"  style=" position:absolute; right:150px; top:300px; height:550px; width:800px;  text-align:left; padding:20px; border:5px solid #9999FF; border-radius:5px" bgcolor="white" 
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
                &nbsp;<asp:Image ID="Voting_img" runat="server" CssClass="img" style="position:absolute; left:210px"
                    ImageUrl="~/Images/login_user_profile_account_logout_people_man_human-512.png" Width="100px" />
                &nbsp; <asp:Label ID="Voting_lbl" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; position:absolute; top:60px; font-size: x-large; height:80px; margin-left:210px;" 
                     Text="Election In Process" Width="300px"></asp:Label>
            </td>
             </tr>
             </table>--%>
<div class="Election_Process"  style=" position:absolute; right:290px; top:300px; height:550px; width:600px;  text-align:left; padding:20px; border:5px solid #9999FF; border-radius:5px" bgcolor="white" 
        >
    <div>
    <asp:Image ID="Voting_img" runat="server" CssClass="img" style="position:absolute; left:120px"
                    ImageUrl="~/Images/52105-200.png" Width="100px" />
                &nbsp; <asp:Label ID="Voting_lbl" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; position:absolute; top:60px; font-size: x-large; height:80px; margin-left:250px;" 
                     Text="Election In Process" Width="300px"></asp:Label>
    </div>
    <asp:Repeater ID="Electionprocess_rpt" Visible="true" runat="server">
    <HeaderTemplate>
    <table style="position:absolute; top:200px; left:60px; border:1px solid #9999FF; width:500px" cellpadding="0">
    <tr style="background-color:#9999FF; color:#000000; font-size: large; font-weight: bold;">
    <th style="width:100px; height:20px; text-align:center">State Name</th>
    <th style="width:100px; height:20px; text-align:center">Post Name</th>
    <th style="width:100px ; height:20px; text-align:center">Start Date</th>
    <th style="width:100px ; height:20px; text-align:center">End Date</th>
    <th style="width:100px ; height:20px; text-align:center">Status</th>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td style="text-align:center; border:1px solid #9999ff">
        <asp:Label ID="State_lbl" runat="server" Text='<%# Eval("StateName") %>'></asp:Label>
    </td>
    <td  style="text-align:center; border:1px solid #9999ff">
        <asp:Label ID="Post_lbl" runat="server" Text='<%# Eval("PostName") %>'></asp:Label>
    </td>
    <td  style="text-align:center; border:1px solid #9999ff">
        <asp:Label ID="Startdate_lbl" runat="server" Text='<%# Eval("ElectionStartDate") %>'></asp:Label>
    </td>
    <td  style=" text-align:center; border:1px solid #9999ff">
        <asp:Label ID="Enddate_lbl" runat="server" Text='<%# Eval("ElectionEndDate") %>'></asp:Label>
    </td>
    <td  style="text-align:center; border:1px solid #9999ff">

        <asp:Label ID="Status_lbl" ForeColor="ForestGreen" runat="server" Font-Bold="true" Text='<%# CheckStatus(Eval("ElectionEndDate").ToString(), Eval("ElectionStartDate").ToString()) %>'></asp:Label>
    </td>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
   
    </table>
    </FooterTemplate>
    </asp:Repeater>
  
      </div>           
                 
   

                 
                 
</asp:Content>

