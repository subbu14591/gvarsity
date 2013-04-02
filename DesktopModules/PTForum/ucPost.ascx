<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucPost.ascx.vb" Inherits="Presstopia.PTForum.cbPost" %>
<%@ Register TagPrefix="dnn" TagName="TextEditor" Src="~/controls/TextEditor.ascx" %>
<%@ Register TagPrefix="PTForum" TagName="MainActions" Src="ucMainActions.ascx" %>
<PTForum:MainActions ID="ucMainActions" runat="server" />

<script language="javascript" src="<%=Me.ResolveUrl("scripts/addsmilie.js")%>"></script>

<script language="javascript" src="<%=Me.ResolveUrl("scripts/popup.js")%>"></script>

<script language="javascript">
	function showSmileyPopup (objectId, HTMLtoLoad, objectEvent) {
		document.getElementById(objectId).innerHTML = HTMLtoLoad; 
		return !showPopup(objectId, objectEvent);
	}
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
    <tr id="trReplyTo" runat="server">
        <td nowrap class="ptfFormLabel" align="right" width="5%">
            <asp:Literal ID="ltlReplyTo" runat="server" />
            :
        </td>
        <td class="ptfFormData" width="95%">
            <asp:Literal ID="ltlReplyToPost" runat="server" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right" width="5%">
            <asp:Literal ID="ltlThreadSubject" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData" width="95%">
            <asp:TextBox ID="txtThreadSubject" Columns="60" MaxLength="250" runat="server" />
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlMessage" runat="server" />
            :<br />
            <br />
            <asp:Literal ID="ltlSmiliesTable" runat="server" />
        </td>
        <td nowrap class="ptfFormData">
            <dnn:TextEditor ID="txtMessage" ChooseMode="false" Width="500" Height="400" runat="server" />
        </td>
    </tr>
    <tr id="trImageUpload" runat="server">
        <td nowrap class="ptfFormLabel" align="right">
            <asp:Literal ID="ltlImageUpload" runat="server" />
            :
        </td>
        <td nowrap class="ptfFormData">
            <input id="txtImageUpload" type="file" size="50" name="txtImageUpload" runat="server">
            &nbsp;
            <asp:LinkButton CssClass="ptfActionButton" ID="lnkImageUpload" runat="server" /><br />
            <span class="ptfSmallText">
                <asp:Literal ID="ltlImageUploadInfo" runat="server" />
            </span>
        </td>
    </tr>
    <tr>
        <td nowrap class="ptfFormLabel">
            &nbsp;</td>
        <td nowrap class="ptfFormData">
            <div class="ptfActionButtonContainer">
                <asp:LinkButton CssClass="ptfActionButton" ID="lnkAddPost" runat="server" />
                <asp:LinkButton CssClass="ptfActionButton" ID="lnkAddThread" runat="server" />
                <asp:LinkButton CssClass="ptfActionButton" ID="lnkUpdatePost" runat="server" />
                <asp:HyperLink CssClass="ptfActionButton" ID="lnkCancel" runat="server" />
            </div>
        </td>
    </tr>
</table>
