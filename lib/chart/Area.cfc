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
<cfcomponent output="false" extends="ofc-cfc.lib.chart.Line">

	<cffunction name="init" access="public" returntype="Struct">
		<cfargument name="fillAlpha" type="numeric" required="false" hint="">
		<cfargument name="fillColor" type="string" required="false" hint="">
		<cfargument name="isLoop" type="boolean" required="false" hint="">
		
		<cfscript>
			super.init(argumentCollection=arguments);
			// FillAlpha?
			if(isDefined('arguments.fillAlpha')){ setFillAlpha(arguments.fillAlpha);}	
			// FillColor?
			if(isDefined('arguments.fillColor')){ setFillColor(arguments.fillColor);}	
			// IsLoop?
			if(isDefined('arguments.isLoop')){ setIsLoop(arguments.isLoop);}	
			return this;
		</cfscript>
	</cffunction>

	<cffunction name="setFillAlpha" access="public" returntype="void">
		<cfargument name="fillAlpha" type="numeric" required="true" hint="">
		<cfset this.fillAlpha = arguments.fillAlpha>		
	</cffunction>

	<cffunction name="getFillAlpha" access="public" returntype="numeric" hint="Returns fillAlpha">
		<cfreturn this.fillAlpha>
	</cffunction>
	
	<cffunction name="setFillColor" access="public" returntype="void">
		<cfargument name="fillColor" type="string" required="true" hint="">
		<cfset this.fillColor = arguments.fillColor>		
	</cffunction>

	<cffunction name="getFillColor" access="public" returntype="string" hint="Returns fillColor">
		<cfreturn this.fillColor>
	</cffunction>
	
	<cffunction name="setIsLoop" access="public" returntype="void">
		<cfargument name="isLoop" type="boolean" required="true" hint="">
		<cfset this.isLoop = arguments.isLoop>		
	</cffunction>

	<cffunction name="getIsLoop" access="public" returntype="boolean" hint="Returns isLoop">
		<cfreturn this.isLoop>
	</cffunction>
	
	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = super.getSWFData()>
		
		<!--- fillAlpha? --->
		<cfif isDefined("this.fillAlpha")>
			<cfset data['fill-alpha'] = this.fillAlpha>
		</cfif>

		<!--- fillColor? --->
		<cfif isDefined("this.fillColor")>
			<cfset data.fill = this.fillColor>
		</cfif>

		<!--- isLoop? --->
		<cfif isDefined("this.isLoop")>
			<cfset data.loop = this.isLoop>
		</cfif>
		
		<cfreturn data>
	</cffunction>	
</cfcomponent>