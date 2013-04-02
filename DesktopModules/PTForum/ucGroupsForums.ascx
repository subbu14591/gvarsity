<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucGroupsForums.ascx.vb" Inherits="Presstopia.PTForum.cbGroupsForums" %>
<%@ Register TagPrefix="PTForum" TagName="MainActions" Src="ucMainActions.ascx" %>
<PTForum:MainActions ID="ucMainActions" runat="server" />
<table border="0" width="100%" class="ptfMainTable">
    <tr class="ptfHeadingMain">
        <td colspan="2" align="left" nowrap>
            <asp:Literal ID="ltlForum" runat="server" /></td>
        <td align="center" nowrap>
            <asp:Literal ID="ltlThreads" runat="server" /></td>
        <td align="center" nowrap>
            <asp:Literal ID="ltlPosts" runat="server" /></td>
        <td align="right" nowrap>
            <asp:Literal ID="ltlLastPost" runat="server" /></td>
    </tr>
    <asp:Repeater ID="rptGroups" EnableViewState="False" runat="server">
        <ItemTemplate>
            <tr class="ptfHeadingSub">
                <td colspan="5">
                    <%#Container.DataItem("GroupName")%>
                </td>
            </tr>
            <asp:Repeater ID="rptForums" EnableViewState="False" runat="server" DataSource='<%# Container.DataItem.Row.GetChildRows("relGroupsForums") %>'>
                <ItemTemplate>
                    <tr class="ptfRow">
                        <td width="5%">
                            <%#GetForumImage(Container.DataItem("PostLastAdded").ToString(), Container.DataItem("ForumAllowAnonymous"), Container.DataItem("ForumAllowRegistered"), Container.DataItem("ForumModeratorRole"))%>
                        </td>
                        <td width="80%">
                            <%#GetForumLink(Container.DataItem("ForumID"), Container.DataItem("ForumName"), Container.DataItem("PostLastAdded").ToString())%>
                            <%#GetForumDesc(Container.DataItem("ForumDesc"))%>
                            <%#GetForumModerators(Container.DataItem("ForumModeratorRole"))%>
                        </td>
                        <td align="center" width="5%">
                            <%#Container.DataItem("ThreadCount")%>
                        </td>
                        <td align="center" width="5%">
                            <%#Container.DataItem("PostCount")%>
                        </td>
                        <td align="right" nowrap width="5%">
                            <%#NumberToDateTime(Container.DataItem("PostLastAdded").ToString())%>
                            <br />
                            <%#GetAuthorName(Container.DataItem("PostLastAuthor").ToString(), Container.DataItem("ThreadCount"))%>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </ItemTemplate>
    </asp:Repeater>
</table>
<asp:Panel ID="pnlStatistics" runat="server" />
<div class="ptfHelp" id="divHelp" runat="server">
    <img src='<%=GetImageURL("ptHelp.gif")%>' border="0" />
    <asp:Literal ID="ltlNewForumInfo" runat="server" />
</div>
<div align="center" class="ptfLegends">
    <img src='<%=GetImageURL("ptUnRead.gif")%>' align="absmiddle" border="0" />
    <asp:Literal ID="ltlViewAndPost" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;
    <img src='<%=GetImageURL("ptLockedUnRead.gif")%>' align="absmiddle" border="0" />
    <asp:Literal ID="ltlViewOnly" runat="server" />&nbsp;&nbsp;&nbsp;&nbsp;
    <img src='<%=GetImageURL("ptNoEntryUnRead.gif")%>' align="absmiddle" border="0" />
    <asp:Literal ID="ltlNoAccess" runat="server" />
    <br clear="all" />
</div>
