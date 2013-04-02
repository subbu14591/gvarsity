<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucPosts.ascx.vb" Inherits="Presstopia.PTForum.cbPosts" %>
<%@ Register TagPrefix="PTForum" TagName="MainActions" Src="ucMainActions.ascx" %>
<PTForum:MainActions ID="ucMainActions" runat="server" />

<script language="javascript" src="<%=Me.ResolveUrl("scripts/popup.js")%>"></script>

<script language="javascript">
	function showAuthorInfoPopup (objectId, objectEvent) {
		return !showPopup(objectId, objectEvent);
	}
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
        <td align="right" nowrap width="180">
            <div class="ptfActionButtonContainer">
                <asp:HyperLink ID="lnkEditThread" CssClass="ptfActionButton" runat="server" />
                <asp:HyperLink ID="lnkNewThread" CssClass="ptfActionButton" runat="server" />
            </div>
        </td>
    </tr>
</table>
<table border="0" width="100%" class="ptfMainTable">
    <tr class="ptfHeadingMain">
        <td nowrap>
            <asp:Literal ID="ltlAuthor" runat="server" /></td>
        <td nowrap>
            <asp:Literal ID="ltlMessages" runat="server" /></td>
    </tr>
    <asp:Repeater ID="rptPosts" runat="server">
        <ItemTemplate>
            <tr>
                <td rowspan="2" valign="top" class="ptfPostUserBox">
                    <span class="ptfPostUserBoxName">
                        <%#GetAuthorName(Container.DataItem("AuthorName").ToString(),Container.DataItem("AuthorID"))%>
                        <br />
                    </span><span class="ptfPostUserBoxButtons">
                        <%#GetAuthorButtons(Container.DataItem("AuthorName").ToString(),Container.DataItem("AuthorID"),Container.DataItem("AuthorAboutMe").ToString())%>
                    </span><span class="ptfPostUserBoxRole">
                        <%#GetAuthorRole(Container.DataItem("AuthorID"))%>
                    </span><span class="ptfPostUserBoxAvatar">
                        <%#GetAuthorAvatar(Container.DataItem("AuthorAvatar").ToString())%>
                    </span><span class="ptfPostUserBoxPosts">
                        <asp:Literal ID="ltlPosts" runat="server" />
                        :
                        <%#Container.DataItem("AuthorPosts")%>
                        <br />
                    </span><span class="ptfPostUserBoxLocation">
                        <asp:Literal ID="ltlLocation" runat="server" />
                        :
                        <%#GetAuthorLocation(Container.DataItem("AuthorLocation").ToString())%>
                        <br />
                    </span><span class="ptfPostUserBoxTemplate">
                        <%#GetAuthorPostTemplate(Container.DataItem("AuthorID"))%>
                    </span><span class="ptfPostUserBoxAdminText">
                        <%#Container.DataItem("AuthorAdminText").ToString()%>
                    </span>
                </td>
                <td valign="top" class="ptfPostMessageBox">
                    <table border="0" width="100%" class="ptfPostMessageHeaderBox">
                        <tr>
                            <td nowrap>
                                <span class="ptfSmallText">
                                    <asp:Literal ID="ltlPosted" runat="server" />
                                    :
                                    <%#NumberToDateTime(Container.DataItem("PostDateAdded").ToString())%>
                                    &nbsp;
                                    <%#GetIPAddress(Container.DataItem("PostIP"))%>
                                </span>
                            </td>
                            <td align="right" nowrap>
                                <div class="ptfActionButtonContainer">
                                    <asp:LinkButton ID="lnkDelete" CssClass="ptfActionButton" runat="server" />
                                    <asp:HyperLink ID="lnkEdit" CssClass="ptfActionButton" runat="server" />
                                    <asp:HyperLink ID="lnkQuote" CssClass="ptfActionButton" runat="server" />
                                    <asp:HyperLink ID="lnkReply" CssClass="ptfActionButton" runat="server" />
                                </div>
                            </td>
                        </tr>
                    </table>
                    <%#Container.DataItem("PostMessage")%>
                </td>
            </tr>
            <tr>
                <td valign="bottom" class="ptfPostSignatureBox">
                    <%#GetAuthorSignature(Container.DataItem("AuthorSignature").ToString())%>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <tr>
        <td colspan="2" class="ptfFooter">
            <table cellspacing="0" cellpadding="0" border="0" width="100%">
                <tr>
                    <td nowrap>
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
<asp:Literal ID="ltlAuthorInfoDivs" runat="server" />