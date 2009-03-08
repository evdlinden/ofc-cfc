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
		
		<cfscript>
			super.init(argumentCollection=arguments);
			// Text?
			if(isDefined('arguments.text')){setText(arguments.text);}	
			return this;
		</cfscript>
	</cffunction>
	
	<cffunction name="setText" access="public" returntype="void">
		<cfargument name="text" type="string" required="true" hint="">
		<cfset this.text = arguments.text>		
	</cffunction>

	<cffunction name="getText" access="public" returntype="string" hint="Returns text">
		<cfreturn this.text>
	</cffunction>

	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = super.getSWFData()>
		<cfset data.text = this.text>
		<cfreturn data>
	</cffunction>
					
</cfcomponent>