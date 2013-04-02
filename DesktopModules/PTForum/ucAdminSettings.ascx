<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucAdminSettings.ascx.vb" Inherits="Presstopia.PTForum.cbAdminSettings" %>
<%@ Register TagPrefix="PTForum" TagName="MainActions" Src="ucMainActions.ascx" %>
<PTForum:MainActions ID="ucMainActions" runat="server" />
<table border="0" cellpadding="0" cellspacing="0" width="100%">
	<tr>
		<td class="ptfBreadCrumb">
			::
			<asp:HyperLink ID="lnkAdministration" runat="server" />
			<asp:Literal ID="ltlSeparator" runat="server" />
			<asp:HyperLink ID="lnkForumSettings" runat="server" />
		</td>
	</tr>
</table>
<table border="0" width="100%" class="ptfMainTable">
	<tr class="ptfHelp">
		<td colspan="2">
			<img src='<%=GetImageURL("ptHelp.gif")%>' border="0" />
			<asp:Literal ID="ltlUploadSettingsInfo" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlEnableImageUploads" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:CheckBox ID="chkEnableImageUploads" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormSubLabel" align="right">
			<asp:Literal ID="ltlImageFileSizeMax" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			&nbsp;...
			<asp:TextBox ID="txtImageFileSizeMax" Columns="6" MaxLength="6" runat="server" />
			<span class="ptfSmallText">Bytes</span>
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormSubLabel" align="right">
			<asp:Literal ID="ltlImageWidthMax" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			&nbsp;...
			<asp:TextBox ID="txtImageWidthMax" Columns="3" MaxLength="3" runat="server" />
			<span class="ptfSmallText">Pixels</span>
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlEnableAvatarUploads" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:CheckBox ID="chkEnableAvatarUploads" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormSubLabel" align="right">
			<asp:Literal ID="ltlAvatarfileSizeMax" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			&nbsp;...
			<asp:TextBox ID="txtAvatarFileSizeMax" Columns="6" MaxLength="6" runat="server" />
			<span class="ptfSmallText">Bytes</span>
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormSubLabel" align="right">
			<asp:Literal ID="ltlAvatarWidthMax" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			&nbsp;...
			<asp:TextBox ID="txtAvatarWidthMax" Columns="3" MaxLength="3" runat="server" />
			<span class="ptfSmallText">Pixels</span>
		</td>
	</tr>
	<tr class="ptfHelp">
		<td colspan="2">
			<img src='<%=GetImageURL("ptHelp.gif")%>' border="0" />
			<asp:Literal ID="ltlPageSizeSettingsInfo" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlThreadPageSize" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:TextBox ID="txtThreadPageSize" Columns="3" MaxLength="3" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlPostPageSize" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:TextBox ID="txtPostPageSize" Columns="3" MaxLength="3" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlSearchPageSize" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:TextBox ID="txtSearchPageSize" Columns="3" MaxLength="3" runat="server" />
		</td>
	</tr>
	<tr class="ptfHelp">
		<td colspan="2">
			<img src='<%=GetImageURL("ptHelp.gif")%>' border="0" />
			<asp:Literal ID="ltlPostSettingsInfo" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlPostEditorWidth" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:TextBox ID="txtPostEditorWidth" Columns="3" MaxLength="3" runat="server" />
			<span class="ptfSmallText">Pixels</span>
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlPostEditorHeight" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:TextBox ID="txtPostEditorHeight" Columns="3" MaxLength="3" runat="server" />
			<span class="ptfSmallText">Pixels</span>
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlEnableAnonymousHTML" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:CheckBox ID="chkEnableAnonymousHTML" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlEnableSmilies" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:CheckBox ID="chkEnableSmilies" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormSubLabel" align="right">
			<asp:Literal ID="ltlSmiliesFolderName" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			&nbsp;...
			<asp:TextBox ID="txtSmiliesFolderName" Columns="40" MaxLength="100" runat="server" />
		</td>
	</tr>
	<tr class="ptfHelp">
		<td colspan="2">
			<img src='<%=GetImageURL("ptHelp.gif")%>' border="0" />
			<asp:Literal ID="ltlEmailSettingsInfo" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlAllowEmailNotifications" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:CheckBox ID="chkAllowEmailNotifications" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormSubLabel" align="right">
			<asp:Literal ID="ltlEmailSeparateThread" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			&nbsp;...
			<asp:CheckBox ID="chkEmailSeparateThread" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormSubLabel" align="right">
			<asp:Literal ID="ltlEmailFromAddress" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			&nbsp;...
			<asp:TextBox ID="txtEmailFromAddress" Columns="40" MaxLength="50" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormSubLabel" align="right">
			<asp:Literal ID="ltlEmailToAddress" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			&nbsp;...
			<asp:TextBox ID="txtEmailToAddress" Columns="40" MaxLength="50" runat="server" />
		</td>
	</tr>
	<tr class="ptfHelp">
		<td colspan="2">
			<img src='<%=GetImageURL("ptHelp.gif")%>' border="0" />
			<asp:Literal ID="ltlGeneralSettingsInfo" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlEnableStatistics" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:CheckBox ID="chkEnableStatistics" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormSubLabel" align="right">
			<asp:Literal ID="ltlStatisticsCacheDuration" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			&nbsp;...
			<asp:TextBox ID="txtStatisticsCacheDuration" Columns="4" MaxLength="4" runat="server" />
			<span class="ptfSmallText">Seconds</span>
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlPostMessageMaxLength" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:TextBox ID="txtPostMessageMaxLength" Columns="6" MaxLength="6" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlAuthorSignatureMaxLength" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:TextBox ID="txtAuthorSignatureMaxLength" Columns="6" MaxLength="6" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlModuleTemplate" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:DropDownList ID="lstModuleTemplate" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlAuthorPostTemplate" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:TextBox ID="txtAuthorPostTemplate" Columns="40" runat="server" TextMode="MultiLine" Rows="3" /><br />
			<span class="ptfSmallText">
				<asp:Literal ID="ltlPlaceHolders" runat="server" />
				: [USERID] [TABID] [MODULEID] </span>
		</td>
	</tr>
	<tr class="ptfHelp">
		<td colspan="2">
			<img src='<%=GetImageURL("ptHelp.gif")%>' border="0" />
			<asp:Literal ID="ltlModerationSettingsInfo" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlUserMaxEditTime" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:TextBox ID="txtUserMaxEditTime" Columns="6" MaxLength="7" runat="server" />
			<span class="ptfSmallText">Minutes</span>
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlModeratorMaxEditTime" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:TextBox ID="txtModeratorMaxEditTime" Columns="6" MaxLength="7" runat="server" />
			<span class="ptfSmallText">Minutes</span>
		</td>
	</tr>
	<tr id="trRSSFeedsInfo" runat="server" class="ptfHelp">
		<td colspan="2">
			<img src='<%=GetImageURL("ptHelp.gif")%>' border="0" />
			<asp:Literal ID="ltlRSSfeedSettingsInfo" runat="server" />
		</td>
	</tr>
	<tr id="trAggregatedRSSFeed" runat="server">
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlAggregatedRSSFeed" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:CheckBox ID="chkAggregatedRSSTitleOnly" runat="server" />
			<span class="ptfSmallText">
				<asp:Literal ID="ltlAggregatedRSSTitleOnly" runat="server" />
			</span>
		</td>
	</tr>
	<tr id="trRSSFeedPostCount" runat="server">
		<td nowrap class="ptfFormLabel" align="right">
			<asp:Literal ID="ltlRSSFeedPostCount" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData">
			<asp:TextBox ID="txtRSSFeedPostCount" Columns="3" MaxLength="5" runat="server" />
		</td>
	</tr>
	<tr class="ptfHelp">
		<td colspan="2">
			&nbsp;</td>
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
