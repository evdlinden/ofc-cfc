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
<cfcomponent output="false" extends="ofc-cfc.lib.chart.Base">

	<cffunction name="init" access="public" returntype="Struct">
		<cfargument name="fontSize" type="numeric" required="false" hint="">
		<cfargument name="color" type="string" required="false" hint="">
		<cfargument name="dotSize" type="numeric" required="false" hint="">
		<cfargument name="width" type="numeric" required="false" hint="">
		
		<cfscript>
			super.init(argumentCollection=arguments);
			// FontSize?
			if(isDefined('arguments.fontSize')){ setFontSize(arguments.fontSize);}	
			// Tooltip?
			if(isDefined('arguments.tooltip')){ setTooltip(arguments.tooltip);}	
			// Color?
			if(isDefined('arguments.color')){ setColor(arguments.color);}	
			// DotSize?
			if(isDefined('arguments.dotSize')){ setDotSize(arguments.dotSize);}	
			// Width?
			if(isDefined('arguments.width')){ setWidth(arguments.width);}	
			
			return this;
		</cfscript>				
	</cffunction>

	<cffunction name="setDotSize" access="public" returntype="void">
		<cfargument name="size" type="numeric" required="true" hint="">
		<cfset this.dotSize = arguments.size>		
	</cffunction>

	<cffunction name="getDotSize" access="public" returntype="numeric" hint="Returns dotSize">
		<cfreturn this.dotSize>
	</cffunction>

	<cffunction name="setWidth" access="public" returntype="void">
		<cfargument name="width" type="numeric" required="true" hint="">
		<cfset this.width = arguments.width>		
	</cffunction>

	<cffunction name="getWidth" access="public" returntype="numeric" hint="Returns width">
		<cfreturn this.width>
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
		
		<!--- set type --->
		<cfset data.type = 'scatter'>

		<!--- dotSize? --->
		<cfif isDefined("this.dotSize")>
			<cfset data['dot-size'] = this.dotSize>
		</cfif>

		<!--- width? --->
		<cfif isDefined("this.width")>
			<cfset data.width = this.width>
		</cfif>
				
		<!--- fontSize? --->
		<cfif isDefined("this.fontSize")>
			<cfset data['font-size']= this.fontSize>
		</cfif>
			
		<cfreturn data>
	</cffunction>	
</cfcomponent>