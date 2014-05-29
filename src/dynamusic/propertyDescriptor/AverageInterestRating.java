package dynamusic.propertyDescriptor;

import java.util.Set;

import atg.repository.RepositoryItem;
import atg.repository.RepositoryItemImpl;
import atg.repository.RepositoryPropertyDescriptor;

public class AverageInterestRating extends RepositoryPropertyDescriptor {
	
	private static final long serialVersionUID = 1295170097745455783L;
	
	@Override
	public Object getPropertyValue(RepositoryItemImpl pItem, Object pValue) {
		
		@SuppressWarnings("unchecked")
		Set<RepositoryItem> interests = (Set<RepositoryItem>) pItem.getPropertyValue("interests");
		
		if(!interests.isEmpty() && interests != null){
			int ratingsSum = 0;
			for (RepositoryItem item : interests) {
				String ratingValue = (String) item.getPropertyValue("rating");
				int rating = Integer.parseInt(ratingValue);
				ratingsSum += rating;
			}
			int averageRating = ratingsSum / interests.size();
			
			return averageRating;
		} else {
			return 0;
		}
		
	}

}
