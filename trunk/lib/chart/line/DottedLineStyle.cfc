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
		<cfargument name="strokeLengthOn" required="true" type="numeric">
		<cfargument name="strokeLengthOff" required="true" type="numeric">
		
		<cfscript>
			// StrokeLengthOn
			setStrokeLengthOn(arguments.strokeLengthOn);	
			// StrokeLengthOff
			setStrokeLengthOff(arguments.strokeLengthOff);	

			return this;
		</cfscript>		
	</cffunction>

	<cffunction name="getStrokeLengthOn" access="public" output="false" returntype="numeric" hint="">
	   <cfreturn this.strokeLengthOn>
	</cffunction>

	<cffunction name="setStrokeLengthOn" access="public" output="false" returntype="void" hint="">
		<cfargument name="strokeLengthOn" type="numeric" required="true">
	    <cfset this.strokeLengthOn = arguments.strokeLengthOn>
	</cffunction>	
	
	<cffunction name="getStrokeLengthOff" access="public" output="false" returntype="numeric" hint="">
	   <cfreturn this.strokeLengthOff>
	</cffunction>

	<cffunction name="setStrokeLengthOff" access="public" output="false" returntype="void" hint="">
		<cfargument name="strokeLengthOff" type="numeric" required="true">
	    <cfset this.strokeLengthOff = arguments.strokeLengthOff>
	</cffunction>

	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = StructNew()>
		<cfset data.on = this.strokeLengthOn>
		<cfset data.off = this.strokeLengthOff>
		<cfreturn data>
	</cffunction>		
</cfcomponent>