<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/dynamusic/FeaturedSongs"/>

<!-------------------------------------------------------------
  Dynamusic Site             DAF Site Mockup
  
  HOME
  
  Central page for the site; landing point following login, 
  providing starting point for site's pages.
  
  Version 4 - adds slot to advertise concerts for viewed 
              artists.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <dsp:include page="common/head.jsp">
    	<dsp:param name="title" value="Dynamusic Home" />
    </dsp:include>
  </HEAD>
  <BODY>
    <!-- (replace this entire section by dynamically including 
          common/header.jsp) -->
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="Home Page"/>
    </dsp:include>
    <!-- (end header banner) -->
    
    <div class="sidebar">
    	<dsp:include page="common/sidebar.jsp"></dsp:include>
    </div>
    
    <div class="page-body">
                <dsp:droplet name="/atg/dynamo/droplet/Switch">
                  <dsp:param bean="Profile.transient" name="value"/>
                  <dsp:param name="showParameter" value="odd" />
                  <dsp:oparam name="true">
                     Welcome to Dynamusic.  <a href="newProfile.jsp">Click here</a> to register. <p>
                  </dsp:oparam>
                  <dsp:oparam name="false">
                    <p>Welcome, <dsp:valueof bean="Profile.firstName"/><p>
                  </dsp:oparam>
                </dsp:droplet>
                    <br />
                  
                  This week's featured songs are:

                  <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                    <dsp:param bean="FeaturedSongs.songs" name="array"/>
                    <dsp:oparam name="outputStart">
                      <ul>
                    </dsp:oparam>
                    <dsp:oparam name="outputEnd">
                      </ul>
                    </dsp:oparam>
                    <dsp:oparam name="output">
                      <li><dsp:valueof param="element"/>
                  
                    </dsp:oparam>
                    <dsp:oparam name="empty">
                      No featured songs this week.
                    </dsp:oparam>
                  </dsp:droplet>

                  Playing at a venue near you... <p>
                  <ul>
                    <li> 22 May 2011 - <a href="concertDetails.html">Autumn Winters at the Boston Concert Hall</a>
                    <li> 18 October 2011 - <a href="concertDetails.html">Charlie Grassfield at the Moncton Opera House</a>
                    <li> 14 June 2011 - <a href="concertDetails.html">Frida Jetsen at Jefferson Hall</a>
                  </ul>
    	
    	
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
