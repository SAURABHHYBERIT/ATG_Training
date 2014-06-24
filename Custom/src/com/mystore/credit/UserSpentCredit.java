package com.mystore.credit;

import java.util.List;

import atg.commerce.CommerceException;
import atg.commerce.claimable.ClaimableManager;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryItemImpl;
import atg.repository.RepositoryPropertyDescriptor;

public class UserSpentCredit extends
		RepositoryPropertyDescriptor {

	private static final long serialVersionUID = 3029936780508770819L;
	
	private ClaimableManager claimableManager;
	public static final String CLAIMABLE_MANAGER_ATTR_NAME = "claimableManager";
	
	public ClaimableManager getClaimableManager() {
		return claimableManager;
	}

	public void setClaimableManager(ClaimableManager claimableManager) {
		this.claimableManager = claimableManager;
	}
	
	@Override
	public void setValue(String pAttributeName, Object pValue) {
		if(pAttributeName.equalsIgnoreCase(CLAIMABLE_MANAGER_ATTR_NAME)){
			setClaimableManager((ClaimableManager) pValue);
		} else {
			super.setValue(pAttributeName, pValue);
		}
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Object getPropertyValue(RepositoryItemImpl pItem, Object pValue) {
		
		try {
			List usersCredits = getClaimableManager().getStoreCreditsForProfile(pItem.getRepositoryId());
			double totalDebt = 0.0;
			if(usersCredits != null){
				for (Object obj : usersCredits) {
					RepositoryItem credit = (RepositoryItem) obj;
					double debt = (Double) credit.getPropertyValue("amountAuthorized");
					totalDebt += debt;
				}
			}
			return totalDebt;
		} catch (CommerceException e) {
			getClaimableManager().logError("Error getting users store credits", e);
		}
		return 0;
	}

}
