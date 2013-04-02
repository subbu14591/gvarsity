<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<div class="titleContainer">
    <dnn:TITLE runat="server" id="dnnTITLE" cssclass="titleStyle" />
	<div id="ContentPane" runat="server" class="editContent"></div>
</div>

