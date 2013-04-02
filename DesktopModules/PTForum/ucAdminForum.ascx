<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucAdminForum.ascx.vb" Inherits="Presstopia.PTForum.cbAdminForum" %>
<%@ Register TagPrefix="PTForum" TagName="MainActions" Src="ucMainActions.ascx" %>
<PTForum:MainActions ID="ucMainActions" runat="server" />
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="ptfBreadCrumb">
            ::
            <asp:HyperLink ID="lnkAdministration" runat="server" />
            <asp:Literal ID="ltlSeparator" runat="server" />
            <asp:HyperLink ID="lnkAdminGroupsForums" runat="server" />
        </td>
    </tr>
</table>
<table border="0" width="100%" class="ptfMainTable">
    <tr>
        <td nowrap class="ptfFormLabel" align="right" width="5%">
            <asp:Literal ID="ltlGroupName" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData" width="95%">
            <asp:DropDownList ID="lstGroupName" runat="server" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlForumName" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:TextBox ID="txtForumName" Columns="50" MaxLength="250" runat="server" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlForumDesc" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:TextBox ID="txtForumDesc" Columns="50" MaxLength="250" runat="server" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlAnonymous" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:DropDownList ID="lstForumAllowAnonymous" runat="server" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlRegistered" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:DropDownList ID="lstForumAllowRegistered" runat="server" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlModeratorRole" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:DropDownList ID="lstForumModeratorRole" runat="server" />
        </td>
    </tr>
    <tr id="trForumFeed" runat="server">
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlForumFeed" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:DropDownList ID="lstForumFeed" runat="server" />
        </td>
    </tr>
    <tr id="trForumFeedAggregated" runat="server">
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlForumFeedAggregated" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:DropDownList ID="lstForumFeedAggregated" runat="server" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel">
            &nbsp;</td>
        <td nowrap class="ptfFormData">
            <div class="ptfActionButtonContainer">
                <asp:LinkButton ID="lnkUpdate" CssClass="ptfActionButton" runat="server" />
                <asp:LinkButton ID="lnkAdd" CssClass="ptfActionButton" runat="server" />
                <asp:HyperLink ID="lnkCancel" CssClass="ptfActionButton" runat="server" />
            </div>
        </td>
    </tr>
</table>
<div class="ptfHelp">
    <img src='<%=GetImageURL("ptHelp.gif")%>' border="0" />
    <asp:Literal ID="ltlAdminForumInfo" runat="server" />
</div>
