<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  LOGIN
  
  Allow user to log out.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <dsp:include page="common/head.jsp">
    	<dsp:param name="title" value="Dynamusic Login" />
    </dsp:include>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="login"/>
    </dsp:include>
    
        <div class="sidebar">
    	<dsp:include page="common/sidebar.jsp"></dsp:include>
    </div>
    
    <div class="page-body">
    	  <p><i> Please remind us who you are... </i><p>

            <dsp:form action="login.jsp" method="post">
            
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
            
              Login name: 
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.login" name="login" size="24" type="text"/><br>
            
              Password:
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.password" name="password" size="24" type="password"/><br>
            
              <!-- defines the URL to go to on success (relative to 'action')-->
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.loginSuccessURL" type="hidden" value="home.jsp"/>
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.login" type="Submit" value="Login"/>
            
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