<!--

+========================================================+
|                                                        |
|              DotNetNuke Skin - Greytness               |
|               Developed by Adammer LLC                 |
|                http://www.adammer.com                  |
|                                                        |
|                Adammer menu technology                 |
|                   licensed through                     |
|                http://www.snapsis.com                  |
|                                                        |
|                       July 2009                        |
|                                                        |
+========================================================+

Version     : 2.6
Released    : May 2012
Style       : Charcool FullWidth
DNN Version : 6

-->
<%@ Control language="c#" AutoEventWireup="false" Explicit="True" Inherits="DotNetNuke.UI.Skins.Skin" %>
<%@ Register TagPrefix="dnn" TagName="LOGO" Src="~/Admin/Skins/Logo.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BANNER" Src="~/Admin/Skins/Banner.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LINKS" Src="~/Admin/Skins/Links.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LANGUAGE" Src="~/Admin/Skins/Language.ascx" %>
<%@ Register TagPrefix="dnn" TagName="SEARCH" Src="~/Admin/Skins/Search.ascx" %>
<%@ Register TagPrefix="dnn" TagName="LOGIN" Src="~/Admin/Skins/Login.ascx" %>
<%@ Register TagPrefix="dnn" TagName="USER" Src="~/Admin/Skins/User.ascx" %>
<%@ Register TagPrefix="dnn" TagName="BREADCRUMB" Src="~/Admin/Skins/BreadCrumb.ascx" %>
<%@ Register TagPrefix="dnn" TagName="CURRENTDATE" Src="~/Admin/Skins/CurrentDate.ascx" %>
<%@ Register TagPrefix="dnn" TagName="COPYRIGHT" Src="~/Admin/Skins/Copyright.ascx" %>
<%@ Register TagPrefix="dnn" TagName="HELP" Src="~/Admin/Skins/Help.ascx" %>
<%@ Register TagPrefix="dnn" TagName="PRIVACY" Src="~/Admin/Skins/Privacy.ascx" %>
<%@ Register TagPrefix="dnn" TagName="TERMS" Src="~/Admin/Skins/Terms.ascx" %>
<%@ Register TagPrefix="dnn" TagName="HOSTNAME" Src="~/Admin/Skins/HostName.ascx" %>
<%@ Register TagPrefix="dnn" TagName="STYLES" Src="~/Admin/Skins/Styles.ascx" %>
<%@ Register TagPrefix="dnn" TagName="DOTNETNUKE" Src="~/Admin/Skins/DotNetNuke.ascx" %>
<%@ Register TagPrefix="dnn" Namespace="DotNetNuke.Web.Client.ClientResourceManagement" Assembly="DotNetNuke.Web.Client" %>
<%@ Register TagPrefix="Adammer" Namespace="Adammer.DNN.Skins" Assembly = "Adammer.DNN.NavMenu" %>

<dnn:STYLES runat="server" ID="IE8" Name="IE8Minus" StyleSheet="Charcool_FullWidth_ie.css" Condition="LT IE 9" UseSkinPath="true"/>
<div id="greytnessCharcool">
	<div class="topBar clearfix"><!-- spacer -->
		<dnn:Language runat="server" id="dnnLanguage" ShowMenu="False" ShowLinks="True" />
	</div>
</div>
<div class="headerDiv clearfix">
	<div class="header clearfix">
		<div class="dnnLogo">
			<dnn:LOGO runat="server" id="dnnLOGO" />
		</div>
		<div class="menu">
			<Adammer:NavMenu id="charcoolNav" DisplayIcon="False" Level="0-3" Type="Hover" runat="server" ExcludeTabs="Admin,Host" CacheTabs="False" />
		</div>
	</div>
</div>
<div id="BannerPane" class="bannerPane" runat="server"></div>
<div class="pageTitleDiv clearfix">
	<div class="pageTitleWidth clearfix">
		<div id="PageTitlePane" class="pageTitlePane" runat="server"></div>
	</div>
</div>
<div class="contentShadow1"><!--shadow--></div>
<div class="contentShadow2"><!--shadow--></div>
<div class="contentShadow3"><!--shadow--></div>
<div class="pageContent clearfix">
	<div class="pageWidth clearfix">
		<div id="TopPane" class="TopPane" runat="server"></div>
		<%--<div id="ContentPane" class="ContentPane ContentPaneDiv" runat="server"></div>--%>
		<div class="subPageContent clearfix">
			<div class="subPageLeftDiv">
				<div class="subPageBottom clearfix">
					<div class="subPageTop clearfix">
						<div id="SubLeftPane" class="subLeftPane" runat="server"></div>
					</div>
				</div>
			</div>
			<div class="subPageContentDiv">
				<div id="SubTopPane" class="subTopPane" runat="server"></div>
				<div id="SubMiddleLeftPane" class="subMiddleLeftPane" runat="server"></div>
				<div id="SubMIddleRightPane" class="subMiddleRightPane" runat="server"></div>
				<div id="SubBottomPane" class="subBottomPane" runat="server"></div>
			</div>
		</div>
		<div id="ContentPane" class="ContentPane ContentPaneDiv" runat="server"></div>
		<div id="TopPaneDiv" class="TopPaneDiv">
			<div id="TopLeftPane" class="TopLeftPane left" runat="server"></div>
			<div id="TopRightPane" class="TopRightPane right" runat="server"></div>
		</div>
		<div id="ContentPane2Div" class="ContentPaneDiv">
			<div id="LeftPane" class="LeftPane left" runat="server"></div>
			<div id="ContentPane2" class="ContentPane2 right" runat="server"></div>
		</div>
		<div id="ContentPaneDiv" class="ContentPaneDiv">
			<div id="ContentPane3" class="ContentPane3 left" runat="server"></div>
			<div id="RightPane" class="RightPane right" runat="server"></div>
		</div>
		<div id="MiddlePaneDiv" class="MiddlePaneDiv">
			<div id="MiddleLeftPane" class="MiddleLeftPane left" runat="server"></div>
			<div id="MiddlePane" class="MiddlePane left" runat="server"></div>
			<div id="MiddleRightPane" class="MiddleRightPane right" runat="server"></div>
		</div>
		<div id="BottomPaneDiv" class="BottomPaneDiv">
			<div id="BottomColumn1" class="BottomColumn1 left" runat="server"></div>
			<div id="BottomColumn2" class="BottomColumn2 left" runat="server"></div>
			<div id="BottomColumn3" class="BottomColumn3 left" runat="server"></div>
			<div id="BottomColumn4" class="BottomColumn4 right" runat="server"></div>
		</div>
		<div id="BottomPane" class="BottomPane" runat="server"></div>
	</div>
</div>
<div class="preFooterDiv"><!--spacer--></div>
<div class="charcoolFooterContentDiv clearfix">
	<div class="charcoolFooterContent">
		<div id="FooterPane" class="FooterPane left" runat="server"></div>
		<div class="Search">
			<dnn:SEARCH runat="server" showweb="False" showsite="False" id="dnnSEARCH" Submit="&lt;img src=&quot;graphics/btn_search_midnight.gif&quot; alt=&quot;Search&quot; class=&quot;btnSearch&quot;/&gt;" CssClass="SearchField" />
		</div>
	</div>
</div>
<div class="charcoolFooterDiv">
	<div class="charcoolFooter">
		<div class="termsdiv">
			<ul>
				<li>
					<dnn:TERMS runat="server" id="dnnTERMS" Text="Terms" CssClass="terms" />
				</li>
				<li>
					<dnn:PRIVACY runat="server" id="dnnPRIVACY"  CssClass="terms" />
				</li>
				<li>
					<dnn:USER runat="server" ID="dnnUSER" CssClass="login" />
				</li>
				<li>
					<dnn:LOGIN runat="server" ID="dnnLOGIN" CssClass="login" />
				</li>
			</ul>
		</div>
		<div class="copyrightdiv">&copy;
			<dnn:CURRENTDATE runat="server" id="dnnCURRENTDATE2" CssClass="copyright" DateFormat="yyyy" />
			<dnn:COPYRIGHT runat="server" id="dnnCOPYRIGHT" CssClass="copyright" />
		</div>
	</div>
	<div class="designBy"><a href="http://skinsbyadammer.com/greytness">Greytness</a> by <a href="http://www.adammer.com/">Adammer</a>&trade;</div>
</div>
<dnn:DnnJsInclude runat="server" FilePath="js/charcool.js" PathNameAlias="SkinPath" />