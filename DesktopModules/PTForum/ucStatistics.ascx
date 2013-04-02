<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucStatistics.ascx.vb" Inherits="Presstopia.PTForum.cbStatistics" %>
<table border="0" width="100%" class="ptfMainTable">
    <tr class="ptfHeadingMain">
        <td>
            <asp:Literal ID="ltlStatistics" runat="server" />
        </td>
    </tr>
    <tr class="ptfRow">
        <td>
            <span class="ptfStatistics">
                <asp:Literal ID="ltlThereAre" runat="server" />
                <b>
                    <%=GetTotalPosts()%>
                </b>
                <asp:Literal ID="ltlPostsIn" runat="server" />
                <b>
                    <%=GetTotalThreads()%>
                </b>
                <asp:Literal ID="ltlThreadsIn" runat="server" />
                <b>
                    <%=GetTotalForums()%>
                </b>
                <asp:Literal ID="ltlForums" runat="server" /><br />
                <b>
                    <%=GetTotalPosts24()%>
                </b>
                <asp:Literal ID="ltlPostsLast24Hours" runat="server" /><br />
                <asp:Literal ID="ltlMostRecentPost" runat="server" />
                <b>
                    <%=GetLastPostAuthor()%>
                </b>
                <asp:Literal ID="ltlOn" runat="server" />
                <b>
                    <%=GetLastPostDate()%>
                </b>
                <br />
                <asp:Literal ID="ltlTotalUsers" runat="server" />
                <b>
                    <%=GetTotalUsers()%>
                </b>
                <br />
                <asp:Literal ID="ltlCacheUpdated" runat="server" />
                <b>
                    <%=GetCacheDuration()%>
                </b>
                <asp:Literal ID="ltlSeconds" runat="server" /><br />
            </span>
        </td>
    </tr>
</table>
