<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
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
                    
                    <dsp:droplet name="/dynamusic/ShowInterests">
                    	<dsp:param name="interests" bean="Profile.interests"/>
                    	<dsp:param name="showParameter" value="${param.showProp}"/>
                    	<dsp:oparam name="output">
                    		<span class="interest">
                    			<span class="interestName">
                    				<dsp:valueof param="interestName" />
                    			</span>
                    			<span class="interestRating">
                    				<dsp:valueof param="interestRating" />
                    			</span> 
                    				<dsp:a href="editInterest.jsp">Edit
                    					<dsp:param name="key" param="interestName" />
                    					<dsp:param name="value" param="interestRating" />
                    				</dsp:a>
                    		</span>
                    	</dsp:oparam>
                    	<dsp:oparam name="empty">
                    		No interests found
                    	</dsp:oparam>
                    </dsp:droplet>
                  
                  <hr />
                  Average rating - <dsp:valueof bean="Profile.interestsAvgRating" />
                  <hr />
                  
                  <a href="newInterest.jsp" >Add Interest</a> 
                  <form action="interests.jsp" >
                  Display:
                  	<select name="showProp">
                  		<option value="">All</option>
                  		<option value="odd">Odd</option>
                  		<option value="even">Even</option>
                  	</select>
                  	<input type="submit" value="Go" />
                  </form>               
                  
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

