<%@ taglib uri="/dspTaglib" prefix="dsp" %>

<dsp:page>

<dsp:importbean bean="/dynamusic/ArtistFormHandler"/>

<!-------------------------------------------------------------
  Dynamusic Site                                DAF Site Mockup
  
  EDIT ARTIST
  
  Modify description of an artist and her/his list of albums.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <dsp:include page="common/head.jsp">
    	<dsp:param name="title" value="Dynamusic Artist" />
    </dsp:include>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Edit Artist"/>
  </dsp:include>
    
     <div class="sidebar">
    	<dsp:include page="common/sidebar.jsp"></dsp:include>
    </div>
    
    <div class="page-body">
		
		<dsp:setvalue bean="ArtistFormHandler.repositoryId" paramvalue="artistId"/>
            
					<dsp:form action="editArtist.jsp">

                 <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                   <dsp:oparam name="output">
                   <span class="error-message">
                     <dsp:valueof param="message"/>
                     </span>
                     <br>
                   </dsp:oparam>
                   <dsp:oparam name="outputStart">
                     <li>
                   </dsp:oparam>
                   <dsp:oparam name="outputEnd">
                     </li>
                   </dsp:oparam>
                 </dsp:droplet>
						<dsp:input bean="ArtistFormHandler.repositoryId" type="hidden" paramvalue="artistId"/>
						
						
						<div class="form-div">
						
		                   	<span class="name-field">Artist Name:</span>
		                      <dsp:input type="text" bean="ArtistFormHandler.value.name"/><br />
								<dsp:input type="hidden" bean="ArtistFormHandler.updateSuccessURL" value="success.jsp"/> 
								<dsp:input type="hidden" bean="ArtistFormHandler.deleteSuccessURL" value="success.jsp"/>
		                   	<span class="name-field">Description:</span>
		                      <dsp:textarea 
		                         bean="/dynamusic/ArtistFormHandler.value.description" 
		                         name="description" cols="60" rows="10" 
		                         wrap="SOFT"/>
								
						</div>	
                         <br />
                    Albums:
                  <dsp:droplet name="/dynamusic/ArtistLookupDroplet">
                    <dsp:param name="id" param="artistId"/>
                    <dsp:oparam name="output">
                 	   <dsp:droplet name="/atg/dynamo/droplet/ForEach">
             			    <dsp:param name="elementName" value="album"/>        
                	    <dsp:param name="array" param="element.albums"/>
              				<dsp:oparam name="outputStart">
                				<ul>
              				</dsp:oparam>
              				<dsp:oparam name="outputEnd">
                				</ul>
              				</dsp:oparam>
              				<dsp:oparam name="output">
                				<li><dsp:a href="albumDetails.jsp">
                      		<dsp:param name="itemId" param="album.id"/>
                      		<dsp:valueof param="album.title"/>
                    		</dsp:a>
              				</dsp:oparam>
              				<dsp:oparam name="empty">
                				No albums found for this artist.
              				</dsp:oparam>
                     </dsp:droplet>
                    </dsp:oparam>                                      
                  </dsp:droplet>
                  <br />
				<dsp:input type="submit" bean="ArtistFormHandler.update" value="Save Changes"/>
				<dsp:input type="submit" bean="ArtistFormHandler.delete" value="Delete This Artist"/>
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
