<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucAdminGroup.ascx.vb" Inherits="Presstopia.PTForum.cbAdminGroup" %>
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
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlGroupName" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:TextBox ID="txtGroupName" Columns="50" MaxLength="250" runat="server" />
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
