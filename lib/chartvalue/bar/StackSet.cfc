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
<cfcomponent output="false" hint="Contains stack values">

	<cffunction name="init" access="public" returntype="Struct">
		<cfargument name="values" required="false" type="array">
		
		<cfscript>
			// values?
			if(isDefined('arguments.values')){ setValues(arguments.values);	}
			return this;
		</cfscript>		
	</cffunction>
	
	<cffunction name="addValue" access="public" returntype="void" hint="Adds a stack value object or simple value to collection">
		<cfargument name="value" type="Any" required="true">
		<cfset ArrayAppend(this.values,arguments.value)>
	</cffunction>

	<cffunction name="setValues" access="public" returntype="void" hint="Sets values array containing simple values e.g. 4,5,3,9,2,7">
		<cfargument name="values" type="array" required="true" hint="Simple Array">
		<cfset this.values = arguments.values>
	</cffunction>

	<cffunction name="getValues" access="public" returntype="array" hint="Returns Stack values">
		<cfreturn this.values>
	</cffunction>	
	
	<cffunction name="getSWFData" access="public" returntype="array" hint="Returns stackvalue array">
		<cfset var values = ArrayNew(1)>
		
		<!--- Loop all values --->
		<cfloop index="i" from="1" to="#ArrayLen(this.values)#">
			<!--- Item is bar value object? Get data? --->
			<cfif not isSimpleValue(this.values[i])>
				<cfset ArrayAppend(values,this.values[i].getSWFData())>
			<cfelse>
				<cfset ArrayAppend(values,this.values[i])>
			</cfif>
		</cfloop>	
				
		<cfreturn values>
	</cffunction>	
</cfcomponent>