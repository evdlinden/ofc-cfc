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
<cfcomponent output="false" extends="ofc-cfc.lib.element.Axis">

	<cffunction name="init" access="public" returntype="Struct">
		<cfargument name="threeD" type="numeric" required="false" hint="">
		<cfargument name="tickHeight" type="numeric" required="false" hint="">
		
		<cfscript>
			super.init(argumentCollection=arguments);
			// 3D?
			if(isDefined('arguments.threeD')){ setThreeD(arguments.threeD);}
			// ThickHeight?
			if(isDefined('arguments.thickHeight')){ setThickHeight(arguments.thickHeight);}	
			
			return this;			
		</cfscript>
	</cffunction>

	<cffunction name="getTickHeight" access="public" output="false" returntype="numeric" hint="">
	   <cfreturn this.tickHeight>
	</cffunction>

	<cffunction name="setTickHeight" access="public" output="false" returntype="void" hint="">
		<cfargument name="tickHeight" type="numeric" required="true">
	    <cfset this.tickHeight = arguments.tickHeight>
	</cffunction>

	<cffunction name="getThreeD" access="public" output="false" returntype="numeric" hint="">
	   <cfreturn this.threeD>
	</cffunction>

	<cffunction name="setThreeD" access="public" output="false" returntype="void" hint="">
		<cfargument name="threeD" type="numeric" required="true">
	    <cfset this.threeD = arguments.threeD>
	</cffunction>

	<cffunction name="setLabelSet" access="public" returntype="void" hint="xAxisLabelSet">
		<cfargument name="labelSet" type="any" required="true">
		<cfset this.labelSet = arguments.labelSet>
	</cffunction>

	<cffunction name="getLabelSet" access="public" output="false" returntype="any" hint="xAxisLabelSet">
	   <cfreturn this.labelSet>
	</cffunction>

	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = super.getSWFData()>

		<!--- tick height? --->
		<cfif isDefined("this.tickHeight")>
			<cfset data['tick-height'] = this.tickHeight>
		</cfif>	

		<!--- 3D? --->
		<cfif isDefined("this.threeD")>
			<cfset data['3d'] = this.threeD>
		</cfif>	
		
		<!--- Labels? --->
		<cfif isDefined("this.labelSet") and isObject(this.labelSet)>
			<cfset data.labels = this.labelSet.getSWFData()>
		</cfif>
				
		<cfreturn data>
	</cffunction>		
</cfcomponent>