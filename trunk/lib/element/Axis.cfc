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
		<cfargument name="color" type="string" required="false" hint="">
		<cfargument name="gridColor" type="string" required="false" hint="">
		<cfargument name="steps" type="numeric" required="false" default="1" hint="">
		<cfargument name="stroke" type="numeric" required="false" hint="">
		<cfargument name="minimum" type="numeric" required="false" default="0" hint="">
		<cfargument name="maximum" type="numeric" required="false" hint="">
		<cfargument name="isOffset" type="numeric" required="false" default="false" hint="">
		
		<!--- In base class? --->
		<cfset this.values = ArrayNew(1)>
		
		<cfscript>
			super.init(argumentCollection=arguments);
			// Color?
			if(isDefined('arguments.color')){ setColor(arguments.color);}
			// GridColor?
			if(isDefined('arguments.gridColor')){ setGridColor(arguments.gridColor);}	
			// Steps?
			if(isDefined('arguments.steps')){ setSteps(arguments.steps);}	
			// Stroke?
			if(isDefined('arguments.stroke')){ setStroke(arguments.stroke);}	
			// Minimum?
			if(isDefined('arguments.minimum')){ setMinimum(arguments.minimum);}	
			// Maximum?
			if(isDefined('arguments.maximum')){ setMaximum(arguments.maximum);}	
			
			setIsOffset(arguments.isOffset);
			
			return this;
		</cfscript>			
	</cffunction>
	
	<cffunction name="getColor" access="public" output="false" returntype="string" hint="">
	   <cfreturn this.color>
	</cffunction>

	<cffunction name="setColor" access="public" output="false" returntype="void" hint="">
		<cfargument name="color" type="string" required="true">
	    <cfset this.color = arguments.color>
	</cffunction>

	<cffunction name="getGridColor" access="public" output="false" returntype="string" hint="">
	   <cfreturn this.gridColor>
	</cffunction>

	<cffunction name="setGridColor" access="public" output="false" returntype="void" hint="">
		<cfargument name="gridColor" type="string" required="true">
	    <cfset this.gridColor = arguments.gridColor>
	</cffunction>	
	
	<cffunction name="getSteps" access="public" output="false" returntype="numeric" hint="">
	   <cfreturn this.steps>
	</cffunction>

	<cffunction name="setSteps" access="public" output="false" returntype="void" hint="">
		<cfargument name="steps" type="numeric" required="true">
	    <cfset this.steps = arguments.steps>
	</cffunction>

	<cffunction name="getStroke" access="public" output="false" returntype="numeric" hint="">
	   <cfreturn this.stroke>
	</cffunction>
	
	<cffunction name="setStroke" access="public" output="false" returntype="void" hint="">
		<cfargument name="stroke" type="numeric" required="true">
	    <cfset this.stroke = arguments.stroke>
	</cffunction>

	<cffunction name="getMinimum" access="public" output="false" returntype="numeric" hint="">
	   <cfreturn this.minimum>
	</cffunction>

	<cffunction name="setMinimum" access="public" output="false" returntype="void" hint="">
		<cfargument name="minimum" type="numeric" required="true">
	    <cfset this.minimum = arguments.minimum>
	</cffunction>

	<cffunction name="getMaximum" access="public" output="false" returntype="numeric" hint="">
	   <cfreturn this.maximum>
	</cffunction>

	<cffunction name="setMaximum" access="public" output="false" returntype="void" hint="">
		<cfargument name="maximum" type="numeric" required="true">
	    <cfset this.maximum = arguments.maximum>
	</cffunction>
	
	<cffunction name="setRange" access="public" output="false" returntype="void" hint="facade">
		<cfargument name="minimum" type="numeric" required="true">
		<cfargument name="maximum" type="numeric" required="true">
		
	    <cfset setMinimum(arguments.minimum)>
	    <cfset setMaximum(arguments.maximum)>
	</cffunction>

	<cffunction name="getIsOffset" access="public" output="false" returntype="boolean" hint="">
	   <cfreturn this.isOffset>
	</cffunction>

	<cffunction name="setIsOffset" access="public" output="false" returntype="void" hint="">
		<cfargument name="isOffset" type="boolean" required="true">
	    <cfset this.isOffset = arguments.isOffset>
	</cffunction>

	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = StructNew()>
		
		<!--- steps? --->
		<cfif isDefined("this.steps")>
			<cfset data.steps = this.steps>
		</cfif>	
		
		<!--- stroke? --->
		<cfif isDefined("this.stroke")>
			<cfset data.stroke = this.stroke>
		</cfif>	

		<!--- minimum? --->
		<cfif isDefined("this.minimum")>
			<cfset data.min = this.minimum>
		</cfif>	

		<!--- maximum? --->
		<cfif isDefined("this.maximum")>
			<cfset data.max = this.maximum>
		</cfif>	

		<!--- grid color? --->
		<cfif isDefined("this.gridColor")>
			<cfset data['grid-colour'] = this.gridColor>
		</cfif>	

		<!--- color? --->
		<cfif isDefined("this.color")>
			<cfset data.colour = this.color>
		</cfif>	

		<!--- offset --->
		<cfif getIsOffset()>
			<cfset data.offset = 1>
		<cfelse>	
			<cfset data.offset = 0>
		</cfif>
		
		<cfreturn data>
	</cffunction>		
</cfcomponent>