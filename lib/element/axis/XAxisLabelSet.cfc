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
		<cfargument name="steps" type="numeric" required="false" hint="">
		<cfargument name="color" type="string" required="false" hint="">
		<cfargument name="size" type="numeric" required="false" hint="">
		<cfargument name="rotate" type="numeric" required="false" hint="">
		<cfargument name="labels" type="array" required="false" hint="An array of strings and/or xAxisLabel objects">

		<cfscript>
			super.init(argumentCollection=arguments);

			// x labels?
			if(isDefined('arguments.labels')){ 
				setLabels(arguments.labels);
			} else {
				this.labels = ArrayNew(1);
			}
			// Steps?
			if(isDefined('arguments.steps')){ setSteps(arguments.steps);}	
			// Color?
			if(isDefined('arguments.color')){ setColor(arguments.color);}	
			// Size?
			if(isDefined('arguments.size')){ setSize(arguments.size);}	
			// Rotate?
			if(isDefined('arguments.rotate')){ setRotate(arguments.rotate);}	
			
			return this;
		</cfscript>
	</cffunction>

	<cffunction name="addLabel" access="public" returntype="void" hint="">
		<cfargument name="label" type="any" required="true" hint="Adds a simple value or xAxisLabel object">
		<cfset ArrayAppend(this.labels,arguments.label)>
	</cffunction>

	<cffunction name="setLabels" access="public" returntype="void" hint="">
		<cfargument name="labels" type="Array" required="true" hint="An array of strings and/or xAxisLabel objects">
		<cfset this.labels = arguments.labels>
	</cffunction>
	
	<cffunction name="getLabels" access="public" output="false" returntype="array" hint="">
	   <cfreturn this.labels>
	</cffunction>
	
	<cffunction name="getSteps" access="public" output="false" returntype="numeric" hint="">
	   <cfreturn this.steps>
	</cffunction>

	<cffunction name="setSteps" access="public" output="false" returntype="void" hint="">
		<cfargument name="steps" type="numeric" required="true">
	    <cfset this.steps = arguments.steps>
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
			
	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = StructNew()>

		<!--- steps? --->
		<cfif isDefined("this.steps")>
			<cfset data.steps = this.steps>
		</cfif>	

		<!--- color? --->
		<cfif isDefined("this.color")>
			<cfset data.colour = this.color>
		</cfif>	

		<!--- Size? --->
		<cfif isDefined("this.size")>
			<cfset data.size = this.size>
		</cfif>	

		<!--- 		$this->rotate = 'vertical'; --->
		<!--- Rotate? --->
		<cfif isDefined("this.rotate")>
			<cfset data.rotate = this.rotate>
		</cfif>	

		<!--- Labels? --->
		<cfif ArrayLen(this.labels)>

			<cfset data.labels = ArrayNew(1)>
		
			<!--- Loop all labels --->
			<cfloop index="i" from="1" to="#ArrayLen(this.labels)#">
				<!--- Item is bar value object? Get data? --->
				<cfif not isSimpleValue(this.labels[i])>
					<cfset ArrayAppend(data.labels,this.labels[i].getSWFData())>
				<cfelse>
					<cfset ArrayAppend(data.labels,this.labels[i])>
				</cfif>
			</cfloop>	
			
		</cfif>

		<cfreturn data>
	</cffunction>		
</cfcomponent>