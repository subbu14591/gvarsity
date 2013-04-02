<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<div class="standard">
	<% If DotNetNuke.Common.Globals.IsLayoutMode() Then %>
	<dnn:TITLE runat="server" id="dnnTITLE" cssclass="titleStyle" />
	<% End If %>
	<div id="ContentPane" runat="server" class="standardContent"></div>
</div>

