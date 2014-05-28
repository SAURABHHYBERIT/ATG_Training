<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

<dsp:importbean bean="/atg/targeting/RepositoryLookup"/>

  
<HTML>
  <HEAD>
    <dsp:include page="common/head.jsp">
    	<dsp:param name="title" value="Dynamusic Artist" />
    </dsp:include>
  </HEAD>
  <BODY>


  <dsp:droplet name="/dynamusic/ArtistLookupDroplet">
    <dsp:param name="id" param="itemId"/>
    <dsp:oparam name="empty">
      Artist with ID <dsp:valueof param="itemId">NONE</dsp:valueof> not found.
    </dsp:oparam>
    <dsp:oparam name="output">

<dsp:droplet name="/dynamusic/ViewItemEventSender">
       <dsp:param name="eventobject" param="element"/>
</dsp:droplet>

    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" param="element.name"/>
    </dsp:include>
    
    
     <div class="sidebar">
    	<dsp:include page="common/sidebar.jsp"></dsp:include>
    	<br />
    	<dsp:a href="newAlbum.jsp"><dsp:param name="artistId" param="element.id"/>Add Album</dsp:a>
               <br>
               <dsp:a href="editArtist.jsp"><dsp:param name="artistId" param="element.id"/>Edit Artist Info</dsp:a>
    </div>
    
    <div class="page-body">
		  

            
                  <img src="<dsp:valueof param='element.photoURL'/>">
            
                    <dsp:valueof param="element.description"/>

<p>Albums:
			<dsp:droplet name="/atg/dynamo/droplet/ForEach">
				<dsp:param name="array" param="element.albums" />
				 <dsp:oparam name="outputStart">
                <ul>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </ul>
              </dsp:oparam>
              <dsp:oparam name="output">

                <li><dsp:a href="albumDetails.jsp">
                      <dsp:param name="itemId" param="element.id"/>
                      <dsp:valueof param="element.title"/>
                    </dsp:a>
            
              </dsp:oparam>
              <dsp:oparam name="empty">
                No albums found for this artist.
              </dsp:oparam>
			</dsp:droplet>
          
    </div>
    <div class="featured">
		Featured Album:<br /> <br />
		<a href="albumDetails.html">
			<img src="images/FieldsAndStreams.jpg"><br />
		</a>
   	</div>
    


   </dsp:oparam>
 </dsp:droplet>

  </BODY>
</HTML>
</dsp:page>