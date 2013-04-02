<%@ Control Language="vb" Codebehind="~/admin/Containers/container.vb" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Containers.Container" %>
<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONS" Src="~/Admin/Containers/SolPartActions.ascx" %>
<%@ Register TagPrefix="dnn" TagName="VISIBILITY" Src="~/Admin/Containers/Visibility.ascx" %>
<%@ Register TagPrefix="dnn" TagName="ACTIONBUTTON" Src="~/Admin/Containers/ActionButton.ascx" %>

<div class="greytnessStdContainer greytnessBoxGrey1">
	<% If Not ModuleConfiguration.ModuleTitle ="" Then %>
	<h2>
		<dnn:TITLE runat="server" id="dnnTITLE" CssClass="h2" />
	</h2>
	<% else %>
	<div class="no-title-padding"></div>
	<% end if %>
	<% If  DotNetNuke.Application.DotNetNukeContext.Current.Application.Version.Major < 6 Then %>
	<dnn:ACTIONS runat="server" ID="dnnACTIONS" />
	<% end if %>
	<div id="ContentPane" runat="server"></div>
	<% If  DotNetNuke.Application.DotNetNukeContext.Current.Application.Version.Major < 6 Then %>
	<div class="action-buttons">
		<dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON2" CommandName="SyndicateModule.Action" DisplayIcon="False" DisplayLink="False" IconFile="graphics/rss.gif" />
		<dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON1" CommandName="AddContent.Action" DisplayIcon="True" DisplayLink="True" />
		<dnn:ACTIONBUTTON runat="server" id="dnnACTIONBUTTON4" CommandName="ModuleSettings.Action" DisplayIcon="True" DisplayLink="True" />
	</div>
	<% end if %>
</div>
