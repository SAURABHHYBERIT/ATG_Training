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
			 <dsp:form action="quiz.jsp">

				<dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
					<dsp:oparam name="output">
						<b><dsp:valueof param="message" /></b>
						<br>
					</dsp:oparam>
					<dsp:oparam name="outputStart">
						<LI>
					</dsp:oparam>
					<dsp:oparam name="outputEnd">
						</LI>
					</dsp:oparam>
				</dsp:droplet>

				<table cellpadding="10" border=0>
					<tr>
						<td valign="middle" align="right"></td>
						<td valign="middle"><font face="Courier New" size="-1">
						<dsp:valueof bean="QuizFormHandler.question" /></font></td>
					</tr>
					<td valign="middle" align="right">Answer:</td>
					<td valign="middle"><font face="Courier New" size="-1">
					<dsp:input type="text" size="30"
						bean="QuizFormHandler.userAnswer" /> </font></td>
					</tr>
					<tr>
						<td></td>
						<td><dsp:input type="hidden"
							bean="QuizFormHandler.validateSuccessURL" value="quizAnswer.jsp" />
						<dsp:input type="submit"
							bean="QuizFormHandler.validate" value="Submit answer!" /> &nbsp;</td>
				</table>
			</dsp:form> <!-- *** End real content *** --> </font></td>
		</tr>
	</table>
	</body>
	</html>
</dsp:page>