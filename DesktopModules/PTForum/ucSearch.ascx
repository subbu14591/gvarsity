<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucSearch.ascx.vb" Inherits="Presstopia.PTForum.cbSearch" %>
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
	<tr>
		<td nowrap class="ptfFormLabel" align="right" width="5%">
			<asp:Literal ID="ltlSearch" runat="server" />
			:
		</td>
		<td nowrap class="ptfFormData" width="95%">
			<asp:TextBox ID="txtSearchWords" Columns="50" MaxLength="100" runat="server" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel">
			&nbsp;</td>
		<td nowrap class="ptfFormData">
			<asp:RadioButtonList ID="radSearchType" runat="server" RepeatDirection="Horizontal" />
		</td>
	</tr>
	<tr>
		<td nowrap class="ptfFormLabel">
			&nbsp;</td>
		<td nowrap class="ptfFormData">
			<div class="ptfActionButtonContainer">
				<asp:LinkButton ID="lnkSearch" CssClass="ptfActionButton" runat="server" />
				<asp:HyperLink ID="lnkCancel" CssClass="ptfActionButton" runat="server" />
			</div>
		</td>
	</tr>
</table>
