<cfcomponent name="ehDeveloper" extends="coldbox.system.eventhandler" output="false">
	
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="controller" type="any">
		<cfset super.init(arguments.controller)>
		<cfreturn this>
	</cffunction>

	<cffunction name="doGenerateDocs" access="public" returntype="void" output="false" hint="I generate CFC Docs using ColdDoc">
		<cfargument name="Event" type="any">

		<cfscript>
			var coldDoc = createObject("component", "colddoc.ColdDoc").init();
			var base = expandPath("/ofc-cfc/lib");
			var docs = expandPath("/ofc-cfc-root/docs/api");
		
			coldDoc.generate(base, docs, "ofc-cfc.lib", "OFC-CFC");
			
			event.noRender();
			
			// Show docs
			relocate('/ofc-cfc/docs');
		</cfscript>
				
	</cffunction>

</cfcomponent>	