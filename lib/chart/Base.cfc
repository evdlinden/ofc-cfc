<!--- 
Copyright 2009 Ernst van der Linden

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Author 	 	: Ernst van der Linden [ http://evdlinden.behindthe.net ]
Date     	: 8/3/2009
		
Modification History:
--->
<cfcomponent output="false">

	<cffunction name="init" access="public" returntype="Struct">
		<cfargument name="keyText" type="any" required="false">
		<cfargument name="tooltip" type="string" required="false" hint="">
		<cfargument name="color" type="string" required="false" hint="">
		<cfargument name="values" type="array" required="false" hint="">
		<cfargument name="onClick" type="string" required="false" hint="">
		
		<cfscript>
			// KeyText?
			if(isDefined('arguments.keyText')){ setKeyText(arguments.keyText);}	
			// Tooltip?
			if(isDefined('arguments.tooltip')){ setTooltip(arguments.tooltip);}	
			// Color?
			if(isDefined('arguments.color')){ setColor(arguments.color);}	
			// Values?
			if(isDefined('arguments.values')){ 
				setValues(arguments.values);
			} else {
				setValues(ArrayNew(1));
			}	
			// OnClick?
			if(isDefined('arguments.onClick')){ setOnClick(arguments.onClick);}	
			
			return this;
		</cfscript>			
	</cffunction>

	<cffunction name="addValue" access="public" returntype="void">
		<cfargument name="value" type="Any" required="true" hint="Adds a simple value or value object to collection">
		<cfset ArrayAppend(this.values,arguments.value)>
	</cffunction>

	<cffunction name="setValues" access="public" returntype="void" hint="">
		<cfargument name="values" type="Any" required="true" hint="Array containing simple values or value objects">
		<cfset this.values = arguments.values>
	</cffunction>
	
	<cffunction name="getValues" access="public" output="false" returntype="any" hint="">
	   <cfreturn this.values>
	</cffunction>

	<cffunction name="setColor" access="public" returntype="void">
		<cfargument name="Color" type="string" required="true" hint="">
		<cfset this.color = arguments.color>		
	</cffunction>

	<cffunction name="getColor" access="public" returntype="string" hint="Returns Color">
		<cfreturn this.color>
	</cffunction>	 

	<cffunction name="getKeyText" access="public" output="false" returntype="any" hint="">
	   <cfreturn this.keyText>
	</cffunction>

	<cffunction name="setKeyText" access="public" output="false" returntype="void" hint="">
		<cfargument name="keyText" type="any" required="true">
	    <cfset this.keyText = arguments.keyText>
	</cffunction>

	<cffunction name="setTooltip" access="public" returntype="void">
		<cfargument name="tooltip" type="string" required="true" hint="">
		<cfset this.tooltip = arguments.tooltip>		
	</cffunction>

	<cffunction name="getTooltip" access="public" returntype="Any" hint="Returns tooltip">
		<cfreturn this.tooltip>
	</cffunction>
	
	<cffunction name="setOnClick" access="public" returntype="void">
		<cfargument name="onClick" type="string" required="true" hint="">
		<cfset this.onClick = arguments.onClick>		
	</cffunction>

	<cffunction name="getOnClick" access="public" returntype="string" hint="Returns onClick">
		<cfreturn this.onClick>
	</cffunction>
		
	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = StructNew()>

		<!--- keyText? --->
		<cfif isDefined("this.keyText")>
			<cfset structappend(data, this.keyText.getSWFData(),true)>
		</cfif>
		
		<!--- tooltip? --->
		<cfif isDefined("this.tooltip")>
			<cfset data.tip = this.tooltip>
		</cfif>		
				
		<!--- color? --->
		<cfif isDefined("this.color")>
			<cfset data.colour = this.color>
		</cfif>
				
		<!--- onClick? --->
		<cfif isDefined("this.onClick")>
			<cfset data['on-click']= this.onClick>
		</cfif>
						
		<!--- Values --->
		<cfif ArrayLen(this.values)>
			<cfset data.values = ArrayNew(1)>
		
			<!--- Loop all values --->
			<cfloop index="i" from="1" to="#ArrayLen(this.values)#">
				<!--- Item is value object? Get data? --->
				<cfif not isSimpleValue(this.values[i])>
					<cfset ArrayAppend(data.values,this.values[i].getSWFData())>
				<cfelse>
					<cfset ArrayAppend(data.values,this.values[i])>
				</cfif>
			</cfloop>			
		</cfif>
		
		<cfreturn data>
	</cffunction>		
</cfcomponent>