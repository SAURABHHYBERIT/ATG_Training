<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<!-------------------------------------------------------------
  Dynamusic Site                                DAF Site Mockup
  
  CONCERT DETAILS
  
  Display details of a given concert, including participating 
  artists.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <dsp:include page="common/head.jsp">
    	<dsp:param name="title" value="Dynamusic Venues" />
    </dsp:include>
  </HEAD>
  <BODY>
   <dsp:droplet name="/dynamusic/ConcertLookupDroplet">
    <dsp:param name="id" param="itemId"/>
    <dsp:oparam name="output">

       <dsp:include page="common/header.jsp">
          <dsp:param name="pagename" param="element.name"/>
       </dsp:include>
       
       
       <div class="sidebar">
    	<dsp:include page="common/sidebar.jsp"></dsp:include>
    </div>
    
    <div class="page-body">
    	<img src="<dsp:valueof param='element.imageURL'/>">
               <b>
                 <dsp:valueof param="element.name"/><br>
                 <dsp:valueof param="element.venue.name"/><br>
                 <dsp:valueof param="element.date" date="MMM dd,yyyy"/><br>
               </b>
          <p>&nbsp;<p>
          <dsp:valueof param="element.description"/>
          <p>
          Artists:
          <p> 
          <dsp:droplet name="/atg/dynamo/droplet/ForEach">
            <dsp:param name="array" param="element.artists"/>
            <dsp:oparam name="outputStart">
              <ul>
            </dsp:oparam>
            <dsp:oparam name="outputEnd">
              </ul>
            </dsp:oparam>
            <dsp:oparam name="output">
              <li><dsp:a href="artistDetails.jsp">
                  <dsp:param name="itemId" param="element.id"/>
                  <dsp:valueof param="element.name"/>
                </dsp:a>
            </dsp:oparam>
            <dsp:oparam name="empty">
              No artists found for this event.
            </dsp:oparam>
          </dsp:droplet>
               
          <dsp:droplet name="/atg/dynamo/droplet/Switch">
             <dsp:param name="value" param="element.concertType"/>
             <dsp:oparam name="fundraiser">
                 This concert is a fundraiser for: 
                 		<dsp:valueof param="element.organization"/>
               		</b>
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