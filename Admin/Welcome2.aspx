<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Welcome2.aspx.cs" Inherits="Admin_Welcome2" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<link rel="Stylesheet" href="../StyleSheet.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
     
       <ajax:ToolkitScriptManager ID="toolkit1" runat="server"></ajax:ToolkitScriptManager>
         <asp:Button ID="Logout_btn" runat="server" Text="Logout" Font-Bold="true" 
             CssClass="logout_btn" onclick="Logout_btn_Click" />
  
  </div>


  <div>
      <asp:Label ID="Welcome_Lbl" CssClass="text" runat="server" Text=" Welcome Admin..!!
     Start Voting Procedure?"></asp:Label>
    

  </div>
  <div class="div_start">
  
      <asp:Button ID="Start_btn" CssClass="Start_btn" runat="server" 
          Text="Start Voting Procedure" onclick="Start_btn_Click" ValidationGroup="xyz" />
  
  </div>

  <div>
      <asp:Panel ID="Startvoting_Panel" CssClass="panel" style="width:800px;" runat="server" Visible="false">
       <table style="margin-left:100px; frame:box">
   <tr>
     <asp:Label ID="Head_lbl"  runat="server"  Text="-----------------Select Choice--------------"></asp:Label>
   </tr>
 
       <tr style="height:100px;">
           <td>
               <asp:Label ID="state_lbl" runat="server" Text="Select State:" Width="170px"></asp:Label>
           </td>
           <td>
               <asp:DropDownList ID="State_ddl" CssClass="textbox_radius" runat="server" AutoPostBack="false"
                   Height="25px" 
                   Width="220px">
               </asp:DropDownList>
               <asp:RequiredFieldValidator ID="State_Validate" runat="server" ValidationGroup="abc" ErrorMessage="*" Text="*" ForeColor="Red" InitialValue="-1" ControlToValidate="State_ddl"></asp:RequiredFieldValidator>
           </td>
           <td style="width:100px">
           </td>
           </tr>
       

       <tr style="height:100px">
       <td>
       <asp:Label ID="Post_lbl" runat="server" Text="Select Post:"></asp:Label>
       </td>
       <td>
               <asp:DropDownList ID="Post_ddl" Height="25px" Width="220px" CssClass="textbox_radius" runat="server">
           </asp:DropDownList>
   <asp:RequiredFieldValidator ID="Post_validate" runat="server" ErrorMessage="*" ValidationGroup="abc" Text="*" ForeColor="Red" InitialValue="-1" ControlToValidate="Post_ddl"></asp:RequiredFieldValidator>

       </td>
     </tr>
        <tr style="height:100px">
        <td>
        <asp:Label ID="sdate_lbl" runat="server" style="margin-right:50px" Text="Select Start Date:"></asp:Label>
        </td>
        
        <td>
            <asp:TextBox ID="Sdate_txt" runat="server" Height="20px" Width="220px"  CssClass="textbox_radius"></asp:TextBox>
            <asp:RequiredFieldValidator ID="Sdate_validate" runat="server" ErrorMessage="*" Text="*" ForeColor="Red" ControlToValidate="Sdate_txt" ValidationGroup="abc"></asp:RequiredFieldValidator>
            
        </td>
         <td>
                <asp:ImageButton ID="Sdate_img" runat="server" CssClass="sdate_imgbtn" style="margin-right:100px"
                ImageUrl="~/Images/stock-illustration-79372323-calendar-or-mobile-app-organizer-icon-vector-illustration-flat-design.jpg" />
                 <ajax:CalendarExtender ID="CalendarExtender1" FirstDayOfWeek="Monday" Format="MM/dd/yyyy" TargetControlID="Sdate_txt" PopupButtonID="sdate_img" runat="server" />
                </td>  
        </tr>
        <tr style="height:100px">
        <td>
        <asp:Label ID="Edate_lbl" runat="server" style="margin-right:55px" Text="Select End Date:"></asp:Label>
        </td>
        
        .<td>
            <asp:TextBox ID="Edate_txt" runat="server" Height="20px" Width="220px"  CssClass="textbox_radius"></asp:TextBox>
                <asp:RequiredFieldValidator ID="Edate_validate" runat="server" ErrorMessage="*" Text="*" ForeColor="Red" ControlToValidate="Edate_txt" ValidationGroup="abc"></asp:RequiredFieldValidator>

        </td>
        <td><asp:ImageButton ID="Edate_imgbtn" runat="server" CssClass="img_btn" style="margin-left:230px; margin-bottom:20px"
                ImageUrl="~/Images/stock-illustration-79372323-calendar-or-mobile-app-organizer-icon-vector-illustration-flat-design.jpg" />
                 <ajax:CalendarExtender ID="Edate_ajax" TargetControlID="Edate_txt" FirstDayOfWeek="Monday" Format="MM/dd/yyyy" PopupButtonID="Edate_imgbtn" runat="server" />
                
                </td>  
        </tr>
        <tr style="height:100px">
            <asp:Button ID="Start_vote_btn" CssClass="Start_vote_btn" ValidationGroup="abc" runat="server" Text="Start Voting" onclick="btnStart_Click" />
        </tr>
        </table>
      </asp:Panel>

  </div>
  

  </asp:Content>

