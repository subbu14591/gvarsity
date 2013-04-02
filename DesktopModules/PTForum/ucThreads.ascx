<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucThreads.ascx.vb" Inherits="Presstopia.PTForum.cbThreads" %>
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
            <asp:Literal ID="ltlBreadCrumb" runat="server" />
        </td>
        <td align="right" nowrap>
            <div class="ptfActionButtonContainer">
                <asp:HyperLink ID="lnkNewThread" CssClass="ptfActionButton" runat="server" />
            </div>
        </td>
    </tr>
</table>
<table border="0" width="100%" class="ptfMainTable">
    <tr class="ptfHeadingMain">
        <td colspan="2" align="left" nowrap>
            <asp:Literal ID="ltlThreads" runat="server" /></td>
        <td align="center" nowrap>
            <asp:Literal ID="ltlReplies" runat="server" /></td>
        <td align="center" nowrap>
            <asp:Literal ID="ltlViews" runat="server" /></td>
        <td align="right" nowrap>
            <asp:Literal ID="ltlLastPost" runat="server" /></td>
    </tr>
    <asp:Repeater ID="rptThreads" runat="server">
        <ItemTemplate>
            <tr class="ptfRow">
                <td width="5%">
                    <%#GetThreadImage(Container.DataItem("ThreadID"), Container.DataItem("PostLastAdded"), Container.DataItem("ThreadLocked"), Container.DataItem("ThreadPinned"))%>
                </td>
                <td width="80%">
                    <%#GetThreadLink(Container.DataItem("ThreadID"), Container.DataItem("ThreadSubject"), Container.DataItem("PostLastAdded"))%>
                    <span class="ptfSmallText">
                        <%#GetPages(Container.DataItem("ThreadID"), Container.DataItem("PostCount"))%>
                    </span>
                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="left" nowrap style="border-width: 0; padding: 0; margin: 0;">
                                <asp:Literal ID="ltlBy" runat="server" />
                                <%#GetAuthorName(Container.DataItem("PostAuthor").ToString())%>
                            </td>
                            <td align="right" nowrap style="border-width: 0; padding: 0; margin: 0;">
                                <div class="ptfActionButtonContainer">
                                    <asp:LinkButton ID="lnkDelete" CssClass="ptfActionButton" runat="server" />
                                    <asp:HyperLink ID="lnkEdit" CssClass="ptfActionButton" runat="server" />
                                </div>
                            </td>
                        </tr>
                    </table>
                </td>
                <td align="center" width="5%">
                    <%#Container.DataItem("PostCount")%>
                </td>
                <td align="center" width="5%">
                    <%#Container.DataItem("ThreadViews")%>
                </td>
                <td align="right" nowrap width="5%">
                    <%#NumberToDateTime(Container.DataItem("PostLastAdded").ToString())%>
                    <br />
                    <%#GetAuthorName(Container.DataItem("PostLastAuthor").ToString())%>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <tr class="ptfRow" id="trNoThreads" runat="server">
        <td colspan="5">
            <asp:Literal ID="ltlNoThreadsInfo" runat="server" />
        </td>
    </tr>
    <tr>
        <td colspan="5" class="ptfFooter">
            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                <tr>
                    <td nowrap>
                        <asp:HyperLink ID="lnkRSS" runat="server" />
                        <asp:ImageButton ID="btnSubscribe" runat="server" />
                    </td>
                    <td align="right" nowrap>
                        <asp:Literal ID="ltlPager" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
