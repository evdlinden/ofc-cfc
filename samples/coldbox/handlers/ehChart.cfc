<cfcomponent name="ehChart" extends="coldbox.system.eventhandler" output="false">
	
	<cffunction name="init" access="public" returntype="any" output="false">
		<cfargument name="controller" type="any">
		<cfset super.init(arguments.controller)>
		<cfreturn this>
	</cffunction>

	<cffunction name="index" access="public" returntype="void" output="true">
		<cfargument name="Event" type="any">
		
		<cfset var rc = Event.getCollection()>
		
		<!--- Onload proxy event --->
		<cfset rc.coldBoxEventName = 'ehChart.getThreeDBarChartData'>

		<!--- Chart JSON data, needed for onLoadChartData  --->
		<cfset rc.coldBoxEventResults = getThreeDBarChartData()>
		<!--- runEvent(rc.coldBoxEventName) --->
		
		<!--- jQuery --->
		<cfset Event.setView("jqueryChart")>
		
	</cffunction>

	<cffunction name="getBarChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title');
			var bar = CreateObject('component','ofc-cfc.lib.chart.Bar').init();
			var xAxis = CreateObject('component','ofc-cfc.lib.element.axis.XAxis');
			var yAxis = CreateObject('component','ofc-cfc.lib.element.axis.YAxis');
			var yAxisRight = CreateObject('component','ofc-cfc.lib.element.axis.YAxis');
			var keyText = CreateObject('component','ofc-cfc.lib.element.KeyText').init(text='My Bar',fontSize=12);
			var exampleBarValue = CreateObject('component','ofc-cfc.lib.chartvalue.bar').init(value=5,color='##EF7C05',onClick='alert("Man, who clicked me this time?")');
			var exampleBarValue2 = CreateObject('component','ofc-cfc.lib.chartvalue.bar').init(startValue=4,value=8,color='##66ABEC',onClick='alert("Yeah, I have a startValue.")');
			
			// X-axis
			xAxis.init(  color='##155191'
						,gridColor='##BEDFF1'
						,steps=1
						,isOffset=true
						,stroke=3
						,minimum=0
						,maximum=12
						,tickHeight=5);
			chart.setXAxis(xAxis);
			
			// Y-axis
			yAxis.init(  color='##155191'
						,gridColor='##BEDFF1'
						,steps=2
						,minimum=0
						,maximum=10
						,tickLength=5);
			chart.setYAxis(yAxis);
			
			// Right Y-axis
			yAxisRight.init(  color='##155191'
							,gridColor='##BEDFF1'
							,steps=2
							,minimum=0
							,maximum=10);
			chart.setYAxisRight(yAxisRight);
			
			// Background color
			chart.setBackGroundColor('##ffffff');
			
			// Set chart title
			title.init(text='Bar Chart: Javascript OnClick, Bar value object, startValue and two Y-axises',style='font-size:10px;font-weight:bold; color:##000000');
			chart.setTitle(title);

			// Bar
			bar.setValues( getDummyValues() );
			// Add an additonal bar value object
			bar.addValue(exampleBarValue);
			// Add another which has a startValue
			bar.addValue(exampleBarValue2);
			bar.setAlpha('0.7');
			bar.setColor('##6666CC');
			
			// displays legend key on top
			bar.setKeyText(keyText);
			bar.setOnClick('alert("Did you click me?")');
			
			// Add bar element to chart
			chart.addElement(bar);
			
			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>

	<cffunction name="getSketchBarChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Sketch Bar Chart');
			var sketchBar = CreateObject('component','ofc-cfc.lib.chart.bar.Sketch').init();

			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);

			// Sketch
			sketchBar.setValues( getDummyValues() );
			sketchBar.setOffset(10);
			sketchBar.setOnClick('alert("Did you click me?")');
			sketchBar.setAlpha('0.9');
			sketchBar.setColor('##424581');
			chart.addElement(sketchBar);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>

	<cffunction name="getGlassBarChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Glass Bar Chart');
			var glassBar = CreateObject('component','ofc-cfc.lib.chart.bar.Glass').init();

			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);

			// Glass
			glassBar.setValues( getDummyValues() );
			glassBar.setTooltip('My y-value= ##val## <br>My x-value = ##x_label##');
			glassBar.setColor('##424581');
			glassBar.setOnClick('alert("Did you click me?")');
			glassBar.setAlpha('0.8');
			chart.addElement(glassBar);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>
		
	<cffunction name="getFilledBarChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Filled Bar Chart');
			var filled = CreateObject('component','ofc-cfc.lib.chart.bar.Filled').init();

			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);

			// Filled
			filled.setValues( getDummyValues() );
			filled.setOutLineColor('##000000');
			filled.setOnClick('alert("Did you click me?")');
			filled.setColor('##d070ac');
			chart.addElement(filled);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>
		
	<cffunction name="getCylinderBarChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Cylinder Chart');
			var cylinder = CreateObject('component','ofc-cfc.lib.chart.bar.Cylinder').init();
			var xAxis = CreateObject('component','ofc-cfc.lib.element.axis.XAxis').init();

			// X-axis
			xAxis.setColor('##d070ac');
			xAxis.setGridColor('##BEDFF1');
			xAxis.setSteps(1);
			xAxis.setIsOffset(true);
			xAxis.setMinimum(0);
			xAxis.setMaximum(10);
			xAxis.setThreeD(5);
			xAxis.setStroke(3);
			xAxis.setTickHeight(5);
			chart.setXAxis(xAxis);
			
			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);

			// Filled
			cylinder.setValues( getDummyValues() );
			cylinder.setColor('##d070ac');
			cylinder.setAlpha('0.8');
			chart.addElement(cylinder);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>
		
	<cffunction name="getRoundGlassBarChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Cylinder Chart');
			var roundGlass = CreateObject('component','ofc-cfc.lib.chart.bar.RoundGlass').init();
			var xAxis = CreateObject('component','ofc-cfc.lib.element.axis.XAxis').init();

			// X-axis
			xAxis.setColor('##000');
			xAxis.setGridColor('##BEDFF1');
			xAxis.setSteps(1);
			xAxis.setIsOffset(true);
			xAxis.setMinimum(0);
			xAxis.setMaximum(10);
			//xAxis.setThreeD(5);
			xAxis.setStroke(2);
			xAxis.setTickHeight(5);
			chart.setXAxis(xAxis);
			
			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);

			// Filled
			roundGlass.setValues( getDummyValues() );
			roundGlass.setColor('##d070ac');
			roundGlass.setAlpha('0.8');
			chart.addElement(roundGlass);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>

	<cffunction name="getFadeBarChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Fade Bar Chart');
			var fadeBar = CreateObject('component','ofc-cfc.lib.chart.bar.Fade').init();

			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);

			// Fade
			fadeBar.setValues( getDummyValues() );
			fadeBar.setTooltip('My y-value= ##val## <br>My x-value = ##x_label##');
			fadeBar.setAlpha('0.5');
			fadeBar.setColor('##82BEF4');
			chart.addElement(fadeBar);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>

	<cffunction name="getStackedBarChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Stacked Bar Chart');
			var xAxis = CreateObject('component','ofc-cfc.lib.element.axis.XAxis').init();
			var xAxisLabelSet = CreateObject('component','ofc-cfc.lib.element.axis.XAxisLabelSet').init(labels=ListToArray('Banana,Pear') );
			var yLegend = CreateObject('component','ofc-cfc.lib.element.Legend').init(text='Total Fruits',style='font-size: 14px; color: ##000000');
			var stackBar = CreateObject('component','ofc-cfc.lib.chart.bar.Stack').init( colors=ListToArray('##3333FF,##9999FF,##666699,##000099,##CCCCFF') );
			var xAxisLabelApple = CreateObject('component','ofc-cfc.lib.element.axis.XAxisLabel').init(text='Apple',size=18,rotate=-90);
			var xAxisLabelOrange = CreateObject('component','ofc-cfc.lib.element.axis.XAxisLabel').init(text='Orange',size=16,rotate=-45);
			var stackBarSets = ArrayNew(1);
			
			// Banana
			stackBarSets[1] = CreateObject('component','ofc-cfc.lib.chartvalue.bar.StackSet').init(values:ListToArray('2,3,1,4'));
			// Pear
			stackBarSets[2] = CreateObject('component','ofc-cfc.lib.chartvalue.bar.StackSet').init(values:ListToArray('1,5,2,2'));
			// Apple
			stackBarSets[3] = CreateObject('component','ofc-cfc.lib.chartvalue.bar.StackSet').init(values:ListToArray('3,1,2,2,2'));
			// Orange
			stackBarSets[4] = CreateObject('component','ofc-cfc.lib.chartvalue.bar.StackSet').init(values:ListToArray('2,2,2,3,1'));

			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);
			
			// add xAxisLabels to labelSet
			xAxisLabelSet.addLabel(xAxisLabelApple);
			xAxisLabelSet.addLabel(xAxisLabelOrange);
			
			xAxis.setLabelSet(xAxisLabelSet);

			xAxis.setIsOffset(true);
			chart.setXAxis(xAxis);	
			
			chart.setYLegend(yLegend);
			
			// Stack
			stackBar.setValues( stackBarSets );
			//stackBar.setTooltip('My y-value= ##val## <br>My x-value = ##x_label##');
			stackBar.setAlpha('0.5');
			stackBar.setColor('##82BEF4');
			chart.addElement(stackBar);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>

	<cffunction name="getHorizontalBarChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Horizontal Bar Chart');
			var horizontalBar = CreateObject('component','ofc-cfc.lib.chart.bar.Horizontal').init();
			var yAxis = CreateObject('component','ofc-cfc.lib.element.axis.YAxis').init();
			var xAxis = CreateObject('component','ofc-cfc.lib.element.axis.XAxis').init();
			var xLegend = CreateObject('component','ofc-cfc.lib.element.Legend').init(text='Minimal and Maximal fruits a week',style='font-size: 10px; color: ##000000');
			var yLegend = CreateObject('component','ofc-cfc.lib.element.Legend').init(text='Fruits',style='font-size: 10px; color: ##000000');
			var values = ArrayNew(1); 
			
			values[1] = CreateObject('component','ofc-cfc.lib.chartvalue.bar.Horizontal').init(value=5,color='##669999');
			values[1].setTooltip('Minimal 3 and Maximal 5 Mangos' );
			values[2] = CreateObject('component','ofc-cfc.lib.chartvalue.bar.Horizontal').init(startValue=6,value=10,color='##66FFFF');
			values[2].setTooltip('Minimal 6 and Maximal 10 Pears' );
			values[3] = CreateObject('component','ofc-cfc.lib.chartvalue.bar.Horizontal').init(value=7,color='##99CCCC');
			values[3].setTooltip('Minimal 5 and Maximal 7 Oranges' );
			values[4] = CreateObject('component','ofc-cfc.lib.chartvalue.bar.Horizontal').init(startValue=1,value=5,color='##66CCCC');
			values[4].setTooltip('Minimal 1 and Maximal 5 Apples' );
			values[5] = CreateObject('component','ofc-cfc.lib.chartvalue.bar.Horizontal').init(startValue=2,value=3,color='##009999');
			values[5].setTooltip('Minimal 2 and Maximal 3 Bananas' );

			// Y-axis
			yAxis.setColor('##155191');
			yAxis.setGridColor('##B8D0DC');
			yAxis.setIsOffset(true);
			yAxis.setStroke(1);
			yAxis.setTickLength(5);
			yAxis.setLabels(ListToArray('Banana,Apple,Orange,Pear,Mango'));
			chart.setYAxis(yAxis);			
			
			// X-axis
			xAxis.setColor('##155191');
			xAxis.setGridColor('##BEDFF1');
			xAxis.setSteps(1);
			xAxis.setIsOffset(false);
			xAxis.setMinimum(0);
			xAxis.setMaximum(10);
			xAxis.setStroke(1);
			xAxis.setTickHeight(3);
			chart.setXAxis(xAxis);
						
			chart.setXLegend(xLegend);
			chart.setYLegend(yLegend);
						
			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);

			// Fade
			horizontalBar.setValues(values);
			horizontalBar.setAlpha('0.8');
			horizontalBar.setColor('##82BEF4');
			chart.addElement(horizontalBar);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>

	</cffunction>

	<cffunction name="getThreeDBarChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON 3D Bar Chart');
			var threeD = CreateObject('component','ofc-cfc.lib.chart.bar.ThreeD').init();
			var threeD2 = CreateObject('component','ofc-cfc.lib.chart.bar.ThreeD').init();
			var xAxis = CreateObject('component','ofc-cfc.lib.element.axis.XAxis').init();
			var yAxis = CreateObject('component','ofc-cfc.lib.element.axis.YAxis').init();
			
			// X-axis
			xAxis.setColor('##155191');
			xAxis.setGridColor('##BEDFF1');
			xAxis.setSteps(1);
			xAxis.setIsOffset(true);
			xAxis.setMinimum(0);
			xAxis.setMaximum(10);
			xAxis.setThreeD(5);
			xAxis.setStroke(3);
			xAxis.setTickHeight(5);
			chart.setXAxis(xAxis);			
			
			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);

			// 3D
			threeD.setValues( getDummyValues() );
			threeD.setColor('##424581');
			threeD.setTooltip('My y-value= ##val## <br>My x-value = ##x_label##');
			chart.addElement(ThreeD);

			// 3D
			threeD2.setValues( getDummyValues() );
			threeD2.setColor('##66ABEC');
			threeD2.setTooltip('My y-value= ##val## <br>My x-value = ##x_label##');
			chart.addElement(ThreeD2);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>

	<cffunction name="getLineChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Line Chart');
			var line = CreateObject('component','ofc-cfc.lib.chart.Line').init();

			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);

			//Line
			line.setValues( getDummyValues() );
			line.setWidth(1);
			line.setHaloSize(0);
			line.setDotSize(0);
			line.setColor('##EF7C05');
			chart.addElement(line);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>

	<cffunction name="getDottedLineChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Dotted Line Chart');
			var dottedLine = CreateObject('component','ofc-cfc.lib.chart.line.Dot').init();
			var dottedLineStyle = CreateObject('component','ofc-cfc.lib.chart.line.DottedLineStyle').init(strokeLengthOn=1,strokeLengthOff=5);
			var keyText = CreateObject('component','ofc-cfc.lib.element.KeyText').init(text='My Dotted Line',fontSize=12);

			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);

			// Dotted Line
			dottedLine.setKeyText(keyText);
			dottedLine.setValues( getDummyValues() );
			dottedLine.setWidth(2);
			dottedLine.setHaloSize(0);
			dottedLine.setDotSize(3);
			dottedLine.setDottedLineStyle(dottedLineStyle);
			dottedLine.setColor('##EF7C05');
			chart.addElement(dottedLine);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>

	<cffunction name="getHollowLineChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Hollow Line Chart');
			var hollowLine = CreateObject('component','ofc-cfc.lib.chart.line.Hollow').init();

			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);

			// Hollow Line
			hollowLine.setValues( getDummyValues() );
			hollowLine.setWidth(1);
			hollowLine.setHaloSize(1);
			hollowLine.setDotSize(3);
			hollowLine.setColor('##006666');
			hollowLine.setTooltip('My y-value= ##val## <br>My x-value = ##x_label##');
			chart.addElement(hollowLine);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>

	<cffunction name="getPieChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Pie Chart');
			var pie = CreateObject('component','ofc-cfc.lib.chart.Pie').init();

			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);

			//Pie
			pie.setColors( ListToArray('##82BEF4,##8098B2,##0081CE,##323287,##82BEF4,##8098B2,##0081CE,##323287'));
			pie.setIsLabels(true);
			pie.setStartAngle(90);
			pie.setOnClick('alert("Did you click me?")');
			
			// Values
			pievalue1 = CreateObject('component','ofc-cfc.lib.chartvalue.Pie').init();
			pievalue1.setValue(RandRange(1,100));
			pievalue1.setLabel('Free');
			pievalue1.setLabelColor('##000000');
			pie.addValue(pievalue1);
			pievalue2 = CreateObject('component','ofc-cfc.lib.chartvalue.Pie').init();
			pievalue2.setValue( (100-pievalue1.getValue()) );
			pievalue2.setLabel('Used');
			pievalue2.setLabelColor('##000000');
			pievalue2.setFontSize(10);
			pie.addValue(pievalue2);
			pievalue1.getSWFData();
			pie.setTooltip('My value= ##val## <br>and I can write some text if I want');
			pie.setIsAnimate(true);
			chart.addElement(pie);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>

	<cffunction name="getHollowAreaChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Hollow Area Chart');
			var hollowArea = CreateObject('component','ofc-cfc.lib.chart.area.Hollow').init();

			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);
			
			//hollowArea 
			hollowArea.setValues( getDummyValues() );
			hollowArea.setFillAlpha(0.5);
			hollowArea.setFillColor('##ffffff');
			hollowArea.setIsLoop(true);
			hollowArea.setWidth(3);
			hollowArea.setHaloSize(2);
			hollowArea.setDotSize(5);
			hollowArea.setColor('##82BEF4');
			hollowArea.setTooltip('My y-value= ##val## <br>My x-value = ##x_label##');
			chart.addElement(hollowArea);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>

	<cffunction name="getLineAreaChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Line Area Chart');
			var lineArea = CreateObject('component','ofc-cfc.lib.chart.area.Line').init();

			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);
			
			lineArea.setValues( getDummyValues() );
			lineArea.setFillAlpha(0.5);
			lineArea.setFillColor('##ffffff');
			lineArea.setIsLoop(true);
			lineArea.setWidth(3);
			lineArea.setHaloSize(3);
			lineArea.setDotSize(7);
			lineArea.setColor('##82BEF4');
			lineArea.setTooltip('My y-value= ##val## <br>My x-value = ##x_label##');
			chart.addElement(lineArea);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>

	<cffunction name="getScatterChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Scatter Chart');
			var scatter = CreateObject('component','ofc-cfc.lib.chart.Scatter').init();
			var scattervalue1 = CreateObject('component','ofc-cfc.lib.chartvalue.Scatter').init();
			var scattervalue2 = CreateObject('component','ofc-cfc.lib.chartvalue.Scatter').init();
			var xAxis = CreateObject('component','ofc-cfc.lib.element.axis.XAxis').init();
			var yAxis = CreateObject('component','ofc-cfc.lib.element.axis.YAxis').init();

			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);
			
			// X-axis
			xAxis.setColor('##155191');
			xAxis.setGridColor('##BEDFF1');
			xAxis.setSteps(1);
			xAxis.setIsOffset(true);
			xAxis.setMinimum(0);
			xAxis.setMaximum(10);
			//xAxis.setThreeD(5);
			xAxis.setStroke(3);
			xAxis.setTickHeight(5);
			chart.setXAxis(xAxis);
			
			// Y-axis
			yAxis.setColor('##155191');
			yAxis.setGridColor('##B8D0DC');
			yAxis.setSteps(2);
			//yAxis.setMinimum(2);
			//yAxis.setMaximum(40);
			yAxis.setRange(0,10);
			yAxis.setTickLength(5);
			chart.setYAxis(yAxis);			
			
			scatter.setWidth(3);
			scatter.setDotSize(7);
			scatter.setColor('##000');
			scattervalue1.setTooltip('My value=50');
			scattervalue1.setValue(50);
			scattervalue1.setDotSize(5);
			scattervalue1.setX(0);
			scattervalue1.setY(5);
			scatter.addValue(scatterValue1);
			scattervalue2.setTooltip('My value=50');
			scattervalue2.setValue(90);
			scattervalue2.setDotSize(5);
			scattervalue2.setX(5);
			scattervalue2.setY(7);
			scatter.addValue(scatterValue2);
			chart.addElement(scatter);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>
		
	<cffunction name="getCombinedChartData" access="public" returntype="string" output="false" hint="Returns JSON data">
		<cfargument name="Event" type="any">
		<cfscript>
			var chart = CreateObject('component','ofc-cfc.lib.ChartData').init();
			var title = CreateObject('component','ofc-cfc.lib.element.Title').init('Demo JSON Combined Chart');
			var line = CreateObject('component','ofc-cfc.lib.chart.Line').init();
			var bar = CreateObject('component','ofc-cfc.lib.chart.Bar').init();
			var keyTextBar = CreateObject('component','ofc-cfc.lib.element.KeyText').init(text='My Bar',fontSize=12);
			var keyTextLine = CreateObject('component','ofc-cfc.lib.element.KeyText').init(text='My Line',fontSize=12);

			// Set chart title
			title.setStyle('font-size:10px;font-weight:bold; color:##ffffff');
			chart.setTitle(title);
			//chart.setBackGroundColor('##DDE4EB');

			// Bar
			bar.setValues( getDummyValues() );
			bar.setAlpha('0.8');
			bar.setColor('##CC0000');
			
			// displays legend key on top
			bar.setKeyText(keyTextBar);
			
			// Add bar element to chart
			chart.addElement(bar);

			//Line
			line.setValues( getDummyValues() );
			line.setKeyText(keyTextLine);
			line.setTooltip('My y-value= ##val## <br>My x-value = ##x_label##');
			line.setWidth(2);
			line.setHaloSize(5);
			line.setDotSize(1);
			line.setColor('##FFFF00');
			chart.addElement(line);

			return getPlugin("JSON").encode(data:chart.getSWFData(),structKeyCase:"lower");
		</cfscript>
	</cffunction>

	<cffunction name="getDummyValues" access="public" returntype="array" output="false" hint="Returns a dummy value list">
		<cfscript>
			var i= 0;
			var dummyValues = ArrayNew(1);
			
			for(i=0;i lte 10;i=i+1){
				ArrayAppend(dummyValues,RandRange(1,9));
			}
			return dummyValues;
		</cfscript>
	</cffunction>
	
</cfcomponent>