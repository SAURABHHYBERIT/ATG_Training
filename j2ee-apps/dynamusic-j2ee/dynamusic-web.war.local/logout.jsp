<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  LOGOUT
  
  Allow user to log out.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <dsp:include page="common/head.jsp">
    	<dsp:param name="title" value="Dynamusic Logout" />
    </dsp:include>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Logout"/>
    </dsp:include>
    
        <div class="sidebar">
    	<dsp:include page="common/sidebar.jsp"></dsp:include>
    </div>
    
    <div class="page-body">
    	 <p>Thanks for coming by!  Click below to log out: <p>

            <dsp:form action="logout.jsp" method="post">
            
              <!-- Default form error handling support -->
              <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                <dsp:oparam name="output">
                  <b><dsp:valueof param="message"/></b><br>
                </dsp:oparam>
                <dsp:oparam name="outputStart">
                  <LI>
                </dsp:oparam>
                <dsp:oparam name="outputEnd">
                  </LI>
                </dsp:oparam>
              </dsp:droplet>
            
              <!-- defines the URL to go to on success (relative to 'action')-->
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.logoutSuccessURL" type="hidden" value="home.jsp"/>
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.logout" type="Submit" value="Logout"/>
            
            </dsp:form>
    </div>
    <div class="featured">
		Featured Album:<br /> <br />
		<a href="albumDetails.html">
			<img src="images/FieldsAndStreams.jpg"><br />
		</a>
   </div>

  </BODY>
</HTML>
</dsp:page>