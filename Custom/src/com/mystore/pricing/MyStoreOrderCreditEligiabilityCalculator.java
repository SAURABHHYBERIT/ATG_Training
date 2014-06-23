package com.mystore.pricing;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import com.mystore.order.MyStoreOrder;

import atg.commerce.claimable.ClaimableManager;
import atg.commerce.order.CommerceItem;
import atg.commerce.order.Order;
import atg.commerce.pricing.OrderPriceInfo;
import atg.commerce.pricing.OrderPricingCalculator;
import atg.commerce.pricing.PricingException;
import atg.nucleus.GenericService;
import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;

public class MyStoreOrderCreditEligiabilityCalculator extends GenericService
		implements OrderPricingCalculator {
	
	ClaimableManager claimableManager;

	public ClaimableManager getClaimableManager() {
		return claimableManager;
	}

	public void setClaimableManager(ClaimableManager claimableManager) {
		this.claimableManager = claimableManager;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void priceOrder(OrderPriceInfo pPriceQuote, Order pOrder,
			RepositoryItem pPricingModel, Locale pLocale, RepositoryItem pProfile, Map pExtraParameters)
		throws PricingException {
		
		MyStoreOrder order = (MyStoreOrder) pOrder;
		
		List items = order.getCommerceItems();
		boolean creditEligiability = true;
		for (Object item : items) {
			CommerceItem cItem = (CommerceItem) item;
			String skuItemId = cItem.getCatalogRefId();
			Repository catalogRepository = (Repository) resolveName("/atg/commerce/catalog/ProductCatalog");
			try {
				RepositoryItem skuItem = (RepositoryItem) catalogRepository.getItem(skuItemId, "sku");
				Boolean skuCreditEligiability = (Boolean) skuItem.getPropertyValue("isCreditEligible");
				creditEligiability = creditEligiability && skuCreditEligiability.booleanValue();
			} catch (RepositoryException e) {
				logError("Unable to get sku item from catalog repository", e);
				order.setCreditEligible(false);
			}
		}
		order.setCreditEligible(creditEligiability);
		if(creditEligiability == false){
			order.setUseCredit(false);
		}
	}

}
