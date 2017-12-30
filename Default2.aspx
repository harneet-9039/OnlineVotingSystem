<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage23.master" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="ListView1" runat="server" style="height:60px" DataSourceID="SqlDataSource1">
        <AlternatingItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="StateNameLabel" runat="server" Text='<%# Eval("StateName") %>' />
                </td>
                </tr>
                <tr>
                <td>
                    <asp:Label ID="Start_DateLabel" runat="server" Text='<%# Eval("[Start Date]") %>' />
                </td>
                </tr>
                <tr>
                <td>
                    <asp:Label ID="End_DateLabel" runat="server" Text='<%# Eval("[End Date]") %>' />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <tr style="">
               
                              <td>
                    <asp:TextBox ID="StateNameTextBox" runat="server" Text='<%# Bind("StateName") %>' />
                </td>
                </tr>
                <tr>
                <td>
                    <asp:TextBox ID="Start_DateTextBox" runat="server" Text='<%# Bind("[Start Date]") %>' />
                </td>
                </tr>
                <tr>
                <td>
                    <asp:TextBox ID="End_DateTextBox" runat="server" Text='<%# Bind("[End Date]") %>' />
                </td>
            </tr>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <tr style="">
             
                <td>
                    <asp:TextBox ID="StateNameTextBox" runat="server" Text='<%# Bind("StateName") %>' />
                </td>
                <td>
                    <asp:TextBox ID="Start_DateTextBox" runat="server" Text='<%# Bind("[Start Date]") %>' />
                </td>
                <td>
                    <asp:TextBox ID="End_DateTextBox" runat="server" Text='<%# Bind("[End Date]") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="StateNameLabel" runat="server" Text='<%# Eval("StateName") %>' />
                </td>
                <td>
                    <asp:Label ID="Start_DateLabel" runat="server" Text='<%# Eval("[Start Date]") %>' />
                </td>
                <td>
                    <asp:Label ID="End_DateLabel" runat="server" Text='<%# Eval("[End Date]") %>' />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server">StateName</th>
                                <th runat="server">Start Date</th>
                                <th runat="server">End Date</th>
                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
               
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <tr style="">
                <td>
                    <asp:Label ID="StateNameLabel" runat="server" Text='<%# Eval("StateName") %>' />
                </td>
                <td>
                    <asp:Label ID="Start_DateLabel" runat="server" Text='<%# Eval("[Start Date]") %>' />
                </td>
                <td>
                    <asp:Label ID="End_DateLabel" runat="server" Text='<%# Eval("[End Date]") %>' />
                </td>
            </tr>
        </SelectedItemTemplate>
    </asp:ListView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Online VotingConnectionString %>" SelectCommand="select st.StateName,convert(varchar,el.ElectionStartDate,106) 'Start Date', convert(varchar,el.ElectionEndDate,106) 'End Date' from Election el
inner join state st on el.ElectionState=st.StateID where ElectionStartDate &lt; GETDATE()"></asp:SqlDataSource>

</asp:Content>

