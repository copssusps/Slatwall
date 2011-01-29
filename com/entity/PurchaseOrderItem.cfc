component displayname="Purchase Order Item" entityname="SlatwallPurchaseOrderItem" table="SlatwallPurchaseOrderItem" persistent="true" accessors="true" output="false" extends="slatwall.com.entity.BaseEntity" {
	
	// Persistant Properties
	property name="purchaseOrderItemID" type="numeric" ormtype="integer" fieldtype="id" generator="identity" unsavedvalue="0" default="0";
	property name="quantityOrdered" type="string" persistent="true";
	property name="quantityReceived" type="string" persistent="true";
	property name="estimatedArrivalDateTime" type="date" persistent="true";
	
	// Related Object Properties
	property name="purchaseOrder" cfc="PurchaseOrder" fieldtype="many-to-one" fkcolumn="purchaseOrderID";
	property name="stock" cfc="Stock" fieldtype="many-to-one" fkcolumn="stockID";
}