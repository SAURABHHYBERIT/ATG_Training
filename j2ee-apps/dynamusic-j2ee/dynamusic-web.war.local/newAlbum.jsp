<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/EnumForEach"/>
<dsp:importbean bean="/dynamusic/AlbumFormHandler"/>

<% /* input parameters: artistId (required) */ %>

<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  NEW ALBUM
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <dsp:include page="common/head.jsp">
    	<dsp:param name="title" value="Dynamusic New Album" />
    </dsp:include>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
        <dsp:param name="pagename" value="Add Album"/>
    </dsp:include>    
    
        <div class="sidebar">
    	<dsp:include page="common/sidebar.jsp"></dsp:include>
    </div>
    
    <div class="page-body">
    	 <dsp:droplet name="/dynamusic/ArtistLookupDroplet">
            <dsp:param name="id" param="artistId"/>
            <dsp:oparam name="empty">
               Artist with ID <dsp:valueof param="artistId">NONE</dsp:valueof> not found.
            </dsp:oparam>
            <dsp:oparam name="output">
 
 			<div class="form-div">
 			
               <dsp:form action="newAlbum.jsp" method="post">
               
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
      
<!-- TBD: check for itemId -->
              <dsp:input bean="AlbumFormHandler.value.artists.repositoryIds"
                   type="hidden" 
                   paramvalue="artistId"/>
              
			<span class="form-field">
                      Artist Name:
                     <dsp:valueof param="element.name"/>
			</span>
			<span class="form-field">
                       Album Name:
                       <dsp:input bean="AlbumFormHandler.value.title" size="24" 
                                  type="text" required="<%=true%>"/>
			</span>			
			<span class="form-field">
			</span>                 
                      Image Path:
                       <dsp:input bean="AlbumFormHandler.value.coverURL" size="24" 
                                  type="text"/> <br />
			<span class="form-field">
                      Publication Date <i>(mm/dd/yyyy)</i>:  
                      <dsp:input bean="AlbumFormHandler.value.date" 
                                 date="M/dd/yyyy" name="date" size="24" type="text"/>
			</span>             
			<span class="form-field">
                       Description:
                       <dsp:textarea 
                          bean="AlbumFormHandler.value.description" 
                          name="description" cols="40" rows="6" 
                          wrap="SOFT"/> <br /> <br />
			</span>                                 
                  
                   <dsp:input type="hidden" bean="AlbumFormHandler.createSuccessURL" value="success.jsp"/>
                   <input type="hidden" name="artistId" value="<dsp:valueof param='artistId'/>" />
                   <dsp:input type="submit" value="Add Album" bean="AlbumFormHandler.create"/>
                   <dsp:input type="submit" value="Cancel" bean="AlbumFormHandler.cancel"/>
               </dsp:form>
 			</div>
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