<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<dsp:importbean bean="/dynamusic/SongSearchFormHandler"/>
<!-------------------------------------------------------------
  Dynamusic Site                                DAF Site Mockup
  
  SEARCH RESULTS
  
  Display results of a user search, as links to song, artist,
  and album pages.
  
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <dsp:include page="common/head.jsp">
    	<dsp:param name="title" value="Dynamusic Search Results" />
    </dsp:include>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
         <dsp:param name="pagename" value="Search"/>
    </dsp:include>
    <table width="700" cellpadding="8">
      <tr>
        <!-- Sidebar -->
        <td width="100" bgcolor="ghostwhite" valign="top">
          <!-- (replace contents of this table cell by 
                dynamically including common/sidebar.html) -->
          <dsp:include page="common/sidebar.jsp"></dsp:include>
        </td>
        <!-- Page Body -->
        <td valign="top">
          <font face="Verdana,Geneva,Arial" size="-1">
          
          <!-- *** Start page content *** -->
          
            <p>The following songs match your criteria, <font color="red"><dsp:valueof bean="SongSearchFormHandler.keywordInput"/></font>: <p>
            <dsp:droplet name="/atg/dynamo/droplet/ForEach">
              <dsp:param bean="SongSearchFormHandler.searchResults" name="array"/>
              <dsp:oparam name="outputStart">
                <ul>
              </dsp:oparam>
              <dsp:oparam name="outputEnd">
                </ul>
              </dsp:oparam>
              <dsp:oparam name="output">
                <li><dsp:a href="song.jsp">
                      <dsp:param name="itemId" param="element.id"/>
                      <dsp:valueof param="element.title"/>
                 </dsp:a> by
                     <dsp:a href="artistDetails.jsp">
                       <dsp:param name="itemId" param="element.artist.id"/>
                      <dsp:valueof param="element.artist.name"/>
                     </dsp:a>

              </dsp:oparam>
              <dsp:oparam name="empty">
                Sorry, no songs matched your search criteria.
              </dsp:oparam>
            </dsp:droplet>
            
          <!-- *** End real content *** -->
          
          </font>
        </td>
      </tr>
    </table>
  </BODY>
</HTML>
</dsp:page>