<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucThread.ascx.vb" Inherits="Presstopia.PTForum.cbThread" %>
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
    </tr>
</table>
<table border="0" width="100%" class="ptfMainTable">
    <tr>
        <td nowrap class="ptfFormLabel" align="right" width="5%">
            <asp:Literal ID="ltlForumName" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData" width="95%">
            <asp:DropDownList ID="lstForumName" runat="server" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlThreadSubject" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:TextBox ID="txtThreadSubject" Columns="50" MaxLength="250" runat="server" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlThreadPinned" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:CheckBox ID="chkThreadPinned" runat="server" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlThreadLocked" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <asp:CheckBox ID="chkThreadLocked" runat="server" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel">
            &nbsp;</td>
        <td nowrap class="ptfFormData">
            <div class="ptfActionButtonContainer">
                <asp:LinkButton ID="lnkUpdate" CssClass="ptfActionButton" runat="server" />
                <asp:HyperLink ID="lnkCancel" CssClass="ptfActionButton" runat="server" />
                <asp:LinkButton ID="lnkDelete" CssClass="ptfActionButton" runat="server" />
            </div>
        </td>
    </tr>
</table>
