package com.mystore.pricing;

import java.util.Locale;
import java.util.Map;

import com.mystore.order.MyStoreOrder;

import atg.commerce.order.Order;
import atg.commerce.pricing.OrderPriceInfo;
import atg.commerce.pricing.OrderPricingCalculator;
import atg.commerce.pricing.PricingException;
import atg.nucleus.GenericService;
import atg.repository.RepositoryItem;

public class MyStoreStoreCreditPriceCalculator extends GenericService implements
		OrderPricingCalculator {

	@SuppressWarnings("rawtypes")
	@Override
	public void priceOrder(OrderPriceInfo paramOrderPriceInfo,
			Order paramOrder, RepositoryItem paramRepositoryItem1,
			Locale paramLocale, RepositoryItem paramRepositoryItem2,
			Map paramMap) throws PricingException {
		
		MyStoreOrder order = (MyStoreOrder) paramOrder;
		if(order.isUseCredit()){
			double oldPrice = paramOrderPriceInfo.getAmount();
			double newPrice = oldPrice * 1.1;
			paramOrderPriceInfo.setAmount(newPrice);
		}

	}

}
