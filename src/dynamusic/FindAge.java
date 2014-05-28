package dynamusic;

import java.util.Date;

import atg.repository.RepositoryItemImpl;
import atg.repository.RepositoryPropertyDescriptor;

public class FindAge extends RepositoryPropertyDescriptor {

	private static final long serialVersionUID = 5614184442150099778L;
	
	 private String mAgeFormat;
	 public static final String AGE_FORMAT_ATTR_NAME = "ageFormat";
	 public static final String FORMAT_DAYS = "days";
	 public static final String FORMAT_YEARS = "years";
	
	@Override
	public void setValue(String pAttributeName, Object pValue) {
		if(pAttributeName.equalsIgnoreCase(AGE_FORMAT_ATTR_NAME)){
			mAgeFormat = pValue.toString();
		} else {
			super.setValue(pAttributeName, pValue);
		}
	}
	
	@Override
	public Object getPropertyValue(RepositoryItemImpl pItem, Object pValue) {
		if(!mAgeFormat.equals(FORMAT_YEARS) && !mAgeFormat.equals(FORMAT_DAYS)){
			mAgeFormat = FORMAT_YEARS;
		}
		Date dateOfBirth = (Date) pItem.getPropertyValue("dateOfBirth");
		if(mAgeFormat.equals(FORMAT_DAYS)){
			return new Integer(AgeCalc.ageInDays(dateOfBirth));
		} else {
			return new Integer(AgeCalc.ageInYears(dateOfBirth));
		}
	}
	
}
