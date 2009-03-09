<!--- CSS --->
<cfhtmlhead text='<link rel="stylesheet" href="includes/css/examplechart.css" type="text/css" />'>
<!--- jQuery --->
<cfhtmlhead text='<script type="text/javascript" src="includes/jquery/jquery.js"></script>'>
<!--- Flash Object js --->
<cfhtmlhead text='<script type="text/javascript" src="includes/open-flash-chart/swfobject.js"></script>'>
<!--- Example js --->
<cfhtmlhead text='<script type="text/javascript" src="includes/js/examplechart.js"></script>'>

<div id="examplebox">
	<div>
		<div id="title">Open Flash Chart - ColdFusion CFC Library</div>
		<div id="chartLoading"><!--- <img src="includes/img/ajax-loader.gif" /> --->Loading Chart Data</div>
		<br style="clear:both;">
		<div id="createdby">Created by Ernst van der Linden</div>
	</div>
	
	<br style="clear:both;">
	
	<div id="examplelist">
		<ul>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getBarChartData','exampleChart');" />Bar Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getSketchBarChartData','exampleChart');" />Sketch Bar Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getGlassBarChartData','exampleChart');" />Glass Bar Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getRoundGlassBarChartData','exampleChart');" />Round Glass Bar Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getFilledBarChartData','exampleChart');" />Filled Bar Chart</li>
			<!--- <li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getFadeBarChartData','exampleChart');" />Fade Bar Chart</li> --->
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getStackedBarChartData','exampleChart');" />Stacked Bar Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getThreeDBarChartData','exampleChart');" checked />3D Bar Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getHorizontalBarChartData','exampleChart');" />Horizontal Bar Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getCylinderBarChartData','exampleChart');" />Cylinder Bar Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getLineChartData','exampleChart');" />Line Chart</li>
			<!---
			NOT implemented yet in OFC 2.0
			 <li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getCandleChartData','exampleChart');" />Candle Chart</li> --->
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getDottedLineChartData','exampleChart');" />Dotted Line Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getHollowLineChartData','exampleChart');" />Hollow Line Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getPieChartData','exampleChart');" />Pie Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getHollowAreaChartData','exampleChart');" />Hollow Area Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getLineAreaChartData','exampleChart');" />Line Area Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getScatterChartData','exampleChart');" />Scatter Chart</li>
			<li><input name="selectChart" type="radio" onclick="loadJSON('ehChart.getCombinedChartData','exampleChart');" />Combined Chart</li>
		</ul>
	</div>
	<div id="chartcontainer">
	  <!--- We don't use swfobject.embedSWF(), only SWFObject static mode supports transparency  --->
      <object id="exampleChart" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="450" height="300">
        <param name="movie" value="includes/open-flash-chart/open-flash-chart.swf" />
        <param name="wmode" value="transparent" />
         <param name="flashvars" value='get-data=getOnLoadDataMyChart' />
        <!--[if !IE]>-->
        <object type="application/x-shockwave-flash" data="includes/open-flash-chart/open-flash-chart.swf" width="450" height="300">
			<param name="wmode" value="transparent" />
	         <param name="flashvars" value='get-data=getOnLoadDataMyChart' />
        </object>
        <!--<![endif]-->
      </object>
	
	</div>
	<br style="clear:both;">
	<div style="float:right;font-weight:bold;">
		Refresh
		<select style="margin-left:5px;" onchange="setRefreshTime(this.options[selectedIndex].value);">
			<option value="0">Disabled</option>
			<cfloop index="i" from="2000" to="10000" step="2000">
				<cfoutput>
				<option value="#i#">#(i/1000)# seconds</option>
				</cfoutput>
			</cfloop>
		</select>
	</div>
	
	<br style="clear:both;">
	
	<input type="button" value="Update from Server" onclick="loadJSON(currentColdBoxEventName,'exampleChart')" class="button" />
	<textarea id="JSONResultData" style="width:100%;height:125px;"><cfoutput>#rc.coldBoxEventResults#</cfoutput></textarea>
	<input type="button" value="Update from Textarea" onclick="swfobject.getObjectById('exampleChart').load(document.getElementById('JSONResultData').value);" class="button" />
</div>

<script type="text/javascript">
	
	// Show/hide 'loading' for all ajax calls	
	$('#chartLoading')
	.hide() // onload
	.ajaxStart(function() {
	    $(this).show();
	})
	.ajaxStop(function() {
	    $(this).hide();
	})
	;
	
	// onLoad coldbox event name
	var currentColdBoxEventName = '<cfoutput>#rc.coldBoxEventName#</cfoutput>';
	// onLoad data
	function getOnLoadDataMyChart() {
		return '<cfoutput>#rc.coldBoxEventResults#</cfoutput>';
	}
</script>