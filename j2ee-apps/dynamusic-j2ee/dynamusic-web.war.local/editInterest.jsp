<%@ taglib uri="/dspTaglib" prefix="dsp" %>

<dsp:page>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/dynamusic/InterestFormHandler"/>
<HTML>
  <HEAD>
    <dsp:include page="common/head.jsp">
    	<dsp:param name="title" value="Interests" />
    </dsp:include>
  </HEAD>
  <BODY>

  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Interests"/>
  </dsp:include>
  
   <div class="sidebar">
    	<dsp:include page="common/sidebar.jsp"></dsp:include>
    	<br>
    </div>
    
    <div class="page-body">
                    
               <dsp:setvalue bean="InterestFormHandler.repositoryId" beanvalue="Profile.id" />
               <dsp:setvalue bean="InterestFormHandler.editMapsAsLists" value="false" />
               
                   <dsp:form action="editInterest.jsp" method="post">
                   
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
                   
                    ${param.key}:
                    <dsp:input bean="InterestFormHandler.repositoryId" beanvalue="Profile.id" type="hidden" name="repId" />
                    <input name="key" value="${param.key}" type="hidden"/>
                   	<input name="newValue" value="${param.value}" size="5" />
                   	<dsp:input bean="InterestFormHandler.updateSuccessURL" type="hidden" value="interests.jsp" />
                   	<dsp:input bean="InterestFormHandler.deleteSuccessURL" type="hidden" value="interests.jsp" />
                   	<dsp:input bean="InterestFormHandler.updateErrorURL" type="hidden" value="editInterest.jsp" />
           			 <dsp:input bean="InterestFormHandler.update" type="Submit" value="Update"/>
           			 <dsp:input bean="InterestFormHandler.delete" type="Submit" value="Delete"/>
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

