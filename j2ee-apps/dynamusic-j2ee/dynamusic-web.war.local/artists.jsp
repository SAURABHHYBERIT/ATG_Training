<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>


<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  ARTISTS
  
  List of artists whose songs appear on this site. 
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <dsp:include page="common/head.jsp">
    	<dsp:param name="title" value="Dynamusic Artists" />
    </dsp:include>
  </HEAD>
  <BODY>

  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Artists"/>
  </dsp:include>
  
   <div class="sidebar">
    	<dsp:include page="common/sidebar.jsp"></dsp:include>
    	<br>
        <a href="newArtist.jsp">Add Artist</a>
    </div>
    
    <div class="page-body">
		 <dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
            <dsp:param name="queryRQL" value='ALL ORDER BY name'/>
            <dsp:param name="repository" value="/dynamusic/SongsRepository"/>
            <dsp:param name="itemDescriptor" value="artist"/>
            <dsp:oparam name="outputStart">
              <ol>
            </dsp:oparam>
            <dsp:oparam name="outputEnd">
              </ol>
            </dsp:oparam>
            <dsp:oparam name="output">
              <li>
                <dsp:a href="artistDetails.jsp">
                  <dsp:param name="itemId" param="element.id" />
                  <dsp:valueof param="element.name"/>
                </dsp:a>  
            </dsp:oparam>
            <dsp:oparam name="empty">
              <p>No artists currently available, sorry.
            </dsp:oparam>
          </dsp:droplet>
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

