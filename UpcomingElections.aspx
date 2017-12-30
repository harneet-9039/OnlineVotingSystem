<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage23.master" AutoEventWireup="true" CodeFile="UpcomingElections.aspx.cs" Inherits="UpcomingElections" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <style type="text/css">
    .img
        {
            vertical-align:middle;
            background-color:transparent;
            margin-left:50px;
            position:absolute;
            top:30px;
            font-size:60px;
            
        }
    
    </style>
    <link rel="Stylesheet" href="StyleSheet.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="Election_Process"  style=" position:absolute; right:200px; top:600px; height:750px; width:900px;  text-align:left; padding:20px; border:5px solid #9999FF; border-radius:5px" bgcolor="white" 
        >
    <div>
    <asp:Image ID="Voting_img" runat="server" CssClass="img" style="position:absolute; left:120px"
                    ImageUrl="~/Images/52105-200 (1).png" Width="100px" />
                &nbsp; <asp:Label ID="Voting_lbl" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; position:absolute; top:60px; font-size: 60px; height:80px; margin-left:250px;" 
                     Text="Upcoming Elections" Width="600px"></asp:Label>
    </div>

              <asp:Repeater ID="Electionprocess_rpt" runat="server">
    <HeaderTemplate>
    <table class="textbox_radius" style="position:absolute; top:200px; left:80px; border:3px solid #9999FF; width:800px" cellpadding="0" cellspacing="10px">
    <tr style="background-color:#9999FF;font-family:Verdana, Arial, Helvetica, sans-serif;  color:#000000; font-size: large; font-weight: bold;">
    <th style="width:100px;font-family:Verdana, Arial, Helvetica, sans-serif;  height:20px; text-align:center">Post Name</th>
    <th style="width:100px;font-family:Verdana, Arial, Helvetica, sans-serif;  height:20px; text-align:center">State Name</th>
    <th style="width:150px ; font-family:Verdana, Arial, Helvetica, sans-serif;  height:20px; text-align:center">Election Start Date</th>
    <th style="width:150px ; font-family:Verdana, Arial, Helvetica, sans-serif;  height:20px; text-align:center">Election End Date</th>
    </tr>
    </HeaderTemplate>
    <ItemTemplate>
    <tr>
    <td class="textbox_radius" style="text-align:center; border:3px solid #9999ff">
        <asp:Label ID="State_lbl" runat="server" Text='<%# Eval("PostName") %>'></asp:Label>
    </td>
    <td class="textbox_radius" style="text-align:center; border:3px solid #9999ff">
        <asp:Label ID="Post_lbl" runat="server" Text='<%# Eval("StateName") %>'></asp:Label>
    </td>
    <td class="textbox_radius" style="text-align:center; border:3px solid #9999ff">
        <asp:Label ID="Startdate_lbl" runat="server" Text='<%# Eval("ElectionStartDate") %>'></asp:Label>
    </td>
    <td class="textbox_radius" style=" text-align:center; border:3px solid #9999ff">
        <asp:Label ID="Enddate_lbl" runat="server" Text='<%# Eval("ElectionEndDate") %>'></asp:Label>
    </td>
    </tr>
    </ItemTemplate>
    <FooterTemplate>
   
    </table>
    </FooterTemplate>
    </asp:Repeater>
    </div>
  
       
   
</asp:Content>

