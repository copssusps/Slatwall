/*

    Slatwall - An e-commerce plugin for Mura CMS
    Copyright (C) 2011 ten24, LLC

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
    
    Linking this library statically or dynamically with other modules is
    making a combined work based on this library.  Thus, the terms and
    conditions of the GNU General Public License cover the whole
    combination.
 
    As a special exception, the copyright holders of this library give you
    permission to link this library with independent modules to produce an
    executable, regardless of the license terms of these independent
    modules, and to copy and distribute the resulting executable under
    terms of your choice, provided that you also meet, for each linked
    independent module, the terms and conditions of the license of that
    module.  An independent module is a module which is not derived from
    or based on this library.  If you modify this library, you may extend
    this exception to your version of the library, but you are not
    obligated to do so.  If you do not wish to do so, delete this
    exception statement from your version.

Notes:

*/
component extends="Slatwall.com.service.BaseService" persistent="false" accessors="true" output="false" {
	
	public numeric function roundValueByRoundingRule(required any value, required any roundingRule) {
		
		var inputValue = numberFormat(arguments.value, "0.00");
		var returnValue = javaCast("null", "");
		var returnDelta = javaCast("null", "");
		
		for(var i=1; i<=listLen(arguments.roundingRule.getRoundingRuleExpression()); i++) {
			var rr = listGetAt(arguments.roundingRule.getRoundingRuleExpression(), i);
			var rrPower = 1 * (10 ^ (len(rr)-3));
			
			if(len(inputValue) > len(rr)) {
				var valueOptionOne = left(inputValue,len(inputValue)-len(rr)) & rr;
				
				if(valueOptionOne > inputValue) {
					var lowerValue = inputValue - rrPower;
					var valueOptionTwo = left(lowerValue,len(inputValue)-len(rr)) & rr;
				} else {
					var higherValue = inputValue + rrPower;
					var valueOptionTwo = left(higherValue,len(inputValue)-len(rr)) & rr;
				}
			} else {
				var valueOptionOne = rr;
				var valueOptionTwo = rr;
			}
			
			if(valueOptionOne == inputValue || valueOptionTwo == inputValue) {
				return inputValue;
			} else {
				var valueOptionOneDelta = inputValue - valueOptionOne;
				if(valueOptionOneDelta < 0) {
					valueOptionOneDelta = valueOptionOneDelta*-1;
				}
				var valueOptionTwoDelta = inputValue - valueOptionTwo;
				if(valueOptionTwoDelta < 0) {
					valueOptionTwoDelta = valueOptionTwoDelta*-1;
				}
				
				switch(arguments.roundingRule.getRoundingRuleDirection()) {
					case "Closest": {
						if(isNull(returnDelta) || valueOptionOneDelta < returnDelta ) {
							returnValue = valueOptionOne;
							returnDelta = valueOptionOneDelta;
						}
						if (isNull(returnDelta) || valueOptionTwoDelta < returnDelta ) {
							returnValue = valueOptionTwo;
							returnDelta = valueOptionTwoDelta;
						}
						break;
					}
					case "Up": {
						if( valueOptionOne > inputValue && (isNull(returnDelta) || valueOptionOneDelta < returnDelta) )  {
							returnValue = valueOptionOne;
							returnDelta = valueOptionOneDelta;
						}
						if ( valueOptionTwo > inputValue && (isNull(returnDelta) || valueOptionTwoDelta < returnDelta) ) {
							returnValue = valueOptionTwo;
							returnDelta = valueOptionTwoDelta;
						}
						break;
					}
					case "Down": {
						if( valueOptionOne < inputValue && (isNull(returnDelta) || valueOptionOneDelta < returnDelta) ) {
							returnValue = valueOptionOne;
							returnDelta = valueOptionOneDelta;
						}
						if ( valueOptionTwo < inputValue && (isNull(returnDelta) || valueOptionTwoDelta < returnDelta) ) {
							returnValue = valueOptionTwo;
							returnDelta = valueOptionTwoDelta;
						}
						break;
					}
				}
			}
		}
		
		if(!isNull(returnValue)) {
			return returnValue;
		} else {
			return inputValue;	
		}
	}
	
}
