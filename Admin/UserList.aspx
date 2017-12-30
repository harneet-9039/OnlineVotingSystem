<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="UserList.aspx.cs" Inherits="Admin_UserList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link rel="Stylesheet" href="~/StyleSheet.css" type="text/css" />
<style type="text/css">
    .modalBackground
    {
        background-color: Black;
        filter: alpha(opacity=40);
        opacity: 0.4;
    }
    .modalPopup
    {
        background-color: #456f95;
        width: 500px;
        height:460px;
        font-family:Verdana, Arial, Helvetica, sans-serif; 
       box-shadow: 5px 5px 5px #888888;
        border-radius:5px;
        border: 3px solid #9999FF;
    }
    .modalPopup .header
    {
        background-color: #9999FF;
        height: 50px;
        font-family:Verdana, Arial, Helvetica, sans-serif; 
        border-radius:5px;
        color: #9999FF;
        line-height: 30px;
        text-align: center;
        font-weight: bold;
    }
    .modalPopup .body
    {
        min-height: 50px;
        line-height: 30px;
        text-align: center;
        padding:5px
    }
    .modalPopup .footer
    {
        padding: 3px;
    }
    .modalPopup .button
    {
        height: 23px;
        color:#9999FF;
        line-height: 23px;
        text-align: center;
        font-weight: bold;
        cursor: pointer;
        background-color: #9F9F9F;
        border: 1px solid #5C5C5C;
    }
    .modalPopup td
    {
        text-align:center;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div>
 <asp:Button ID="Logout_btn" runat="server" Text="Logout" Font-Bold="true" 
             CssClass="logout_btn" OnClick="Logout_btn_Click" ValidationGroup="xyz"  />
</div>
<asp:Panel ID="StateSelect_pnl" Visible="true" runat="server">
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
                &nbsp;<asp:Image ID="Voting_img" runat="server" CssClass="img" style="position:absolute; left:200px; bottom:420px"
                    ImageUrl="~/Images/users.png" Width="100px" Height="100px" />
                &nbsp; <asp:Label ID="Voting_lbl" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; position:absolute; top:60px; font-size: x-large; height:80px; margin-left:100px;" 
                     Text="User List Panel" Width="300px"></asp:Label>
            </td>
             </tr>
          
          
           <tr style="height:auto; position:absolute; top:200px; left:190px">
     <td>
     
         <asp:Label ID="State_lbl" runat="server" Text="Select State:"></asp:Label>
         </td>
         <td style="width:62px"></td>
         <td>
             <asp:DropDownList ID="State_ddl" runat="server"  CssClass="textbox_radius" AutoPostBack="true" onselectedindexchanged="State_ddl_SelectedIndexChanged"  style="position:absolute; left:142px; top:1px "
                  Width="200px" Height="25px" EnableViewState="true">
             </asp:DropDownList>
             <asp:RequiredFieldValidator ID="Party_validate" ValidationGroup="abc" runat="server" ForeColor="Red" InitialValue="-1" ControlToValidate="State_ddl" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
         </td>
     </tr>
       <tr style="position:absolute; top:300px; left:180px">
        <td>
        <asp:Label ID="sdate_lbl" runat="server" style="margin-right:10px" Text="Select District:"></asp:Label>
        </td>
        
        <td style="position:absolute; left:10px; bottom:8px">
            <asp:DropDownList ID="District_ddl" runat="server"  CssClass="textbox_radius" style="position:absolute; left:142px; top:2px "
                  Width="200px" Height="25px" EnableViewState="true">
             </asp:DropDownList>
             <asp:RequiredFieldValidator ID="District_validate" ValidationGroup="abc" runat="server" ForeColor="Red" style="margin-left:130px" InitialValue="-1" ControlToValidate="District_ddl" ErrorMessage="*" Text="*"></asp:RequiredFieldValidator>
            
        </td>
     </tr>
       <tr style="position:absolute; top:320px; left:30px">
        <td>
            <asp:Button ID="Select_btn" runat="server" Text="Get Voters" OnClick="Select_btn_Click"   CssClass="vote_btn" Width="100px" ValidationGroup="abc" />
        </td>
     </tr>
     </table>
     </asp:Panel>

    <asp:Panel ID="StateDistrictGrid_pnl" class="registration_voterid" Visible="false" Width="800px"  style=" position:absolute; right:150px; top:300px; height:550px;  text-align:left; padding:20px; border:5px solid #9999FF; border-radius:5px" bgcolor="white"  runat="server">
         <asp:GridView ID="User_grd" runat="server"   CssClass="mydatagrid" OnRowEditing="User_grd_RowEditing" OnRowDeleting="User_grd_RowDeleting" DataKeyNames="ID" PagerStyle-CssClass="pager" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" 
         OnSelectedIndexChanged="User_grd_SelectedIndexChanged" Width="802px">
         <RowStyle CssClass="rows" HorizontalAlign="Center"/>
<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
<HeaderStyle CssClass="header" />
<AlternatingRowStyle BackColor="White" Width="400px" />
             <Columns>
                <%--<asp:BoundField DataField="ID" ItemStyle-CssClass="Align_Grd" Visible="false" />--%>
                 <asp:BoundField DataField="VoterID" HeaderText="Voter ID" SortExpression="VoterID">
                 <ItemStyle Width="30px" ForeColor="#456f95" />
                 </asp:BoundField>
                 
                 <asp:BoundField DataField="VoterName" HeaderText="Voter Name" SortExpression="VoterName">
                 <ItemStyle Width="50px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="StateName" HeaderText="State Name" SortExpression="StateName">
                 <ItemStyle Width="100px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="DistrictName" HeaderText="District Name" SortExpression="DistrictName">
                 <ItemStyle Width="50px" />
                 </asp:BoundField>
                 <asp:TemplateField HeaderText="Edit">
                 <ItemTemplate>
                 <asp:ImageButton ID="Img_btn" style="text-align:center" ImageUrl="~/Images/edit-new-icon-22.png"  Height="20px" Width="20px" CommandName="Edit" runat="server" />
                 
                 </ItemTemplate>
                 <ItemStyle Width="20px" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Delete">
                   <ItemTemplate>
                  <asp:ImageButton ID="Img1_btn" ImageUrl="~/Images/delete-xxl.png"  Height="20px" Width="20px" CommandName="Delete" runat="server" />
                 </ItemTemplate>
                 <ItemStyle Width="5px" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="View Full Record">
                   <ItemTemplate>
                  <asp:ImageButton ID="Img2_btn" ImageUrl="~/Images/Person_details.png"  Height="20px" Width="20px" CommandName="Select" runat="server" />
                 </ItemTemplate>
                 <ItemStyle Width="2px" />
                 </asp:TemplateField>
                 
                 
                 <asp:BoundField DataField="fatherName" Visible="false"/>
                 <asp:BoundField DataField="gender" ItemStyle-CssClass="Align_Grd" Visible="false" />
                 <asp:BoundField DataField="DateOfBirth" ItemStyle-CssClass="Align_Grd" Visible="false" />
                 <asp:BoundField DataField="Email" ItemStyle-CssClass="Align_Grd" Visible="false" />
                 <asp:BoundField DataField="contact" ItemStyle-CssClass="Align_Grd" Visible="false" />
             </Columns>
         </asp:GridView>
         </asp:Panel>
              <asp:ImageButton ID="Img_btn" ImageUrl="~/Images/52105-200.png" Height="20px" Width="30px" style="display:none" runat="server" />
             <asp:ModalPopupExtender ID="Show_mpe" runat="server" TargetControlID="Img_btn" X="450" Y="160" PopupControlID="PopUp_Pnl" BackgroundCssClass="modalBackground" CancelControlID="Btn_Cancel"></asp:ModalPopupExtender>
             <asp:Panel ID="PopUp_Pnl" CssClass="modalPopup" runat="server" style = "display:none">
<table align = "center">
<tr style="text-align:center; margin-left:100px">
    <asp:Label ID="Detatils_lbl" runat="server" style="font-family:Verdana, Arial, Helvetica, sans-serif; margin-left:180px; padding-bottom:50px; text-decoration:underline" Font-Bold="true" Text="Voter Full Details"></asp:Label>

</tr>
<tr style="height:20px"></tr>
      <tr style="margin-top:100px">
<td>
<asp:Label ID = "ID_lbl" runat = "server" Text = "Voter ID:" ></asp:Label>
</td>
<td>
<asp:TextBox ID="VoterID_txt" CssClass="textbox_radius" runat="server"></asp:TextBox>   
</td>
</tr>
<tr style="height:15px"></tr>
<tr>
<td>
<asp:Label ID = "VoterName_lbl" runat = "server" Text = "Voter Name:" ></asp:Label>
</td>
<td>
<asp:TextBox ID="VoterName_txt" CssClass="textbox_radius" runat="server"></asp:TextBox>   
</td>
</tr>
<tr style="height:15px"></tr>
<tr style="margin-right:100px">
<td>
<asp:Label ID = "VoterFname_lbl" runat = "server" Text = "Voter's Father Name:" ></asp:Label>
</td>

<td>
<asp:TextBox ID="VoterFname_txt" CssClass="textbox_radius" runat="server"></asp:TextBox>   
</td>
</tr>
<tr style="height:15px"></tr>
    <tr>
<td>
<asp:Label ID = "VoterGender_lbl" runat = "server" Text = "Gender:" ></asp:Label>
</td>
<td>
<asp:TextBox ID="VoterGender_txt" CssClass="textbox_radius" runat="server"></asp:TextBox>   
</td>
</tr>
<tr style="height:15px"></tr>
<tr>
<td>
<asp:Label ID = "DOBpnl_lbl" runat = "server" Text = "Date Of Birth:" ></asp:Label>
</td>
<td >
<asp:TextBox ID="DOBpnl_txt" CssClass="textbox_radius" runat="server"></asp:TextBox>
    
             <asp:ImageButton ID="date_imgbtn" CssClass="img_btn"  runat="server" style="position:absolute;top:207px; left:430px" ImageUrl="~/Images/stock-illustration-79372323-calendar-or-mobile-app-organizer-icon-vector-illustration-flat-design.jpg" 
                />
    <asp:CalendarExtender ID="Dob_cld" FirstDayOfWeek="Monday" Format="MM/dd/yyyy" TargetControlID="DOBpnl_txt"  PopupButtonID="date_imgbtn" runat="server"></asp:CalendarExtender>
</td>
</tr>
<tr style="height:15px"></tr>
    <tr>
<td>
<asp:Label ID = "Emailpnl_lbl" runat = "server" Text = "E-Mail:" ></asp:Label>
</td>
<td>
<asp:TextBox ID="Emailpnl_txt" CssClass="textbox_radius" runat="server"></asp:TextBox>
</td>
</tr>
<tr style="height:15px"></tr>
<tr>
<td>
<asp:Label ID = "Contactpnl_lbl" runat = "server" Text = "Contact:" ></asp:Label>
</td>
<td>
<asp:TextBox ID="Contactpnl_txt" CssClass="textbox_radius" runat="server"></asp:TextBox>
</td>
</tr>
<tr style="height:15px"></tr>
<tr>
<td>
<asp:Button ID="btnSave" CssClass="Start_vote_btn" OnClick="btnSave_Click" style="position:absolute; top:420px; box-shadow:2px 2px 2px #456f91 ; left:250px" Width="70px" runat="server" Text="Save" />
</td>
<td>
<asp:Button ID="Btn_Cancel" CssClass="Start_vote_btn" style="position:absolute; top:420px; box-shadow:2px 2px 2px #456f91; left:350px" Width="70px"   runat="server" Text="Cancel" />
</td>
</tr>
<tr>
    <asp:Label ID="ID" runat="server" Visible="false"></asp:Label>
</tr>
</table>
</asp:Panel>





</asp:Content>

