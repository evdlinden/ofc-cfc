<cfcomponent name="coldboxproxy" output="false" extends="coldbox.system.extras.ColdboxProxy">

	<!--- You can override this method if you want to intercept before and after. --->
	<cffunction name="process" output="true" access="remote" returntype="any" hint="Process a remote call and return data/objects back.">
		<cfset var results = "">
		
		<!--- Default: WDDX --->
		<cfparam name="url.returnFormat" type="string" default="">

		<!--- Process --->
		<cfset results = super.process(argumentCollection=arguments)>

		<!--- Which return format? --->
		<cfswitch expression="#UCASE(url.returnFormat)#">
			<!--- Event handler should return JSON, XML or a simple value --->
			<cfcase value="JSON,XML,PLAIN">
				<cfheader name="expires" value="Mon, 03 Sep 1973 00:00:01 GMT">
				<cfheader name="pragma" value="no-cache">
				<cfheader name="cache-control" value="no-cache">
				<cfcontent reset="true"><cfoutput>#TRIM(results)#</cfoutput>
			</cfcase>
			<cfdefaultcase>
				<!--- WDDX --->
				<cfreturn results>
			</cfdefaultcase>		
		</cfswitch>

	</cffunction>
	
</cfcomponent>