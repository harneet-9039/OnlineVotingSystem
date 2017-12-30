<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="EditRemoveCandidate.aspx.cs" Inherits="Admin_EditRemoveCandidate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
<link rel="Stylesheet" href="~/StyleSheet.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div>
 <asp:Button ID="Logout_btn" runat="server" Text="Logout" Font-Bold="true" 
             CssClass="logout_btn" ValidationGroup="xyz"  />
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
                     Text="Candidate List Panel" Width="300px"></asp:Label>
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
            <asp:Button ID="Select_btn" runat="server" Text="Get Candidates" OnClick="Select_btn_Click"   CssClass="vote_btn" Width="130px" ValidationGroup="abc" />
        </td>
     </tr>
     </table>
     </asp:Panel>

     <asp:Panel ID="StateDistrictGrid_pnl" class="registration_voterid" Visible="false" Width="800px"  style=" position:absolute; right:150px; top:300px; height:550px;  text-align:left; padding:20px; border:5px solid #9999FF; border-radius:5px" bgcolor="white"  runat="server">
         <asp:GridView ID="User_grd" runat="server" OnRowEditing="User_grd_RowEditing" OnRowCancelingEdit="User_grd_RowCancelingEdit" OnRowUpdating="User_grd_RowUpdating"
          OnRowDataBound="User_grd_RowDataBound" OnRowDeleting="User_grd_RowDeleting" CssClass="mydatagrid" DataKeyNames="CandidateID" PagerStyle-CssClass="pager" AutoGenerateColumns="False" AllowPaging="True" PageSize="10" 
         Width="802px">
         <RowStyle CssClass="rows" HorizontalAlign="Center"/>
<FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
<PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
<HeaderStyle CssClass="header" />
<AlternatingRowStyle BackColor="White" Width="400px" />
             <Columns>
                <%--<asp:BoundField DataField="ID" ItemStyle-CssClass="Align_Grd" Visible="false" />--%>
                
                 <asp:TemplateField HeaderText="Candidate Name">
                 <ItemTemplate>
                     <asp:Label ID="Name_lbl" style="background-color:transparent" runat="server" Text='<%#Eval("CandidateName") %>'></asp:Label>
                 </ItemTemplate>
                 <EditItemTemplate>
                     <asp:TextBox ID="Name_txt" CssClass="textbox_radius"  Height="15px" Width="130px" runat="server" Text='<%#Eval("CandidateName") %>'></asp:TextBox>
                 </EditItemTemplate>
                 <ItemStyle Width="150px" Height="15" />
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Party Name">
                 <ItemTemplate>
                     <asp:Label ID="Party_lbl" style="background-color:transparent" runat="server" Text='<%#Eval("PartyName") %>'></asp:Label>
                 </ItemTemplate>
                 <EditItemTemplate>
                   <asp:DropDownList ID="Party_ddl" Height="20px" Width="160px" CssClass="textbox_radius" runat="server"></asp:DropDownList>
                 </EditItemTemplate>
                 </asp:TemplateField>
                   <asp:TemplateField HeaderText="State Name">
                 <ItemTemplate>
                     <asp:Label ID="State_lbl" style="background-color:transparent" runat="server" Text='<%#Eval("StateName") %>'></asp:Label>
                 </ItemTemplate>
                 <EditItemTemplate> 
                     <asp:DropDownList ID="Stategrd_ddl" CssClass="textbox_radius" Height="20px" Width="160px" AutoPostBack="true" OnSelectedIndexChanged="Stategrd_ddl_SelectedIndexChanged" runat="server"></asp:DropDownList> 
                 </EditItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="District Name">
                 <ItemTemplate>
                     <asp:Label ID="District_lbl" style="background-color:transparent" runat="server" Text='<%#Eval("DistrictName") %>'></asp:Label>
                     
                 </ItemTemplate>
                 <EditItemTemplate>
                  <asp:DropDownList ID="Districtgrd_ddl" CssClass="textbox_radius" Width="160px" Height="20px" runat="server"></asp:DropDownList>
                 </EditItemTemplate>
                 <ItemStyle Width="150px" Height="15" />
                 </asp:TemplateField>



                 
                <%-- <asp:BoundField DataField="CandidateName" HeaderText="Candidate Name" SortExpression="CandidateName">
                 <ItemStyle Width="50px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="PartyName" HeaderText="Party Name" SortExpression="PartyName">
                 <ItemStyle Width="50px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="StateName" HeaderText="State Name" SortExpression="StateName">
                 <ItemStyle Width="100px" />
                 </asp:BoundField>
                 <asp:BoundField DataField="DistrictName" HeaderText="District Name" SortExpression="DistrictName">
                 <ItemStyle Width="50px" />
                 </asp:BoundField>--%>
                 <asp:TemplateField HeaderText="Edit">
                 <ItemTemplate>
                 <asp:ImageButton ID="Img_btn" style="text-align:center" ImageUrl="~/Images/edit-new-icon-22.png"  Height="20px" Width="20px" CommandName="Edit" runat="server" />
                 
                 </ItemTemplate>
                 <ItemStyle Width="20px" />
                 <EditItemTemplate>
                  <asp:ImageButton ID="ImgUpdate_btn" style="text-align:center" ImageUrl="~/Images/Refresh.png"  Height="20px" Width="20px" CommandName="Update" runat="server" />
                   <asp:ImageButton ID="ImageCancel_btn" style="text-align:center" ImageUrl="~/Images/close-button.png"  Height="20px" Width="20px" CommandName="Cancel" runat="server" />
                 </EditItemTemplate>
                 </asp:TemplateField>
                 <asp:TemplateField HeaderText="Delete">
                   <ItemTemplate>
                  <asp:ImageButton ID="Img1_btn" ImageUrl="~/Images/delete-xxl.png"  Height="20px" Width="20px" CommandName="Delete" runat="server" />
                 </ItemTemplate>
                 <ItemStyle Width="5px" />
                 </asp:TemplateField> 
             </Columns>
         </asp:GridView>
         </asp:Panel>
    <asp:Label ID="Message_lbl" runat="server"></asp:Label>
    <asp:HiddenField ID="Id_hfd" runat="server" />
          

</asp:Content>

