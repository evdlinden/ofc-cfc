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
<cfcomponent extends="ofc-cfc.lib.chartvalue.Base" output="false">

	<cffunction name="init" access="public" returntype="Struct">
		<cfargument name="startValue" type="numeric" required="false" hint="Bottom value, incase of a horizontal bar, this is the left value">
		<cfargument name="tooltip" type="string" required="false" hint="">
		<cfargument name="color" type="string" required="false" hint="">
		
		<cfscript>
			super.init(argumentCollection=arguments);
			// Bottom?
			if(isDefined('arguments.startValue')){ setStartValue(arguments.startValue);}	
			// Tooltip?
			if(isDefined('arguments.tooltip')){ setTooltip(arguments.tooltip);}	
			// Color?
			if(isDefined('arguments.color')){ setColor(arguments.color);}	

			return this;
		</cfscript>		
	</cffunction>

	<cffunction name="setStartValue" access="public" returntype="void">
		<cfargument name="startValue" type="numeric" required="true" hint="Bottom value, incase of a horizontal bar, this is the left value">
		<cfset this.startValue = arguments.startValue>		
	</cffunction>

	<cffunction name="getStartValue" access="public" returntype="numeric" hint="Bottom value, incase of a horizontal bar, this is the left value">
		<cfreturn this.startValue>
	</cffunction>

	<cffunction name="setColor" access="public" returntype="void">
		<cfargument name="Color" type="string" required="true" hint="e.g. HTML color">
		<cfset this.color = arguments.color>		
	</cffunction>

	<cffunction name="getColor" access="public" returntype="string" hint="Returns color">
		<cfreturn this.color>
	</cffunction>	 
	
	<cffunction name="setTooltip" access="public" returntype="void">
		<cfargument name="tooltip" type="String" required="true" hint="">
		<cfset this.tooltip = arguments.tooltip>		
	</cffunction>

	<cffunction name="getTooltip" access="public" returntype="Any" hint="Returns tooltip">
		<cfreturn this.tooltip>
	</cffunction>
	
	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = super.getSWFData()>
		
		<!--- Top? --->
		<cfif isDefined("this.value")>
			<cfset data.top = this.value>
			<!--- delete super data key --->			
			<cfset StructDelete(data, 'value')>
		</cfif>
		<!--- bottom? --->
		<cfif isDefined("this.startValue")>
			<cfset data.bottom = this.startValue>
		</cfif>
		<!--- color? --->
		<cfif isDefined("this.color")>
			<cfset data.colour = this.color>
		</cfif>
		<!--- tooltip? --->
		<cfif isDefined("this.tooltip")>
			<cfset data.tip = this.tooltip>
		</cfif>

		<cfreturn data>
	</cffunction>	
</cfcomponent>