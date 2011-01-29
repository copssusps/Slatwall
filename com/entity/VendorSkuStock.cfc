component displayname="Vendor Sku Stock" entityname="SlatwallVendorSkuStock" table="SlatwallVendorSkuStock" persistent=true accessors=true output=false extends="slatwall.com.entity.BaseEntity" {
	
	// Persistant Properties
	property name="vendorSkuStockID" type="numeric" ormtype="integer" fieldtype="id" generator="identity" unsavedvalue="0" default="0";
	property name="cost" type="numeric";
	property name="quantity" type="numeric";
	property name="availableDateTime" type="date";
	property name="lastUpdatedDateTime" type="date";
	
	// Related Object Properties
	property name="sku" cfc="Sku" fieldtype="many-to-one" fkcolumn="skuID";
	property name="vendor" cfc="Vendor" fieldtype="many-to-one" fkcolumn="vendorID";	
}