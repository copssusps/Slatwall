<cfoutput>
	
<script language="JavaScript">
	priceGroupData = #rc.priceGroupDataJSON#;	
</script>
<!--- These are DIVs used by the modal dialog for the SKUs price grid. We can't put this into skus.cfm since we need to avoid nested forms. --->
<div id="updatePriceGroupSKUSettingsDialog" class="ui-helper-hidden dialog" title="#rc.$.Slatwall.rbKey('admin.product.pricegroupskuupdatedialog.title')#">
	<form action="#buildURL('admin:product.updatePriceGroupSKUSettings')#" method="post">
		<!---<input type="hidden" id="updatePriceGroupSKUSettingsForm_priceGroupId" name="priceGroupId">--->
		<!---<input type="hidden" id="updatePriceGroupSKUSettingsForm_skuId" name="skuId">--->
		
		<strong>#rc.$.Slatwall.rbKey('admin.product.pricegroupskuupdatedialog.groupname')#: </strong> 
		<span id="updatePriceGroupSKUSettings_GroupName"></span>
	
		<p>#rc.$.Slatwall.rbKey('admin.product.pricegroupskuupdatedialog.selectrate')#:</p>
		
		<p class="ui-helper-hidden">No rates were defined for this price group.</p>
					
		<select name="priceGroupRateId" id="updatePriceGroupSKUSettings_PriceGroupRateId">
			<!---<cfloop array="#local.thisPriceGroup.getPriceGroupRates()#" index="local.thisPriceGroupRate">
				<option value="#local.thisPriceGroupRate.getPriceGroupRateId()#">#local.thisPriceGroupRate.getAmountRepresentation()#</option>
			</cfloop>--->	
			<option value="new amount">New Amount</option>	
		</select>
				
				
		<div id="updatePriceGroupSKUSettings_newAmount" class="ui-helper-hidden">
			<p>#rc.$.Slatwall.rbKey('admin.product.pricegroupskuupdatedialog.newamount')#: $<input type="text" name="newAmount"></p>
		</div>

	</form>
</div>
</cfoutput>