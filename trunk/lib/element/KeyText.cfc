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
		<cfargument name="text" required="false" type="string" default="">
		<cfargument name="fontSize" required="false" type="numeric" default="10">
		
		<cfscript>
			setText(arguments.text);
			setFontSize(arguments.fontSize);
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

	<cffunction name="getFontSize" access="public" output="false" returntype="numeric" hint="">
	   <cfreturn this.fontSize>
	</cffunction>

	<cffunction name="setFontSize" access="public" output="false" returntype="void" hint="">
		<cfargument name="fontSize" type="numeric" required="true">
	    <cfset this.fontSize = arguments.fontSize>
	</cffunction>	

	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = StructNew()>
		
		<cfset data.text = this.text>
		<cfset data['font-size'] = this.fontSize>

		<cfreturn data>
	</cffunction>		
</cfcomponent>