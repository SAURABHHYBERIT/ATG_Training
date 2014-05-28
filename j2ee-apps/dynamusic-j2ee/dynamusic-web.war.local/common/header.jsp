<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
<!-------------------------------------------------------------
  Dynamusic Site Mockup
  
  Header
  
  Page fragment displaying the site's header, common to all 
  pages.
  
  ------------------------------------------------------------->
	<div class="header">
		<dsp:img id="header-image" src="../images/Dynamusicbk.jpg"/><br />
		<font face="Bradley Hand ITC,Verdana,Geneva,Arial" size="+3" >
			<dsp:valueof param="pagename"></dsp:valueof>
		</font>
		<hr id="header-separator" />
	</div>
</dsp:page> 