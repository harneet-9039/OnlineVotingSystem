<%@ Page Language="C#" EnableEventValidation="false" MasterPageFile="~/MasterPage23.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" Title="Untitled Page" %>

<%@ Register Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI" TagPrefix="asp" %>
<%@ Register Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" tagPrefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="Stylesheet" href="~/StyleSheet.css" type="text/css" />
   <style type="text/css">
   .img
        {
            vertical-align:middle;
            background-color:transparent;
            margin-left:40px;
            
        }
   
       .style5
       {
           width: 206px;
       }
   
   </style>
   <script type = "text/javascript" >
       function preventBack() { window.history.forward(); }
       setTimeout("preventBack()", 0);
       window.onunload = function () { null };
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="Registeration_panel" runat="server">

    
    <table class="registration"  style=" margin-left:200px; width:auto; margin-top:150px; height:800px;  text-align:left; padding:20px; border:5px solid #9999FF; border-radius:5px" bgcolor="white" 
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
                &nbsp;<asp:Image ID="Image2" runat="server" CssClass="img"
                    ImageUrl="~/Citizen/iconmonstr-user-11-icon.png" Width="100px" />
                &nbsp; <asp:Label ID="Label8" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; position:absolute; top:50px; font-size: x-large; height:80px; margin-left:10px;" 
                     Text="Voter Registration" Width="40px"></asp:Label>
            </td>
             </tr>
            <tr style="height:100px">
       <td style="width:110px">
        <asp:Label ID="name_lbl" runat="server" Text="Voter Name:"></asp:Label>
       </td>
       <td class="style5">
           <asp:TextBox ID="Name_txt"  CssClass="textbox_radius" style="position:absolute; top:176px" runat="server" 
               EnableViewState="False"></asp:TextBox>
           <asp:RequiredFieldValidator ID="Name_validate" runat="server" ErrorMessage="*" ForeColor="Red" Text="*" ControlToValidate="Name_txt"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="Expressionname_validate" runat="server" ErrorMessage="Characters Only" Text="Characters Only" ForeColor="Red" ControlToValidate="Name_txt"
            ValidationExpression="([A-Za-z])+( [A-Za-z]+)*"></asp:RegularExpressionValidator>
           
       </td>
        </tr>
         <tr style="height:20px">
         <td style="width:130px">
          <asp:Label ID="LabFather_lbl" runat="server" Text="Father's Name:"></asp:Label>
         </td>
          <td class="style5">
           <asp:TextBox ID="Father_txt" CssClass="textbox_radius" style="position:absolute; top:236px"  runat="server" 
                  EnableViewState="False"></asp:TextBox>
                  <asp:RequiredFieldValidator ID="Fname_validate" runat="server" ErrorMessage="*" style="position:absolute; top:236px; left:330px" ForeColor="Red" Text="*" ControlToValidate="Father_txt"></asp:RequiredFieldValidator>
           <asp:RegularExpressionValidator ID="Fnameexpresion_validate" runat="server" ErrorMessage="Characters Only" style="position:absolute; top:236px; left:330px" Text="Characters Only" ForeColor="Red" ControlToValidate="Father_txt"
            ValidationExpression="([A-Za-z])+( [A-Za-z]+)*"></asp:RegularExpressionValidator>
       </td>
       </tr>


        <tr style="height:105px">
         <td>
          <asp:Label ID="Gender" runat="server" Text="Gender:"></asp:Label>
         </td>
          <td class="style5">
              <asp:RadioButton ID="Male_rbtn" Text="Male" runat="server" GroupName="a" />
               <asp:RadioButton ID="Female_rbtn" Text="Female" runat="server" GroupName="a" />
       </td>
       </tr>
     
      <tr style="height:20px">
         <td>
          <asp:Label ID="Dob_lbl" runat="server" Text="Date Of Birth:"></asp:Label>
         </td>
          <td class="style5">
             <asp:TextBox ID="Dob_txt" runat="server"  CssClass="textbox_radius" 
                  ontextchanged="Dob_txt_TextChanged" AutoPostBack="True" 
                  EnableViewState="False" ViewStateMode="Disabled"></asp:TextBox>
          <asp:RequiredFieldValidator ID="Dob_validate" runat="server" ErrorMessage="*" ForeColor="Red" Text="*" ControlToValidate="Dob_txt"></asp:RequiredFieldValidator>

             <asp:ImageButton ID="date_imgbtn" CssClass="img_btn"  runat="server" ImageUrl="~/Images/stock-illustration-79372323-calendar-or-mobile-app-organizer-icon-vector-illustration-flat-design.jpg" 
                />
           <ajax:CalendarExtender ID="Sdate_ajax" FirstDayOfWeek="Monday" Format="MM/dd/yyyy" TargetControlID="Dob_txt" PopupButtonID="date_imgbtn" runat="server" />
       </td>
       <td style="width:50px"></td>
        <td>
          <asp:Label ID="Age_lbl" runat="server" Text="Age:"></asp:Label>
         </td>
          <td class="style5">
             <asp:TextBox ID="Age_txt" CssClass="textbox_radius" runat="server" 
                  EnableViewState="False" ReadOnly="True"></asp:TextBox> 
       </td>
       </tr>
        
         <tr style="height:105px">
         <td>
          <asp:Label ID="Email_lbl" runat="server" Text="E-Mail:"></asp:Label>
         </td>
          <td class="style5">
             <asp:TextBox ID="Email_txt" CssClass="textbox_radius" runat="server" 
                  EnableViewState="False" Width="200px" ViewStateMode="Disabled"></asp:TextBox> 
            
       </td>
       <td style="position:absolute; top:450px">
        <asp:RequiredFieldValidator ID="Email_validate1" runat="server" ErrorMessage="*" ForeColor="Red" Text="*" ControlToValidate="Email_txt"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="Emailregular_validate" runat="server" 
                  ErrorMessage="Wrong Format" Text="Characters Only" ForeColor="Red" ControlToValidate="Email_txt"
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
       </td>
       </tr>

        <tr style="height:30px">
         <td>
          <asp:Label ID="phone_lbl" runat="server" Text="Contact No:"></asp:Label>
         </td>
          <td class="style5">
              <asp:TextBox ID="phone_txt" CssClass="textbox_radius" style="position:absolute; top:500px" runat="server" 
                  EnableViewState="False" ViewStateMode="Disabled"></asp:TextBox> 
                   <asp:RequiredFieldValidator ID="cell_validate" runat="server" ErrorMessage="*" ForeColor="Red" Text="*" ControlToValidate="phone_txt"></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator ID="cellregular_validate" runat="server" 
                  ErrorMessage="Wrong Format" Text="Digits Only" ForeColor="Red" ControlToValidate="phone_txt"
            ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>

       </td>
       </tr>

        <tr style="height:105px">
         <td>
          <asp:Label ID="State_lbl" runat="server" Text="State:"></asp:Label>
         </td>
          
          <td class="style5">
              <asp:DropDownList ID="State_ddl" runat="server" 
                  CssClass="ddl_state_user_register" AutoPostBack="True" Height="22px"
                  onselectedindexchanged="State_ddl_SelectedIndexChanged" 
                 >      
              </asp:DropDownList>

             <asp:RequiredFieldValidator ID="State_validate" runat="server" ErrorMessage="*" ForeColor="Red" InitialValue="-1" Text="*" ControlToValidate="State_ddl"></asp:RequiredFieldValidator>
       </td>
        <td>
           
          <asp:Label ID="District_lbl" runat="server" Text="District:" CssClass="district_label_userregister"></asp:Label>
         </td>
       <td style="width:50px">
        
              <asp:DropDownList ID="District_ddl" runat="server" Height="22px" 
                  CssClass="ddl_district_userregister">
              </asp:DropDownList>
             <asp:RequiredFieldValidator ID="District_validate" runat="server" ErrorMessage="*" ForeColor="Red" InitialValue="-1" Text="*" ControlToValidate="District_ddl"></asp:RequiredFieldValidator>
 
       </td>
       </tr>
       <tr style="height:20px">
        <td style="width:100px">
          <asp:Label ID="Urban_lbl" runat="server" Text="Urban/Rural:"></asp:Label>
         
         </td>
       <td>
               <asp:DropDownList ID="Urban_Rural_ddl" runat="server" Height="22px"  CssClass="textbox_radius"
                  Width="130px" EnableViewState="False">
                <asp:ListItem>Urban</asp:ListItem>
               <asp:ListItem>Rural</asp:ListItem>
              </asp:DropDownList>
       </td>
     
       </tr>
        <tr style="height:105px">
         <td>
          <asp:Label ID="Address_lbl" runat="server" Text="Address:"></asp:Label>
         </td>
          
          <td class="style5">
              <asp:TextBox ID="Address_txt" runat="server" style="position:absolute; top:690px" TextMode="MultiLine" 
                  CssClass="textbox_radius" Width="200px" EnableViewState="False" 
                  ViewStateMode="Disabled"></asp:TextBox>
           <asp:RequiredFieldValidator ID="Address_validate" runat="server" ErrorMessage="*" ForeColor="Red" Text="*" ControlToValidate="Address_txt"></asp:RequiredFieldValidator>

       </td>
      </tr>
      <tr>
      <td>
      
      
          <asp:Button ID="Submit_btn" runat="server" Text="Register" 
              CssClass="register_btn_user" onclick="Submit_btn_Click" /></td>

      </tr>
       
        </table>
        </asp:Panel>
    <asp:Panel ID="Data_register_panel" Visible="false" runat="server">
    
     <table class="registration_voterid"  style=" margin-top:150px; height:550px;  text-align:left; padding:20px; border:5px solid #9999FF; border-radius:5px" bgcolor="white">
      <tr>
             <td colspan="3" >
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
                &nbsp;<asp:Image ID="voterid_img" runat="server" CssClass="img" style="position:absolute; top:36px"
                    ImageUrl="~/Citizen/iconmonstr-user-11-icon.png" Width="100px" />
                &nbsp; <asp:Label ID="Voterid_lbl" runat="server" Font-Bold="True"  CssClass="hit-the-floor" 
                     Style=" vertical-align:middle; position:absolute; right:300px; top:50px; font-size: x-large; height:80px" 
                     Text="Voter Registration" Width="40px"></asp:Label>
            </td>
             </tr>
     
     <tr style="height:auto; position:absolute; top:220px; left:190px">
     <td>
     
         <asp:Label ID="Voterid1_lbl" runat="server" Text="Unique Voter Id:"></asp:Label>
         </td>
         <td>
         <asp:TextBox ID="Voterid_text" runat="server" CssClass="textbox_radius" ReadOnly="true"></asp:TextBox>
         </td>
     </tr>

      
     <tr style="height:auto; position:absolute; top:300px; left:150px">
     <td>
     
         <asp:Label ID="pwd_lbl" runat="server" Text="Enter New Password:"></asp:Label>
         </td>
         <td>
         <asp:TextBox ID="Pwd_txt" runat="server" TextMode="Password" CssClass="textbox_radius"></asp:TextBox>
             <asp:RequiredFieldValidator ID="Pwd_validate" runat="server" ErrorMessage="*" ForeColor="Red" ControlToValidate="Pwd_txt" Text="*"></asp:RequiredFieldValidator>
             
         </td>

     </tr>
     <tr style="height:auto; position:absolute; top:380px; left:190px">
     <td>
     
         <asp:Button ID="Confirm_btn" runat="server" Text="Submit" 
             CssClass="confirm_btn_user" onclick="Confirm_btn_Click"/>
         <asp:HiddenField ID="VoterGuid_hfd" runat="server" />
         </td>
     <td>
         <asp:Label ID="Confirm_lbl" runat="server" Text="* Save your 'Voter Id' and 'Password' for further Login" ForeColor="Red" style=" width:450px; position:absolute; top:10px; left:10px"></asp:Label>
         </td>
     </tr>
     </table>
     <div>
         <asp:HiddenField ID="Id_hfd" runat="server" />
     
     </div>

    </asp:Panel>
    <div>
    
        <asp:Label ID="Confirmation_lbl" Visible="false" runat="server" Font-Bold="True"  CssClass="hit-the-floor" 
                     Style=" vertical-align:middle; position:absolute; right:550px; top:600px; font-size: x-large; height:80px" 
                     Text="Voter Registration" Width="300px"></asp:Label>
    </div>

    <asp:Panel ID="Error_pnl" Visible="false" runat="server">
    
     <table class="registration_voterid"  style=" margin-top:150px; height:550px;  text-align:left; padding:20px; border:5px solid #9999FF; border-radius:5px" bgcolor="white">
      <tr>
             <td colspan="3" >
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
                &nbsp;<asp:Image ID="Image1" runat="server" CssClass="img" style="position:absolute; top:36px"
                    ImageUrl="~/Citizen/iconmonstr-user-11-icon.png" Width="100px" />
                &nbsp; <asp:Label ID="Label1" runat="server" Font-Bold="True"  CssClass="hit-the-floor" 
                     Style=" vertical-align:middle; position:absolute; right:300px; top:50px; font-size: x-large; height:80px" 
                     Text="Voter Registration" Width="40px"></asp:Label>
            </td>
             </tr>
     
     <tr style="height:auto; position:absolute; top:220px; left:190px">
     <td>
     
        <asp:Label ID="Error_lbl" Visible="false" runat="server" Font-Bold="True"  CssClass="hit-the-floor" 
                     Style=" vertical-align:middle; position:absolute; left:50px; top:50px; font-size: x-large; height:80px" 
                    Width="300px"></asp:Label>
         </td>
        </tr>
        </table>
    </asp:Panel>
    </asp:Content>

