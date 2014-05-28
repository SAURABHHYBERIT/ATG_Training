<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  ALBUM DETAILS
  
  Description of an album and list of songs.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <dsp:include page="common/head.jsp">
    	<dsp:param name="title" value="Dynamusic Album" />
    </dsp:include>
  </HEAD>
  <BODY>

  <dsp:droplet name="/dynamusic/AlbumLookupDroplet">
    <dsp:param name="id" param="itemId"/>
    <dsp:oparam name="output">

    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" param="element.title"/>
    </dsp:include>
    
     <div class="sidebar">
    	<dsp:include page="common/sidebar.jsp"></dsp:include>
    	<dsp:a href="newSong.jsp">
             <dsp:param name="albumId" param="itemId"/>
            Add Song
          </dsp:a>
    </div>
    
    <div class="page-body">
	
              <img src="<dsp:valueof param='element.coverURL'/>">
              <dsp:valueof param="element.description"/>
                  
		  <p><b>Published: <dsp:valueof param="element.date" date="MM dd,yyyy"/></b></p>
Genre:<br />
	<dsp:valueof param="element.genre" />
	<br /><br />
Artists:<br>
            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
              <dsp:param name="array" param="element.artists"/>
              <dsp:oparam name="outputStart">
                <ul>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </ul>
              </dsp:oparam>
              <dsp:oparam name="output">
 							  
                <li>
                   <dsp:a href="artistDetails.jsp">
	                    <dsp:param name="itemId" param="element.id"/>
                      <dsp:valueof param="element.name"/>
                   </dsp:a>
            
              </dsp:oparam>
              <dsp:oparam name="empty">
                No songs listed for this album.
              </dsp:oparam>
            </dsp:droplet>

Songs:<br>
            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
              <dsp:param name="array" param="element.songList"/>
              <dsp:oparam name="outputStart">
                <ul>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </ul>
              </dsp:oparam>
              <dsp:oparam name="output">
 							  
                <li>
                   <dsp:a href="song.jsp">
	                    <dsp:param name="itemId" param="element.id"/>
                      <dsp:valueof param="element.title"/>
                   </dsp:a>
            
              </dsp:oparam>
              <dsp:oparam name="empty">
                No songs listed for this album.
              </dsp:oparam>
            </dsp:droplet>

    </dsp:oparam>
    <dsp:oparam name="empty">
        No album with ID=<dsp:valueof param="itemId">NONE</dsp:valueof> was found, sorry.
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