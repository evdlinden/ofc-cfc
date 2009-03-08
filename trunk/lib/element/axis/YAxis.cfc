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
		<cfargument name="labels" type="array" required="false" hint="A array of simple values">
		<cfargument name="tickLength" type="numeric" required="false" hint="">
		
		<cfscript>
			super.init(argumentCollection=arguments);
			// labels?
			if(isDefined('arguments.labels')){ 
				setLabels(arguments.labels);
			} else {
				this.labels = ArrayNew(1);
			}
			// TickLength?
			if(isDefined('arguments.tickLength')){ setTickLength(arguments.tickLength);}	

			return this;			
		</cfscript>		
	</cffunction>

	<cffunction name="getTickLength" access="public" output="false" returntype="numeric" hint="">
	   <cfreturn this.tickLength>
	</cffunction>

	<cffunction name="setTickLength" access="public" output="false" returntype="void" hint="">
		<cfargument name="tickLength" type="numeric" required="true">
	    <cfset this.tickLength = arguments.tickLength>
	</cffunction>

	<cffunction name="addLabel" access="public" returntype="void" hint="Adds a simple value">
		<cfargument name="label" type="string" required="true">
		<cfset ArrayAppend(this.labels,arguments.label)>
	</cffunction>

	<cffunction name="setLabels" access="public" returntype="void" hint="A simple array of strings">
		<cfargument name="labels" type="Array" required="true">
		<cfset this.labels = arguments.labels>
	</cffunction>

	<cffunction name="getLabels" access="public" output="false" returntype="array" hint="">
	   <cfreturn this.labels>
	</cffunction>

	<cffunction name="hasLabels" access="public" output="false" returntype="boolean" hint="">
	   <cfreturn ArrayLen(this.labels)>
	</cffunction>	

	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = super.getSWFData()>

		<!--- tick length? --->
		<cfif isDefined("this.tickLength")>
			<cfset data['tick-length'] = this.tickLength>
		</cfif>	

		<cfif hasLabels()>
			<cfset data.labels = this.labels>
		</cfif>

		<cfreturn data>
	</cffunction>		
</cfcomponent>