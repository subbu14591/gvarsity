<%@ Control Language="vb" AutoEventWireup="false" Codebehind="EventEditLocations.ascx.vb" Inherits="DotNetNuke.Modules.Events.EventEditLocations" %>
<%@ Register Src="~/controls/LabelControl.ascx" TagName="Label" TagPrefix="dnn" %>
<%@ Register Assembly="DotNetNuke" Namespace="DotNetNuke.UI.WebControls" TagPrefix="dnn" %>
<asp:Panel ID="pnlEventsModuleLocations" runat="server">
<div class="dnnForm EventEditLocations">
    <div style="width:50%;float:left">
        <div class="dnnFormItem">
            <dnn:Label ID="lblLocationCap" runat="server" CssClass="SubHead" ResourceKey="plLocation" Text="Location"></dnn:Label>
            <asp:TextBox ID="txtLocationName" runat="server" CssClass="NormalTextBox" Width="200px"></asp:TextBox>
            <asp:RequiredFieldValidator id="valRequiredName" runat="server" cssclass="dnnFormMessage dnnFormError" resourcekey="valRequiredName" ControlToValidate="txtLocationName" ValidationGroup="EventEditLocation"></asp:RequiredFieldValidator>
        </div>
        <div class="dnnFormItem">
            <dnn:Label ID="lblMapURLCap" runat="server" CssClass="SubHead" ResourceKey="plMapURL" Text="Map URL" />
            <asp:TextBox ID="txtMapURL" runat="server" CssClass="NormalTextBox" Width="200px"></asp:TextBox>
        </div>
        <ul class="dnnActions dnnClear">
            <li><asp:LinkButton ID="cmdAdd" runat="server" CssClass="dnnPrimaryAction" resourcekey="cmdAdd" ValidationGroup="EventEditLocation" /></li>
            <li><asp:LinkButton ID="cmdUpdate" runat="server" CssClass="dnnSecondaryAction" resourcekey="cmdUpdate" Visible="false" ValidationGroup="EventEditLocation" /></li>
            <li><asp:LinkButton ID="returnButton" CssClass="dnnSecondaryAction" runat="server" resourcekey="returnButton" CausesValidation="False" /></li>
        </ul>
    </div>
    <div style="width:50%;float:left">
        <asp:DataGrid ID="GrdLocations" runat="server" AutoGenerateColumns="False" BorderStyle="Outset" BorderWidth="1px" CssClass="Normal"
            DataKeyField="Location" GridLines="Horizontal" OnDeleteCommand="GrdLocations_DeleteCommand" OnItemCommand="GrdLocations_ItemCommand"
            Width="250px">
            <EditItemStyle VerticalAlign="Bottom"></EditItemStyle>
            <AlternatingItemStyle BackColor="WhiteSmoke"></AlternatingItemStyle>
            <ItemStyle VerticalAlign="Top"></ItemStyle>
            <HeaderStyle Font-Bold="True" BackColor="Silver"></HeaderStyle>
            <Columns>
                <asp:TemplateColumn>
                    <ItemStyle HorizontalAlign="Left"></ItemStyle>
                    <ItemTemplate>
                        <asp:ImageButton ID="DeleteButton" runat="server" IconKey="Delete" CommandArgument="Delete" CommandName="Delete" AlternateText="Delete" resourcekey="DeleteButton"
                            CausesValidation="false" ></asp:ImageButton>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn Visible="False" HeaderText="PortalID">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text="<%# Container.DataItem.PortalID.ToString %>">
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn Visible="False" HeaderText="Location">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# Container.DataItem.Location.ToString %>">
                        </asp:Label>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Location Name">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkLocationName" CommandName="Select" CommandArgument="Select" Text="<%# Container.DataItem.LocationName %>"
                            runat="server">
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateColumn>
                <asp:TemplateColumn HeaderText="Map URL">
                    <ItemTemplate>
                        <asp:HyperLink ID="lnkMapURL" Target="_blank" NavigateUrl="<%# Container.DataItem.MapURL.ToString() %>" runat="server">
								<%# Container.DataItem.MapURL.ToString() %>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateColumn>
            </Columns>
        </asp:DataGrid>
        <asp:Label ID="lblEditMessage" CssClass="SubHead" runat="server" resourcekey="lblEditMessage">(Select Item Link to Edit)</asp:Label>
    </div>
</div>
</asp:Panel>