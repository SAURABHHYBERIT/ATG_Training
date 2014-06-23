<dsp:page>

  <%-- 
      This gadget renders the shopper's online credits as payment options 
  --%>

  <dsp:importbean bean="/atg/commerce/claimable/AvailableStoreCredits"/>  
  <dsp:importbean bean="/atg/store/order/purchase/BillingFormHandler"/>
  <dsp:importbean bean="/atg/dynamo/droplet/Compare"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/atg/userprofiling/PropertyManager"/>
  <dsp:getvalueof var="order" param="order"/> 

  <dsp:droplet name="Compare">
    <dsp:param bean="Profile.securityStatus" name="obj1" converter="number"/>
    <dsp:param bean="PropertyManager.securityStatusBasicAuth" name="obj2" converter="number"/>
    <dsp:oparam name="greaterthan">

      <%-- User has explicitly logged in --%>
          <dsp:droplet name="AvailableStoreCredits">
            <dsp:param name="profile" bean="Profile"/>
            <dsp:oparam name="output">

              <dsp:getvalueof var="onlineCredits" vartype="java.lang.Object" param="storeCredits"/> 
              <c:choose>
                <c:when test="${(not empty onlineCredits)}">
                 <c:set var="creditAvailable" scope="request" value="${true}" />           
                	<c:if test="${order.useCredit}">
                  
                      <c:set var="overallAmount" value="0"/>  
                      <c:forEach var="onlineCredit" items="${onlineCredits}" varStatus="onlineCreditStatus">
                        <dsp:setvalue param="storeCredit" value="${onlineCredit}"/>
                        <dsp:getvalueof var="storeCredit" param="storeCredit"/>
                        
                        <c:if test="${not empty storeCredit}">
                          <dsp:getvalueof var="amountRemaining" vartype="java.lang.Double" param="storeCredit.amountAvailable"/>
                          <c:set var="overallAmount" value="${overallAmount + amountRemaining}"/>
                        </c:if>
                      </c:forEach>
                      
                      <c:set var="storeCreditAmount" scope="request" value="${overallAmount}" />
                      
                      </c:if>
                      
                </c:when>
                <c:otherwise>
                	<c:set var="creditAvailable" scope="request" value="${false}" />
                
                </c:otherwise>
              </c:choose>

            </dsp:oparam> 
          </dsp:droplet> <%-- OnlineCredits --%>
          
    </dsp:oparam>
  </dsp:droplet><%-- End check user's security status --%>

</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/COMM/StudentFiles/COM/setup/copy-files/apps/MyStore/Storefront/j2ee-apps/Storefront/store.war/checkout/gadgets/onlineCredit.jsp#3 $$Change: 635816 $--%>
