<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucAdminGroupsForums.ascx.vb" Inherits="Presstopia.PTForum.cbAdminGroupsForums" %>
<%@ Register TagPrefix="PTForum" TagName="MainActions" Src="ucMainActions.ascx" %>
<PTForum:MainActions ID="ucMainActions" runat="server" />

<script language="javascript">
	function confirmAction()
	{	if (confirm('<asp:literal id="ltlConfirm" runat="server" />')==true)
			return true;
		else
			return false;	}
</script>

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
    <tr class="ptfHeadingMain">
        <td align="left">
            <asp:Literal ID="ltlForum" runat="server" /></td>
        <td align="right">
            <asp:Literal ID="ltlActions" runat="server" /></td>
    </tr>
    <asp:Repeater ID="rptGroups" runat="server">
        <ItemTemplate>
            <tr class="ptfHeadingSub">
                <td>
                    <%#Container.DataItem("GroupName")%>
                </td>
                <td nowrap align="right">
                    <div class="ptfActionButtonContainer">
                        <asp:ImageButton ID="btnUpGroup" ImageAlign="Middle" runat="server" />
                        <asp:ImageButton ID="btnDownGroup" ImageAlign="Middle" runat="server" />
                        <asp:ImageButton ID="btnDeleteGroup" ImageAlign="Middle" runat="server" />
                        <asp:HyperLink ID="lnkEditGroup" runat="server" />
                    </div>
                </td>
            </tr>
            <asp:Repeater ID="rptForums" runat="server">
                <ItemTemplate>
                    <tr class="ptfRow">
                        <td style="border-right: 0px;">
                            <b>
                                <%#Container.DataItem("ForumName")%>
                            </b>
                            <br />
                            <div align="left" style="float: left;" class="ptfSmallText">
                                <asp:Literal ID="ltlAnonymous" runat="server" /><br />
                                <asp:Literal ID="ltlRegistered" runat="server" /><br />
                                <asp:Literal ID="ltlModeratorRole" runat="server" /><br />
                                <asp:Literal ID="ltlForumFeed" runat="server" /><br />
                                <asp:Literal ID="ltlForumFeedAggregated" runat="server" /><br />
                            </div>
                            <div align="left" class="ptfSmallText">
                                &nbsp;:
                                <%#GetPermissions(Container.DataItem("ForumAllowAnonymous"))%>
                                <br />
                                &nbsp;:
                                <%#GetPermissions(Container.DataItem("ForumAllowRegistered"))%>
                                <br />
                                &nbsp;:
                                <%#GetModeratorRole(Container.DataItem("ForumModeratorRole"))%>
                                <br />
                                &nbsp;:
                                <%#GetForumFeed(Container.DataItem("ForumFeed"))%>
                                <br />
                                &nbsp;:
                                <%#GetForumFeedAggregated(Container.DataItem("ForumFeedAggregated"))%>
                                <br />
                            </div>
                        </td>
                        <td style="border-left: 0px;" nowrap align="right">
                            <div class="ptfActionButtonContainer">
                                <asp:ImageButton ID="btnUpForum" ImageAlign="Middle" runat="server" />
                                <asp:ImageButton ID="btnDownForum" ImageAlign="Middle" runat="server" />
                                <asp:ImageButton ID="btnDeleteForum" ImageAlign="Middle" runat="server" />
                                <asp:HyperLink ID="lnkEditForum" runat="server" />
                            </div>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </ItemTemplate>
    </asp:Repeater>
</table>
<div align="right" class="ptfActionButtonContainer">
    <asp:HyperLink ID="lnkAddGroup" CssClass="ptfActionButton" runat="server" />
    <asp:HyperLink ID="lnkAddForum" CssClass="ptfActionButton" runat="server" />
</div>
<div class="ptfHelp">
    <img src='<%=GetImageURL("ptHelp.gif")%>' border="0" />
    <asp:Literal ID="ltlAdminGroupsForumsInfo" runat="server" />
</div>
