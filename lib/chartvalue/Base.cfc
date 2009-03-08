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
<cfcomponent output="false">

	<cffunction name="init" access="public" returntype="Struct">
		<cfargument name="value" type="numeric" required="false" hint="">
		<cfargument name="onClick" type="string" required="false" hint="">
		
		<cfscript>
			// Value?
			if(isDefined('arguments.value')){ setValue(arguments.value);}	
			// OnClick?
			if(isDefined('arguments.onClick')){ setOnClick(arguments.onClick);}	
			
			return this;
		</cfscript>			
	</cffunction>

	<cffunction name="setValue" access="public" returntype="void">
		<cfargument name="value" type="numeric" required="true" hint="">
		<cfset this.value = arguments.value>		
	</cffunction>

	<cffunction name="getValue" access="public" returntype="numeric" hint="">
		<cfreturn this.value>
	</cffunction>	
			
	<cffunction name="setOnClick" access="public" returntype="void">
		<cfargument name="onClick" type="string" required="true" hint="">
		<cfset this.onClick = arguments.onClick>		
	</cffunction>

	<cffunction name="getOnClick" access="public" returntype="string" hint="Returns onClick">
		<cfreturn this.onClick>
	</cffunction>
		
	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = StructNew()>
		
		<!--- value? --->
		<cfif isDefined("this.value")>
			<cfset data['value']= this.value>
		</cfif>		
				
		<!--- onClick? --->
		<cfif isDefined("this.onClick")>
			<cfset data['on-click']= this.onClick>
		</cfif>
						
		<cfreturn data>
	</cffunction>		
</cfcomponent>