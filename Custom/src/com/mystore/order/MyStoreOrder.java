package com.mystore.order;

import atg.projects.store.order.StoreOrderImpl;

public class MyStoreOrder extends StoreOrderImpl {
	
	private static final long serialVersionUID = 2932118446823281262L;
	
	public boolean isReward(){
		Boolean returnValue = (Boolean) getPropertyValue("reward");
		return (returnValue == null ? false : returnValue.booleanValue());
	};
	
	public void setReward(boolean reward){
		setPropertyValue("reward", reward);
	};
	
	public boolean isCreditEligible(){
		Boolean returnValue = (Boolean) getPropertyValue("creditEligible");
		return (returnValue == null ? false : returnValue.booleanValue());
	};
	
	public void setCreditEligible(boolean creditEligible){
		setPropertyValue("creditEligible", creditEligible);
	};
	
	public boolean isUseCredit(){
		Boolean returnValue = (Boolean) getPropertyValue("useCredit");
		return (returnValue == null ? false : returnValue.booleanValue());
	};
	
	public void setUseCredit(boolean useCredit){
		setPropertyValue("useCredit", useCredit);
	};
	
}
