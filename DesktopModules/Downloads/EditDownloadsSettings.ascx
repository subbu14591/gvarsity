<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EditDownloadsSettings.ascx.cs" Inherits="DotNetNuke.Modules.Downloads.EditDownloadsSettings" %>
<%@ Register TagPrefix="dnn" TagName="URL" Src="~/controls/URLControl.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/LabelControl.ascx" %>

<fieldset>

  <div class="dnnFormItem">
    <dnn:Label id="plRequestType" runat="server" controlname="cbo_RequestType" />
    <asp:RadioButtonList ID="cbo_RequestType" CssClass="dnnFormRadioButtons" runat="server" RepeatLayout="Table">
      <asp:ListItem resourcekey="RequestTypeVirtual" Value="Virtuelles Verzeichniss" />
      <asp:ListItem resourcekey="RequestTypeHttp" Value="Http-Stream" />
    </asp:RadioButtonList>
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plInternalPath" runat="server" controlname="edi_InternalPath" />
    <asp:TextBox ID="edi_InternalPath" runat="server" />
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plPublicUrl" runat="server" controlname="edi_PublicUrl" />
    <asp:TextBox ID="edi_PublicUrl" runat="server" />
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plImageUrl" runat="server" controlname="edi_ImageUrl" />
    <asp:TextBox ID="edi_ImageUrl" runat="server" />
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plSupportedLanguages" runat="server" controlname="edi_SupportedLanguages" />
    <asp:TextBox ID="edi_SupportedLanguages" runat="server" />
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plUseDefaultLink" runat="server" controlname="ckb_UseDefaultLink" />
    <asp:CheckBox ID="ckb_UseDefaultLink" runat="server" />
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plUseTitleLink" runat="server" controlname="ckb_UseTitleLink" />
    <asp:CheckBox ID="ckb_UseTitleLink" runat="server" />
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plSupportedExtensions" runat="server" controlname="edi_SupportedExtensions" />
    <asp:TextBox ID="edi_SupportedExtensions" runat="server" />
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plDownloadTarget" runat="server" controlname="edi_DownloadTarget" />
    <asp:TextBox ID="edi_DownloadTarget" runat="server" />
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plOpenLevel" runat="server" controlname="cbo_RequestType" />
      <asp:RadioButtonList ID="cbo_OpenLevel" runat="server" CssClass="dnnFormRadioButtons" RepeatLayout="Table" RepeatDirection="Vertical">
        <asp:ListItem resourcekey="OpenLevelClosed" Value="Alle Ebenen geschlossen" />
        <asp:ListItem resourcekey="OpenLevelOpenFirst" Value="Erste Ebenen geöffnet" />
        <asp:ListItem resourcekey="OpenLevelOpenAll" Value="Alle Ebenen geöffnet" />
      </asp:RadioButtonList>
    </div>
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plType" runat="server" controlname="cbo_RequestType" />
    <asp:RadioButtonList ID="cbo_Type" runat="server" CssClass="dnnFormRadioButtons" RepeatLayout="Table">
      <asp:ListItem resourcekey="TypeLanguage" Value="Gruppieren nach Sprachspezifikation" />
      <asp:ListItem resourcekey="TypeExtension" Value="Gruppieren nach Datei-Typ" />
      <asp:ListItem resourcekey="TypeNone" Value="Keine Gruppierung" />
    </asp:RadioButtonList>
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plSuspendUnderlines" runat="server" controlname="ckb_SuspendUnderlines" />
    <asp:CheckBox ID="ckb_SuspendUnderlines" runat="server" />
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plSuspendDate" runat="server" controlname="ckb_SuspendDate" />
    <asp:CheckBox ID="ckb_SuspendDate" runat="server" />
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plUseEncoding" runat="server" controlname="ckb_UseEncoding" />
    <asp:CheckBox ID="ckb_UseEncoding" runat="server" />
  </div>

  <div class="dnnFormItem">
    <dnn:Label id="plLayoutType" runat="server" controlname="cbo_RequestType" />
    <asp:RadioButtonList ID="cbo_LayoutType" runat="server" CssClass="dnnFormRadioButtons" RepeatLayout="Table">
      <asp:ListItem resourcekey="LayoutTypeTitleIcon" Value="Titel - Icon" />
      <asp:ListItem resourcekey="LayoutTypeIconTitle" Value="Icon - Titel" />
    </asp:RadioButtonList>
  </div>

</fieldset>
