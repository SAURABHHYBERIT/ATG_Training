<%@ taglib uri="/dspTaglib" prefix="dsp"%>
<dsp:page>
<dsp:importbean bean="/dynamusic/QuizFormHandler" />
	<html>
	<head>
	<dsp:include page="common/head.jsp">
    	<dsp:param name="title" value="Dynamusic Quiz" />
    </dsp:include>
	</head>
	<body>
	<dsp:include page="common/header.jsp">
		<dsp:param name="pagename" value="Quiz" />
	</dsp:include>

	<table width="700" cellpadding="8">
		<tr>
			<!-- Sidebar -->
			<td width="100" bgcolor="ghostwhite" valign="top"><dsp:include
				page="common/sidebar.jsp"></dsp:include></td>
				
			<!-- Page Body -->
			<td valign="top"><font face="Verdana,Geneva,Arial" size="-1">

			<!-- *** Start page content *** -->
			
			<dsp:droplet name="/atg/dynamo/droplet/Switch" >
				<dsp:param name="value" bean="QuizFormHandler.correctAnswer" />
				<dsp:oparam name="true">
					Answer correct!
				</dsp:oparam>
				<dsp:oparam name="false">
					Wrong... too bad
				</dsp:oparam>
			</dsp:droplet>
			 
			<!-- *** End real content *** --> </font></td>
		</tr>
	</table>
	</body>
	</html>
</dsp:page>