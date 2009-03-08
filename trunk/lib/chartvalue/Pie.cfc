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
		<cfargument name="label" type="string" required="false" hint="">
		<cfargument name="fontSize" type="numeric" required="false" hint="">
		<cfargument name="labelColor" type="string" required="false" hint="">
		
		<cfscript>
			super.init(argumentCollection=arguments);
			// Label?
			if(isDefined('arguments.label')){ setLabel(arguments.label);}	
			// FontSize?
			if(isDefined('arguments.fontSize')){ setFontSize(arguments.fontSize);}	
			// LabelColor?
			if(isDefined('arguments.labelColor')){ setLabelColor(arguments.labelColor);}	
			return this;
		</cfscript> 		
	</cffunction>

	<cffunction name="setLabel" access="public" returntype="void">
		<cfargument name="label" type="string" required="true" hint="">
		<cfset this.label = arguments.label>		
	</cffunction>

	<cffunction name="getLabel" access="public" returntype="string" hint="Returns label">
		<cfreturn this.label>
	</cffunction>
	
	<cffunction name="setLabelColor" access="public" returntype="void">
		<cfargument name="labelColor" type="string" required="true" hint="">
		<cfset this.labelColor = arguments.labelColor>		
	</cffunction>

	<cffunction name="getLabelColor" access="public" returntype="string" hint="Returns labelColor">
		<cfreturn this.labelColor>
	</cffunction>
	
	<cffunction name="setFontSize" access="public" returntype="void">
		<cfargument name="fontSize" type="numeric" required="true" hint="">
		<cfset this.fontSize = arguments.fontSize>		
	</cffunction>

	<cffunction name="getFontSize" access="public" returntype="numeric" hint="Returns fontSize">
		<cfreturn this.fontSize>
	</cffunction>
						
	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = super.getSWFData()>
		
		<!--- label? --->
		<cfif isDefined("this.label")>
			<cfset data['label']= this.label>
		</cfif>
		
		<!--- labelColor? --->
		<cfif isDefined("this.labelColor")>
			<cfset data['label-colour']= this.labelColor>
		</cfif>
				
		<!--- fontSize? --->
		<cfif isDefined("this.fontSize")>
			<cfset data['font-size']= this.fontSize>
		</cfif>

		<cfreturn data>
	</cffunction>	
</cfcomponent>