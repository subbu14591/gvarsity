<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucAdminMain.ascx.vb" Inherits="Presstopia.PTForum.cbAdminMain" %>
<%@ Register TagPrefix="PTForum" TagName="MainActions" Src="ucMainActions.ascx" %>
<PTForum:MainActions ID="ucMainActions" runat="server" />
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="ptfBreadCrumb">
            ::
            <asp:HyperLink ID="lnkAdministration" runat="server" />
        </td>
    </tr>
</table>
<table border="0" width="100%" class="ptfMainTable">
    <tr class="ptfRow">
        <td>
            <div style="margin: 10px 0px 15px 10px; line-height: 25px;">
                &bull; <b>
                    <asp:HyperLink ID="lnkAdminGroupsForums" runat="server" /></b>
                <div style="margin: 0px 0px 0px 20px; line-height: 25px;">
                    &bull;
                    <asp:HyperLink ID="lnkAddGroup" runat="server" /><br />
                    &bull;
                    <asp:HyperLink ID="lnkAddForum" runat="server" />
                </div>
                &bull; <b>
                    <asp:HyperLink ID="lnkForumSettings" runat="server" /></b><br />
                <%If PremiumLicense() Then%>
                &bull; <b>
                    <asp:HyperLink ID="lnkAggregatedRSSFeed" runat="server" /></b>
                <%End If%>
            </div>
        </td>
    </tr>
</table>
