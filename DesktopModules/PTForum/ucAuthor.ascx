<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucAuthor.ascx.vb" Inherits="Presstopia.PTForum.cbAuthor" %>
<%@ Register TagPrefix="PTForum" TagName="MainActions" Src="ucMainActions.ascx" %>
<PTForum:MainActions ID="ucMainActions" runat="server" />

<script language="javascript">
	function confirmAction()
	{	if (confirm('<asp:literal id="ltlConfirm" runat="server" />')==true)
			return true;
		else
			return false;	}
</script>

<div id="divError" class="ptfErrorMessage" runat="server">
    <asp:Literal ID="ltlError" runat="server" />
</div>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td class="ptfBreadCrumb">
            ::
            <asp:Literal ID="ltlBreadCrumb" runat="server" />
        </td>
    </tr>
</table>
<table border="0" width="100%" class="ptfMainTable">
    <tr id="trAuthorAdminInfo" runat="server" class="ptfHelp">
        <td colspan="2">
            <img src='<%=GetImageURL("ptHelp.gif")%>' border="0" />
            <asp:Literal ID="ltlAuthorAdminInfo" runat="server" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right" width="5%">
            <asp:Literal ID="ltlAuthorIDlabel" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData" width="95%">
            <span class="ptfBoldText">
                <asp:Literal ID="ltlAuthorID" runat="server" />
            </span>
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlUserNameLabel" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <span class="ptfBoldText">
                <asp:Literal ID="ltlUserName" runat="server" />
            </span>
        </td>
    </tr>
    <tr id="trAuthorStatus" runat="server">
        <td nowrap class="ptfFormLabel" align="right">
            *
            <asp:Literal ID="ltlAuthorStatus" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:CheckBox ID="chkAuthorStatus" runat="server" />
            <span class="ptfBoldText">
                <asp:Literal ID="ltlActive" runat="server" />
            </span><span class="ptfSmallText">&nbsp;&nbsp;(<asp:Literal ID="ltlAuthorStatusInfo" runat="server" />) </span>
        </td>
    </tr>
    <tr id="trAuthorAdminText" runat="server">
        <td nowrap class="ptfFormLabel" align="right">
            *
            <asp:Literal ID="ltlAuthorAdminText" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:TextBox ID="txtAuthorAdminText" Columns="50" Rows="4" TextMode="MultiLine" runat="server" /><br />
            <span class="ptfSmallText">
                <asp:Literal ID="ltlAuthorAdminTextInfo" runat="server" />
            </span>
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlAuthorLocation" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:TextBox ID="txtAuthorLocation" Columns="50" runat="server" MaxLength="100" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlAuthorAboutMe" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:TextBox ID="txtAuthorAboutMe" Columns="50" Rows="4" TextMode="MultiLine" runat="server" /><br />
            <span class="ptfSmallText">
                <asp:Literal ID="ltlAuthorAboutMeInfo" runat="server" />
            </span>
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlAuthorSignature" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:TextBox ID="txtAuthorSignature" Columns="50" Rows="4" TextMode="MultiLine" runat="server" /><br />
            <span class="ptfSmallText">
                <asp:Literal ID="ltlAuthorSignatureInfo" runat="server" />
            </span>
        </td>
    </tr>
    <tr id="trAvatarUploads" runat="server">
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlAuthorAvatar" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <input type="hidden" id="txtAuthorAvatar" name="txtAuthorAvatar" runat="server" />
            <div>
                <asp:Image ID="imgAuthorAvatar" runat="server" ImageAlign="AbsMiddle" />
                <asp:LinkButton ID="lnkRemoveAvatar" runat="server" />
            </div>
            <input id="txtAuthorAvatarUpload" type="file" size="50" name="txtAuthorAvatarUpload" runat="server"><br />
            <span class="ptfSmallText">
                <asp:Literal ID="ltlAvatarUploadInfo" runat="server" />
            </span>
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlSubscriptions" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <span class="ptfBoldText">
                <asp:Literal ID="ltlForums" runat="server" />
                : </span>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <asp:Repeater ID="rptForumSubscriptions" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td width="5%" nowrap>
                                <asp:ImageButton ID="btnDeleteForumSubs" ImageAlign="Middle" runat="server" />
                            </td>
                            <td>
                                <%#GetForumLink(Container.DataItem("ForumID"), Container.DataItem("ForumName"))%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr id="trNoForumSubscriptions" runat="server">
                    <td>
                        <asp:Literal ID="ltlNoForumSubscriptionsInfo" runat="server" />
                    </td>
                </tr>
            </table>
            <br />
            <span class="ptfBoldText">
                <asp:Literal ID="ltlThreads" runat="server" />
                : </span>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <asp:Repeater ID="rptThreadSubscriptions" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td width="5%" nowrap>
                                <asp:ImageButton ID="btnDeleteThreadSubs" ImageAlign="Middle" runat="server" />
                            </td>
                            <td>
                                <%#GetThreadLink(Container.DataItem("ThreadID"), Container.DataItem("ThreadSubject"))%>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr id="trNoThreadSubscriptions" runat="server">
                    <td>
                        <asp:Literal ID="ltlNoThreadSubscriptionsInfo" runat="server" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel">
            &nbsp;</td>
        <td nowrap class="ptfFormData">
            <div class="ptfActionButtonContainer">
                <asp:LinkButton ID="lnkUpdate" CssClass="ptfActionButton" runat="server" />
                <asp:HyperLink ID="lnkCancel" CssClass="ptfActionButton" runat="server" />
            </div>
        </td>
    </tr>
</table>
