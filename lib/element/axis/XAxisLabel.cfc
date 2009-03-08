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
<cfcomponent output="false" extends="ofc-cfc.lib.element.Base">

	<cffunction name="init" access="public" returntype="Struct">
		<cfargument name="text" type="string" required="false" hint="">
		<cfargument name="color" type="string" required="false" hint="">
		<cfargument name="size" type="numeric" required="false" hint="">
		<cfargument name="rotate" type="numeric" required="false" hint="">
		<cfargument name="isVisible" type="boolean" required="false" hint="">
		
		<cfscript>
			super.init(argumentCollection=arguments);

			// Text?
			if(isDefined('arguments.text')){ setText(arguments.text);}	
			// Color?
			if(isDefined('arguments.color')){ setColor(arguments.color);}	
			// Size?
			if(isDefined('arguments.size')){ setSize(arguments.size);}	
			// Rotate?
			if(isDefined('arguments.rotate')){ setRotate(arguments.rotate);}	
			// IsVisible?
			if(isDefined('arguments.isVisible')){ setIsVisible(arguments.isVisible);}	
			return this;
		</cfscript>
	</cffunction>

	<cffunction name="getText" access="public" output="false" returntype="string" hint="">
	   <cfreturn this.text>
	</cffunction>

	<cffunction name="setText" access="public" output="false" returntype="void" hint="">
		<cfargument name="text" type="string" required="true">
	    <cfset this.text = arguments.text>
	</cffunction>

	<cffunction name="getColor" access="public" output="false" returntype="string" hint="">
	   <cfreturn this.color>
	</cffunction>

	<cffunction name="setColor" access="public" output="false" returntype="void" hint="">
		<cfargument name="color" type="string" required="true">
	    <cfset this.color = arguments.color>
	</cffunction>
	
	<cffunction name="getSize" access="public" output="false" returntype="numeric" hint="">
	   <cfreturn this.size>
	</cffunction>

	<cffunction name="setSize" access="public" output="false" returntype="void" hint="">
		<cfargument name="size" type="numeric" required="true">
	    <cfset this.size = arguments.size>
	</cffunction>
		
	<cffunction name="getRotate" access="public" output="false" returntype="numeric" hint="">
	   <cfreturn this.rotate>
	</cffunction>

	<cffunction name="setRotate" access="public" output="false" returntype="void" hint="">
		<cfargument name="rotate" type="numeric" required="true">
	    <cfset this.rotate = arguments.rotate>
	</cffunction>
			
	<cffunction name="getIsVisible" access="public" output="false" returntype="boolean" hint="">
	   <cfreturn this.isVisible>
	</cffunction>

	<cffunction name="setIsVisible" access="public" output="false" returntype="void" hint="">
		<cfargument name="isVisible" type="boolean" required="true">
	    <cfset this.isVisible = arguments.isVisible>
	</cffunction>
				
	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = StructNew()>

		<!--- Text? --->
		<cfif isDefined("this.text")>
			<cfset data.text = this.text>
		</cfif>	

		<!--- Size? --->
		<cfif isDefined("this.size")>
			<cfset data.size = this.size>
		</cfif>	

		<!--- Color? --->
		<cfif isDefined("this.color")>
			<cfset data.colour = this.color>
		</cfif>	

		<!--- Rotate? --->
		<cfif isDefined("this.rotate")>
			<cfset data.rotate = this.rotate>
		</cfif>	

		<!--- $this->rotate = 'vertical'; --->
			
		<cfreturn data>
	</cffunction>		
</cfcomponent>