package com.mystore.order.purchase;

import java.util.Iterator;
import java.util.List;

import com.mystore.order.MyStoreOrder;
import com.mystore.order.PointsPaymentGroup;

import atg.commerce.CommerceException;
import atg.commerce.order.*;
import atg.projects.store.order.purchase.StoreBillingProcessHelper;
import atg.repository.RepositoryItem;

public class MyStoreBillingProcessHelper extends StoreBillingProcessHelper {
	
	@SuppressWarnings("rawtypes")
	public void initializePointsPaymentGroup(Order pOrder, RepositoryItem pProfile) throws CommerceException {
		MyStoreOrder myOrder = (MyStoreOrder) pOrder;
		if(myOrder.isReward()){
			PaymentGroupManager pgm = getPaymentGroupManager();
			RepositoryItem pointsItem = (RepositoryItem) pProfile.getPropertyValue("points");
			
			if(pointsItem != null){
				PointsPaymentGroup pointsPaymentGroup = null;
				List paymentGroups = pOrder.getPaymentGroups();
				Iterator pgIterator = paymentGroups.iterator();
				while(pgIterator.hasNext()){
					PaymentGroup pg = (PaymentGroup) pgIterator.next();
					if(pg.getPaymentGroupClassType().equals("pointsPaymentGroup")){
						pointsPaymentGroup = (PointsPaymentGroup) pg;
					}
				}
				if(pointsPaymentGroup == null){
					pointsPaymentGroup = (PointsPaymentGroup) pgm.createPaymentGroup("pointsPaymentGroup");
					pgm.addPaymentGroupToOrder(pOrder, pointsPaymentGroup, 0);
					pointsPaymentGroup.setPointsItem(pointsItem);
				}
				double pointsNeeded = 0;
				Iterator itemIterator = myOrder.getCommerceItems().iterator();
				while(itemIterator.hasNext()){
					CommerceItem item = (CommerceItem) itemIterator.next();
					pointsNeeded += item.getPriceInfo().getAmount();
				}
				Integer availableBalance = (Integer) pointsItem.getPropertyValue("availableBalance");
				if(pointsNeeded > availableBalance.doubleValue()){
					throw new CommerceException("Not enough points to make this purchase");
				}
				String pgID = pointsPaymentGroup.getId();
				getPaymentGroupManager().removeAllRelationshipsFromPaymentGroup(pOrder, pgID);
				getOrderManager().addOrderAmountToPaymentGroup(pOrder, pgID, pointsNeeded);
			} else {
				throw new CommerceException("User profile does not have assosiated points item");
			}
			
		}
	}
	
	public void removeStoreCreditPG(Order pOrder){
		removeStoreCreditPaymentGroups(pOrder);
	}
	
	
	
}
