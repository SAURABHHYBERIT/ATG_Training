package com.mystore.order.processor;

import com.mystore.order.MyStoreOrder;

import atg.commerce.order.PaymentGroup;
import atg.commerce.order.processor.ProcValidateStoreCredit;
import atg.commerce.order.processor.ValidatePaymentGroupPipelineArgs;
import atg.service.pipeline.PipelineResult;

public class MyStoreProcValidateStoreCredit extends ProcValidateStoreCredit {

	@Override
	public int runProcess(Object pParam, PipelineResult pResult)
			throws Exception {
		int ret = super.runProcess(pParam, pResult);
		
		ValidatePaymentGroupPipelineArgs args = (ValidatePaymentGroupPipelineArgs) pParam;
		PaymentGroup pg = args.getPaymentGroup();
		MyStoreOrder order = (MyStoreOrder) args.getOrder();
		if(pg.getAmount() > 0.0){
			if(!(order.isCreditEligible()) || !(order.isUseCredit())){
				logDebug("validatind store credit");
				logDebug(pg.getPaymentGroupClassType() + " PGclass");
				logDebug(pg.getPaymentMethod() + " PM");
				logDebug(pg.getAmount() + " PGAmount");
				pResult.addError("storeCreditPaymentGroupNotEligibleOrderError", "This order is not eligible for credit payment");
				return 1;
			}
		}
		return ret;
	}
	
}
