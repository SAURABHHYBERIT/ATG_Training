package com.mystore.order.purchase;

import java.io.IOException;

import javax.servlet.ServletException;

import com.mystore.order.MyStoreOrder;

import atg.commerce.CommerceException;
import atg.droplet.DropletFormException;
import atg.projects.store.order.purchase.BillingInfoFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

public class MyStoreBillingInfoFormHandler extends BillingInfoFormHandler {
	
	@Override
	public void preSetupStoreCreditPaymentGroupsForOrder(
			DynamoHttpServletRequest pRequest,
			DynamoHttpServletResponse pResponse) throws ServletException,
			IOException {
		MyStoreBillingProcessHelper helper = (MyStoreBillingProcessHelper) getBillingHelper();
		MyStoreOrder myOrder = (MyStoreOrder) getOrder();
		try {
			if(myOrder.isReward()){
				helper.initializePointsPaymentGroup(getOrder(), getProfile());
			}
		} catch (CommerceException ce){
			addFormException(new DropletFormException(ce.getMessage(), null));
		}
	}
	
	@Override
	public void setupStoreCreditPaymentGroupsForOrder(
			DynamoHttpServletRequest pRequest,
			DynamoHttpServletResponse pResponse) throws ServletException,
			IOException {
		MyStoreBillingProcessHelper helper = (MyStoreBillingProcessHelper) getBillingHelper();
		MyStoreOrder myOrder = (MyStoreOrder) getOrder();
		logDebug("setting up store credit PG");
		if(myOrder.isCreditEligible() && myOrder.isUseCredit()){
			logDebug("setting up store credit PG true");
			super.setupStoreCreditPaymentGroupsForOrder(pRequest, pResponse);
			return;
		} else {
			helper.removeStoreCreditPG(myOrder);
		}
		logDebug("setting up store credit PG false");
	}
	
}
