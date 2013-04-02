<%@ Control Language="vb" Explicit="True" AutoEventWireup="false" Codebehind="ucError.ascx.vb" Inherits="Presstopia.PTForum.cbError" %>
<%@ Register TagPrefix="PTForum" TagName="MainActions" Src="ucMainActions.ascx" %>
<PTForum:MainActions ID="ucMainActions" runat="server" />
<div class="ptfErrorMessage">
    <br />
    &nbsp;&nbsp;
    <asp:Literal ID="ltlError" runat="server" />
    <br />
    <br />
</div>
