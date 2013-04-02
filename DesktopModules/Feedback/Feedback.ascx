<%@ Control Language="vb" AutoEventWireup="false" Explicit="True" Codebehind="Feedback.ascx.vb" Inherits="DotNetNuke.Modules.Feedback.Feedback" %>
<%@ Register TagPrefix="dnn" Assembly="DotNetNuke.Web" Namespace="DotNetNuke.Web.UI.WebControls" %>

<div id="divFeedbackForm" runat="server"> 
    <div id="divFeedbackFormContent" runat="server">
        <div id="divInstructions" runat="server" class="dnnFormItem dnnFormHelp">
            <p class="dnnFormRequired"><span><%=LocalizeString("lblRequiredFields")%></span></p>
        </div>
        <asp:ValidationSummary ID="valSummary" runat="server" CssClass="dnnFormMessage dnnFormValidationSummary"
        EnableClientScript="true" DisplayMode="List" />
        <h2 id="h2ContactInfo" runat="server" class="dnnFormSectionHead"><%=LocalizeString("plContactInfo")%></h2>
        <fieldset>
            <div id="divEmail" runat="server" class="Feedback_Field">
		          <div class="dnnFormItem">
        		    <asp:label id="plEmail" runat="server" associatedcontrolid="txtEmail"  resourcekey="plEmail"/>
	                <asp:TextBox id="txtEmail" runat="server"  maxlength="256"/>
    	            <asp:requiredfieldvalidator id="valEmail1" runat="server" cssclass="dnnFormMessage dnnFormError" Display="Dynamic" errormessage="Email is required." 
   				        controltovalidate="txtEmail" InitialValue="" Enabled="false" resourcekey="valEmail1.Error"></asp:requiredfieldvalidator>
			        <asp:regularexpressionvalidator id="valEmail2" runat="server" cssclass="dnnFormMessage dnnFormError" display="Dynamic" errormessage="Email must be valid."
				        controltovalidate="txtEmail" resourcekey="valEmail2.Error" validationexpression="\b[a-zA-Z0-9._%\-+']+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,4}\b"></asp:regularexpressionvalidator>
	              </div>
	        </div>
            <div id="divEmailConfirm" runat="server" class="Feedback_Field">
		          <div class="dnnFormItem">
        		    <asp:label id="plEmailConfirm" runat="server" associatedcontrolid="txtEmailConfirm"  resourcekey="plEmailConfirm"/>
	                <asp:TextBox id="txtEmailConfirm" runat="server"  maxlength="256"/>
    	            <asp:requiredfieldvalidator id="valEmailConfirm" runat="server" cssclass="dnnFormMessage dnnFormError" Display="Dynamic" errormessage="Emails are different." 
   				        controltovalidate="txtEmailConfirm" InitialValue="" Enabled="false" resourcekey="valEnmailConfirm.Error"></asp:requiredfieldvalidator>
    	            <asp:comparevalidator id="valEmailConfirm2" runat="server" cssclass="dnnFormMessage dnnFormError" Display="Dynamic" errormessage="Emails are different." 
   				        controltovalidate="txtEmailConfirm" controltocompare="txtEmail" resourcekey="valEmailConfirm.Error"></asp:comparevalidator>
	              </div>
	        </div>
	        <div id="divName" runat="server" visible="false" class="Feedback_Field">
		          <div class="dnnFormItem">
			        <asp:label id="plName" runat="server" associatedcontrolid="txtName" resourcekey="plName" />
			        <asp:textbox id="txtName" runat="server"  maxlength="200" ></asp:textbox>
			        <asp:requiredfieldvalidator id="valName" runat="server" cssclass="dnnFormMessage dnnFormError" display="Dynamic" errormessage="Name is required."
				        controltovalidate="txtName" InitialValue="" Enabled="false" resourcekey="valName.Error"></asp:requiredfieldvalidator>
		          </div>
	        </div>
	        <div id="divStreet" runat="server" visible="false" class="Feedback_Field">
		          <div class="dnnFormItem">
			        <asp:label id="plStreet" runat="server" associatedcontrolid="txtStreet" resourcekey="plStreet" />
			        <asp:textbox id="txtStreet" runat="server" maxlength="50" ></asp:textbox>
			        <asp:requiredfieldvalidator id="valStreet" runat="server" cssclass="dnnFormMessage dnnFormError" display="Dynamic" errormessage="Street is required."
				        controltovalidate="txtStreet" InitialValue="" Enabled="false" resourcekey="valStreet.Error"></asp:requiredfieldvalidator>
		          </div>
	        </div>
	        <div id="divCity" runat="server" visible="false" class="Feedback_Field">
		          <div class="dnnFormItem">
			        <asp:label id="plCity" runat="server" associatedcontrolid="txtCity" resourcekey="plCity" />
			        <asp:textbox id="txtCity" runat="server" maxlength="35" ></asp:textbox>
			        <asp:requiredfieldvalidator id="valCity" runat="server" cssclass="dnnFormMessage dnnFormError" display="Dynamic" errormessage="City is required."
				        controltovalidate="txtCity" InitialValue="" Enabled="false" resourcekey="valCity.Error"></asp:requiredfieldvalidator>
		        </div>
	        </div>
	        <div id="divRegion" runat="server" visible="false" class="Feedback_Field">
		          <div class="dnnFormItem">
			        <asp:label id="plRegion" runat="server" associatedcontrolid="txtRegion" resourcekey="plRegion" />
			        <asp:textbox id="txtRegion" runat="server" maxlength="35" ></asp:textbox>
			        <asp:requiredfieldvalidator id="valRegion" runat="server" cssclass="dnnFormMessage dnnFormError" display="Dynamic" errormessage="Region is required."
				        controltovalidate="txtRegion" InitialValue="" Enabled="false" resourcekey="valRegion.Error"></asp:requiredfieldvalidator>
		        </div>
	        </div>
	        <div id="divCountry" runat="server" visible="false" class="Feedback_Field">
		          <div class="dnnFormItem">
			        <asp:label id="plCountry" runat="server" associatedcontrolid="txtCountry" resourcekey="plCountry" />
			        <asp:textbox id="txtCountry" runat="server" maxlength="35" ></asp:textbox>
			        <asp:requiredfieldvalidator id="valCountry" runat="server" cssclass="dnnFormMessage dnnFormError" display="Dynamic" errormessage="Country is required."
				        controltovalidate="txtCountry" InitialValue="" Enabled="false" resourcekey="valCountry.Error"></asp:requiredfieldvalidator>
		        </div>
	        </div>
	        <div id="divPostalCode" runat="server" visible="false" class="Feedback_Field">
		          <div class="dnnFormItem">
			        <asp:label id="plPostalCode" runat="server" associatedcontrolid="txtPostalCode" resourcekey="plPostalCode" />
			        <asp:textbox id="txtPostalCode" runat="server" maxlength="35" ></asp:textbox>
			        <asp:requiredfieldvalidator id="valPostalCode" runat="server" cssclass="dnnFormMessage dnnFormError" display="Dynamic" errormessage="Postal Code is required."
				        controltovalidate="txtPostalCode" InitialValue="" Enabled="false" resourcekey="valPostalCode.Error"></asp:requiredfieldvalidator>
				    <asp:regularexpressionvalidator id="valPostalCode2" runat="server" cssclass="dnnFormMessage dnnFormError" display="Dynamic" errormessage="Postal Code must be valid."
				        controltovalidate="txtPostalCode" resourcekey="valPostalCode2.Error"></asp:regularexpressionvalidator>    	
		        </div>
	        </div>
	        <div id="divTelephone" runat="server" visible="false" class="Feedback_Field">
		          <div class="dnnFormItem">
			        <asp:label id="plTelephone" runat="server" associatedcontrolid="txtTelephone" resourcekey="plTelephone" />
			        <asp:textbox id="txtTelephone" runat="server" maxlength="16" ></asp:textbox>
			        <asp:requiredfieldvalidator id="valTelephone" runat="server" cssclass="dnnFormMessage dnnFormError" display="Dynamic" errormessage="Telephone is required."
				        controltovalidate="txtTelephone" InitialValue="" Enabled="false" resourcekey="valTelephone.Error"></asp:requiredfieldvalidator>
			        <asp:regularexpressionvalidator id="valTelephone2" runat="server" cssclass="dnnFormMessage dnnFormError" display="Dynamic" errormessage="Telephone Must be Valid."
				        controltovalidate="txtTelephone" resourcekey="valTelephone2.Error"></asp:regularexpressionvalidator>
		        </div>
	        </div>
        </fieldset>
        <h2 id="h2Feedback" runat="server" class="dnnFormSectionHead"><%=LocalizeString("plFeedback")%></h2>
        <fieldset>
            <div id="divCategory" runat="Server" class="Feedback_Field">
		          <div class="dnnFormItem">
			        <asp:label id="plCategory" runat="server" associatedcontrolid="cboCategory" resourcekey="plCategory" />
			        <asp:DropDownList id="cboCategory" runat="server" Cssclass="NormalTextBox" ></asp:DropDownList>
			        <asp:RequiredFieldValidator ID="valCategory" runat="server" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ErrorMessage="Please select a category"
			           ControlToValidate="cboCategory" InitialValue="" Enabled="false" resourceKey="valCategory.Error"></asp:RequiredFieldValidator>
		        </div>
	        </div>
            <div id="divSubject" runat="server" class="Feedback_Field">
		          <div class="dnnFormItem">
			        <asp:label id="plSubject" runat="server" associatedcontrolid="cboSubject" resourcekey="plSubject" />
			        <asp:DropDownList id="cboSubject" runat="server" Cssclass="NormalTextBox" ></asp:DropDownList>
			        <asp:RequiredFieldValidator ID="valSubject" runat="server" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ErrorMessage="Please select a subject"
			           ControlToValidate="cboSubject" InitialValue="" Enabled="false" resourceKey="valSubject.Error"></asp:RequiredFieldValidator>
		        </div>
	        </div>
            <div id="divSubject2" runat="server" class="Feedback_Field">
		          <div class="dnnFormItem">
			        <asp:label id="plSubject2" runat="server" associatedcontrolid="txtSubject2" resourcekey="plSubject2" />
			        <asp:textbox id="txtSubject2" runat="server" maxlength="200" ></asp:textbox>
			        <asp:RequiredFieldValidator ID="valSubject2" runat="server" CssClass="dnnFormMessage dnnFormError" Display="Dynamic" ErrorMessage="Subject is required"
			           ControlToValidate="txtSubject2" InitialValue="" resourceKey="valSubject2.Error"></asp:RequiredFieldValidator>
		        </div>
	        </div>
            <div id="divMessage" runat="server" class="Feedback_Field">
                <div class="dnnFormItem">
			        <asp:label id="plMessage" runat="server" associatedcontrolid="txtBody" resourcekey="plMessage" />
			        <asp:textbox id="txtBody" runat="server"  textmode="Multiline" rows="10" MaxLength="10" ></asp:textbox>
			        <asp:requiredfieldvalidator id="valMessage" runat="server" cssclass="dnnFormMessage dnnFormError" display="Dynamic" errormessage="Message is required"
				        controltovalidate="txtBody" InitialValue="" Enabled="false" resourcekey="valBody.Error"></asp:requiredfieldvalidator>
                    <asp:RegularExpressionValidator ID="valMessageLength" runat="server" cssclass="dnnFormMessage dnnFormError" display="Dynamic" ControlToValidate="txtBody" ValidationExpression="^[\s\S]{0,50}$"
                        ErrorMessage="Max message length exceeded" > </asp:RegularExpressionValidator>
			    </div>
		        <div class="dnnFormItem Feedback_CharCount">
			        <asp:label id="plCharCount" runat="server" associatedcontrolid="CharCount"  />
                    <asp:label id="CharCount" runat="server" />
                </div>
            </div>
        </fieldset>
        <div id="divFooter" runat="server" class="Feedback_FooterBlock">
	        <div id="divCopy" runat="server">
		         <div class="dnnFormItem">
                    <asp:label id="plCopy" runat="server" associatedcontrolid="chkCopy" resourcekey="plCopy"></asp:label>
			        <asp:CheckBox id="chkCopy" Runat="server" cssclass="normal"></asp:CheckBox>
                    <asp:CustomValidator id="valCopy" runat="server" cssclass="dnnFormMessage dnnFormError" Display="Dynamic"  errormessage="Email is required when send copy ticked."
                        resourcekey="valCopy.Error" ></asp:CustomValidator>
		         </div>
	        </div>
	        <div id="divCaptcha" runat="server">
                <div class="dnnFormItem">
                    <dnn:dnnCaptcha ID="ctlCaptcha" runat="server" EnableRefreshImage="True" Width="300px" CaptchaImage-AudioFilesPath="~/DesktopModules/Feedback/App_Data/RadCaptcha" />
                </div>
	        </div>
        </div>
        <ul class="dnnActions dnnClear">
            <li><asp:linkbutton id="cmdSend" resourcekey="cmdSend" runat="server" cssclass="dnnPrimaryAction" >Send Feedback</asp:linkbutton></li>
        </ul> 
    </div>   
    <div id="divConfirmation" runat="server" class="Feedback_Confirmation" Visible="False">
        <div id="divResponseMessage" runat="server">
            <asp:label id="lblMessage" runat="server"></asp:label>
        </div> 
        <ul class="dnnActions dnnClear">
            <li><asp:linkbutton id="cmdCancel" resourcekey="cmdCancel" runat="server" cssclass="dnnPrimaryAction" CausesValidation="False">Cancel</asp:linkbutton></li>
        </ul> 
    </div>
</div>

<script type="text/javascript" language="javascript">
    function showchars(txt1, l1, maxmessage) {
        document.getElementById(l1).innerHTML = maxmessage - document.getElementById(txt1).value.length;
    }
</script>