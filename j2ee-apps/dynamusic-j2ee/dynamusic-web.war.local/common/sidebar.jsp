<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
	<dsp:importbean bean="/atg/userprofiling/Profile"/>

	<a href="home.jsp">Home</a> <br>
	<a href="artists.jsp">Artists</a> 
	<a href="venues.jsp">Venues</a> 
	<a href="search.jsp">Search</a> 
	<dsp:droplet name="/atg/dynamo/droplet/Switch">
		<dsp:param bean="Profile.transient" name="value"/>
		<dsp:oparam name="true">
			<a href="login.jsp">Log In</a> <br>
		</dsp:oparam>
		<dsp:oparam name="false">
			<a href="updateProfile.jsp">Profile</a> 
			<a href="interests.jsp">Interests</a>
			<a href="playlists.jsp">Playlists</a> 
			<br>
			<a href="logout.jsp">Log Out</a> <br>
		</dsp:oparam>
	</dsp:droplet>
 
 </dsp:page>

