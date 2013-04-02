<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucSearchResults.ascx.vb" Inherits="Presstopia.PTForum.cbSearchResults" %>
<%@ Register TagPrefix="PTForum" TagName="MainActions" Src="ucMainActions.ascx" %>
<PTForum:MainActions ID="ucMainActions" runat="server" />
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="ptfBreadCrumb">
            ::
            <asp:Literal ID="ltlBreadCrumb" runat="server" />
        </td>
    </tr>
</table>
<table border="0" width="100%" class="ptfMainTable">
    <tr class="ptfHeadingMain">
        <td align="left" nowrap>
            <asp:Literal ID="ltlSubject" runat="server" /></td>
        <td align="right" nowrap>
            <asp:Literal ID="ltlPosted" runat="server" /></td>
    </tr>
    <asp:Repeater ID="rptSearch" runat="server">
        <ItemTemplate>
            <tr class="ptfRow">
                <td width="90%">
                    <span class="ptfBoldText">
                        <%#GetThreadLink(Container.DataItem("ThreadID"), Container.DataItem("ThreadSubject"))%>
                        <br />
                    </span>
                    <%#GetPostMessage(Container.DataItem("PostMessage"))%>
                    <br />
                    <img src='<%=GetImageURL("ptArrowR.gif")%>' border="0" />
                    <span class="ptfSmallText">
                        <%#GetForumLink(Container.DataItem("ForumID"), Container.DataItem("ForumName"))%>
                    </span>
                </td>
                <td align="right" nowrap width="10%">
                    <%#NumberToDateTime(Container.DataItem("PostDateAdded").ToString())%>
                    <br />
                    <%#GetAuthorName(Container.DataItem("UserName").ToString())%>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
    <tr>
        <td colspan="2" align="right" nowrap class="ptfFooter">
            <asp:Literal ID="ltlPager" runat="server" />
        </td>
    </tr>
</table>
