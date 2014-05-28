package dynamusic;

import java.util.Collection;
import java.util.Map;

import atg.repository.RepositoryItemImpl;
import atg.repository.RepositoryPropertyDescriptor;

public class AverageInterestRating extends RepositoryPropertyDescriptor {
	
	private static final long serialVersionUID = 1295170097745455783L;
	
	@Override
	public Object getPropertyValue(RepositoryItemImpl pItem, Object pValue) {
		
		@SuppressWarnings("unchecked")
		Map<String, Integer> interests = (Map<String, Integer>) pItem.getPropertyValue("interests");
		
		if(!interests.isEmpty() && interests != null){
			int ratingsSum = 0;
			Collection<Integer> ratings = interests.values();
			for (Integer rating : ratings) {
				ratingsSum += rating;
			}
			int averageRating = ratingsSum / ratings.size();
			
			return averageRating;
		} else {
			return 0;
		}
		
	}

}
