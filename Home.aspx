<%@ Page Language="C#" MasterPageFile="~/MasterPage23.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link rel="Stylesheet" href="../StyleSheet.css" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div>
    <asp:Image ID="Voting_img" runat="server" CssClass="img" style="position:absolute; left:380px"
                    ImageUrl="~/Images/52105-200 (1).png" Width="100px" />
                &nbsp; <asp:Label ID="Voting_lbl" runat="server" Font-Bold="True"  CssClass="hit-the-floor"
                    
                     Style=" vertical-align:middle; position:absolute; top:530px; font-size: 60px; height:80px; margin-left:350px;" 
                     Text="Current Elections" Width="600px"></asp:Label>
    </div>
    <br /><br /><br /><br /><br /><br />
    
    <div style="position:absolute; left:135px">
    
        <asp:DataList ID="CurrentElectionDataList" ItemStyle="float:left" RepeatDirection="Horizontal" RepeatColumns="4" CellPadding="15" DataKeyField="ElectionID" runat="server" EnableViewState="False" BackColor="Transparent" BorderColor="Transparent" BorderStyle="Solid" BorderWidth="1px"  CellSpacing="20" GridLines="Horizontal">
           
            <ItemStyle BackColor="Transparent" ForeColor="#000000" font-name="	Cursive"
               font-size="11" />
        <ItemTemplate>
        <h3><asp:Label ID="ProductNameLabel" runat="server" CssClass="hit-the-floor" Style=" font-size:20px"
            Text='<%# Eval("StateName") %>' /></h3>
            <table style="border-radius:2px" border="0">
            <tr style="border-radius:8px; width:200px">
            <td class="ProductPropertyLabel">
                <asp:Image ID="State_Img" ImageUrl='<%# CheckStatus(Eval("StateID").ToString()) %>' width="100px" Height="100px" runat="server" />
                
            </td>

            </tr>
            <tr style="border-radius:8px">
                <td class="ProductPropertyLabel"><b>Post Name:</b></td>
                
                <td><asp:Label ID="CategoryNameLabel" runat="server" 
                    Text='<%# Eval("PostName") %>' /></td>
                    </tr>
                    <tr>
                <td class="ProductPropertyLabel" ><b>Election Start Date:</b></td>
                
               
                <td><asp:Label ID="SupplierNameLabel" runat="server"
                    Text='<%# Eval("ElectionStartDate","{0:dd/MM/yyyy}") %>' /></td>
            </tr>
            <tr>
                <td class="ProductPropertyLabel"><b>Election End Date:</b></td>
                <td><asp:Label ID="QuantityPerUnitLabel" runat="server"
                    Text='<%# Eval("ElectionEndDate","{0:dd/MM/yyyy}") %>' /></td>
            </tr>
        </table>

        </ItemTemplate>
            <SelectedItemStyle BackColor="#343477" Font-Bold="True" ForeColor="black" />
            <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
        </asp:DataList>

    
    
   
    </div>

   
</asp:Content>

