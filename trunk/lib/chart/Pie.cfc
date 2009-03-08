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
<cfcomponent output="false" extends="ofc-cfc.lib.chart.Base">

	<cffunction name="init" access="public" returntype="Struct">
		<cfargument name="aplha" type="numeric" required="false" hint="">
		<cfargument name="fontSize" type="numeric" required="false" hint="">
		<cfargument name="colors" type="array" required="false" hint="">
		<cfargument name="border" type="numeric" required="false" hint="">
		<cfargument name="isAnimate" type="boolean" required="false" hint="">
		<cfargument name="startAngle" type="numeric" required="false" hint="">
		<cfargument name="labelColor" type="string" required="false" hint="">
		<cfargument name="isGradient" type="boolean" required="false" hint="">
		<cfargument name="isLabels" type="boolean" required="false" hint="">
		
		<cfscript>
			super.init(argumentCollection=arguments);
			// Alpha?
			if(isDefined('arguments.alpha')){ setAlpha(arguments.alpha);}	
			// FontSize?
			if(isDefined('arguments.fontSize')){ setFontSize(arguments.fontSize);}	
			// Colors?
			if(isDefined('arguments.colors')){ setColors(arguments.colors);}	
			// Border?
			if(isDefined('arguments.border')){ setBorder(arguments.border);}	
			// Animate?
			if(isDefined('arguments.isAnimate')){ setIsAnimate(arguments.isAnimate);}	
			// StartAngle?
			if(isDefined('arguments.startAngle')){ setStartAngle(arguments.startAngle);}	
			// LabelColor?
			if(isDefined('arguments.labelColor')){ setLabelColor(arguments.labelColor);}	
			// Gradient?
			if(isDefined('arguments.isGradient')){ setIsGradient(arguments.isGradient);}	
			// Labels?
			if(isDefined('arguments.isLabels')){ setIsLabels(arguments.isLabels);}	

			return this;
		</cfscript>				
	</cffunction>

	<cffunction name="addColor" access="public" returntype="void" hint="">
		<cfargument name="color" type="string" required="true">
		<cfset ArrayAppend(this.colors,arguments.color)>
	</cffunction>

	<cffunction name="setColors" access="public" returntype="void">
		<cfargument name="colors" type="array" required="true" hint="">
		<cfset this.colors = arguments.colors>		
	</cffunction>

	<cffunction name="getColors" access="public" returntype="array" hint="">
		<cfreturn this.colors>
	</cffunction>	 
	
	<cffunction name="setBorder" access="public" returntype="void">
		<cfargument name="border" type="numeric" required="true" hint="">
		<cfset this.border = arguments.border>		
	</cffunction>

	<cffunction name="getBorder" access="public" returntype="numeric" hint="Returns border">
		<cfreturn this.border>
	</cffunction>
		
	<cffunction name="setAlpha" access="public" returntype="void">
		<cfargument name="alpha" type="string" required="true" hint="">
		<cfset this.alpha = arguments.alpha>		
	</cffunction>

	<cffunction name="getAlpha" access="public" returntype="string" hint="Returns alpha">
		<cfreturn this.alpha>
	</cffunction>	
			
	<cffunction name="setIsAnimate" access="public" returntype="void">
		<cfargument name="isAnimate" type="boolean" required="true" hint="">
		<cfset this.isAnimate = arguments.isAnimate>		
	</cffunction>

	<cffunction name="getIsAnimate" access="public" returntype="boolean" hint="Returns isAnimate">
		<cfreturn this.isAnimate>
	</cffunction>
			
	<cffunction name="setStartAngle" access="public" returntype="void">
		<cfargument name="angle" type="numeric" required="true" hint="">
		<cfset this.startAngle = arguments.angle>		
	</cffunction>

	<cffunction name="getStartAngle" access="public" returntype="numeric" hint="Returns startAngle">
		<cfreturn this.startAngle>
	</cffunction>

	<cffunction name="setLabelColor" access="public" returntype="void">
		<cfargument name="labelColor" type="string" required="true" hint="">
		<cfset this.labelColor = arguments.labelColor>		
	</cffunction>

	<cffunction name="getLabelColor" access="public" returntype="string" hint="Returns labelColor">
		<cfreturn this.labelColor>
	</cffunction>

	<cffunction name="setIsGradient" access="public" returntype="void">
		<cfargument name="isGradient" type="boolean" required="true" hint="">
		<cfset this.isGradient = arguments.isGradient>		
	</cffunction>

	<cffunction name="getIsGradient" access="public" returntype="boolean" hint="Returns isGradient">
		<cfreturn this.isGradient>
	</cffunction>
		
	<cffunction name="setIsLabels" access="public" returntype="void">
		<cfargument name="isLabels" type="boolean" required="true" hint="">
		<cfset this.isLabels = arguments.isLabels>		
	</cffunction>

	<cffunction name="getIsLabels" access="public" returntype="boolean" hint="Returns isLabels">
		<cfreturn this.isLabels>
	</cffunction>
			
	<cffunction name="setFontSize" access="public" returntype="void">
		<cfargument name="fontSize" type="numeric" required="true" hint="">
		<cfset this.fontSize = arguments.fontSize>		
	</cffunction>

	<cffunction name="getFontSize" access="public" returntype="numeric" hint="Returns fontSize">
		<cfreturn this.fontSize>
	</cffunction>
					
	<cffunction name="getSWFData" access="public" returntype="struct" hint="Returns chart data">
		<cfset var data = super.getSWFData()>
		
		<!--- set type --->
		<cfset data.type = 'pie'>
		
		<!--- colors? --->
		<cfif isDefined("this.colors")>
			<cfset data.colours = this.colors>
		</cfif>
		
		<!--- alpha? --->
		<cfif isDefined("this.alpha")>
			<cfset data.alpha = this.alpha>
		</cfif>
		
		<!--- tooltip? --->
		<cfif isDefined("this.tooltip")>
			<cfset data.tip = this.tooltip>
		</cfif>
		
		<!--- animate? --->
		<cfif isDefined("this.isAnimate")>
			<cfset data.animate = this.isAnimate>
		</cfif>
		
		<!--- startAngle? --->
		<cfif isDefined("this.startAngle")>
			<cfset data['start-angle']= this.startAngle>
		</cfif>
		
		<!--- labelColor? --->
		<cfif isDefined("this.labelColor")>
			<cfset data['label-colour']= this.labelColor>
		</cfif>
				
		<!--- isGradientFill? --->
		<cfif isDefined("this.isGradient")>
			<cfset data['gradient-fill']= this.isGradient>
		</cfif>
				
		<!--- isLabels? --->
		<cfif isDefined("this.isLabels")>
			<cfif this.isLabels>
				<cfset data['no-labels']= false>
			<cfelse>
				<cfset data['no-labels']= true>
			</cfif>
		</cfif>
				
		<!--- fontSize? --->
		<cfif isDefined("this.fontSize")>
			<cfset data['font-size']= this.fontSize>
		</cfif>
						
		<cfreturn data>
	</cffunction>	
</cfcomponent>