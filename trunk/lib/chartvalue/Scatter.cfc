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
		<cfargument name="x" type="numeric" required="false" hint="">
		<cfargument name="y" type="numeric" required="false" hint="">
		<cfargument name="fontSize" type="numeric" required="false" hint="">
		<cfargument name="dotSize" type="numeric" required="false" hint="">
		<cfargument name="tooltip" type="string" required="false" hint="">
		
		<cfscript>
			super.init(argumentCollection=arguments);
			// X?
			if(isDefined('arguments.x')){ setX(arguments.x);}	
			// Y?
			if(isDefined('arguments.y')){ setY(arguments.y);}	
			// DotSize?
			if(isDefined('arguments.dotSize')){ setDotSize(arguments.dotSize);}	
			// Tooltip?
			if(isDefined('arguments.tooltip')){ setTooltip(arguments.tooltip);}	
			// FontSize?
			if(isDefined('arguments.fontSize')){ setFontSize(arguments.fontSize);}	
			return this;
		</cfscript> 		
	</cffunction>

	<cffunction name="setX" access="public" returntype="void">
		<cfargument name="x" type="numeric" required="true" hint="">
		<cfset this.x = arguments.x>		
	</cffunction>

	<cffunction name="getX" access="public" returntype="numeric" hint="Returns x">
		<cfreturn this.x>
	</cffunction>
	
	<cffunction name="setY" access="public" returntype="void">
		<cfargument name="y" type="numeric" required="true" hint="">
		<cfset this.y = arguments.y>		
	</cffunction>

	<cffunction name="getY" access="public" returntype="numeric" hint="Returns y">
		<cfreturn this.y>
	</cffunction>
	
	<cffunction name="setFontSize" access="public" returntype="void">
		<cfargument name="fontSize" type="numeric" required="true" hint="">
		<cfset this.fontSize = arguments.fontSize>		
	</cffunction>

	<cffunction name="getFontSize" access="public" returntype="numeric" hint="Returns fontSize">
		<cfreturn this.fontSize>
	</cffunction>

	<cffunction name="setDotSize" access="public" returntype="void">
		<cfargument name="size" type="numeric" required="true" hint="">
		<cfset this.dotSize = arguments.size>		
	</cffunction>

	<cffunction name="getDotSize" access="public" returntype="numeric" hint="Returns dotSize">
		<cfreturn this.dotSize>
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
		
		<!--- x? --->
		<cfif isDefined("this.x")>
			<cfset data.x= this.x>
		</cfif>

		<!--- y? --->
		<cfif isDefined("this.y")>
			<cfset data.y= this.y>
		</cfif>
				
		<!--- fontSize? --->
		<cfif isDefined("this.fontSize")>
			<cfset data['font-size']= this.fontSize>
		</cfif>

		<!--- dotSize? --->
		<cfif isDefined("this.dotSize")>
			<cfset data['dot-size']= this.dotSize>
		</cfif>
		
		<!--- tooltip? --->
		<cfif isDefined("this.tooltip")>
			<cfset data.tip = this.tooltip>
		</cfif>
		
		<cfreturn data>
	</cffunction>	
</cfcomponent>