<%@ Control language="vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<div class="panel panelBlue">
	<% If DotNetNuke.Common.Globals.IsLayoutMode() Then %>
	<dnn:TITLE runat="server" id="dnnTITLE" cssclass="titleStyle" />
	<% End If %>
	<div id="ContentPane" runat="server" class="panelContent"></div>
</div>

