package dynamusic;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;

import atg.repository.RepositoryItem;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.DynamoServlet;

public class ShowInterests extends DynamoServlet {
	
	public static final String SHOW_ALL = "all";
	public static final String SHOW_EVEN = "even";
	public static final String SHOW_ODD = "odd";
	
	@SuppressWarnings("unchecked")
	@Override
	public void service(DynamoHttpServletRequest req,
			DynamoHttpServletResponse res) throws ServletException, IOException {
		
		List<RepositoryItem> interests = new ArrayList<RepositoryItem>((Set<RepositoryItem>) req.getObjectParameter("interests"));
		String showParameter = req.getParameter("showParameter");
		
		if(showParameter == null){
			showParameter = SHOW_ALL;
		}
		
		if(interests == null || interests.isEmpty()){
			req.setParameter("message", "No interests found");
			req.serviceParameter("empty", req, res);
		} else {
			
			List<RepositoryItem> result = filterInterests(interests, showParameter);
			for (RepositoryItem repositoryItem : result) {
				
				String name = (String) repositoryItem.getPropertyValue("name");
				String rating = (String) repositoryItem.getPropertyValue("rating");
				
				req.setParameter("interest", repositoryItem);
				req.setParameter("interestId", repositoryItem.getRepositoryId());
				req.setParameter("interestName", name);
				req.setParameter("interestRating", rating);
				req.serviceParameter("output", req, res);
			}	
		}		
	}
	
	public List<RepositoryItem> filterInterests(List<RepositoryItem> interests, String showParameter){
		List<RepositoryItem> result = new ArrayList<RepositoryItem>();
		for (RepositoryItem repositoryItem : interests) {
			
			String ratingValue = (String) repositoryItem.getPropertyValue("rating");
			int rating = Integer.parseInt(ratingValue);
			
			if(showParameter.equalsIgnoreCase(SHOW_EVEN)){
				if((rating % 2) == 0){
					result.add(repositoryItem);
				}
				
			} else if(showParameter.equalsIgnoreCase(SHOW_ODD)){
				if((rating % 2) != 0){
					result.add(repositoryItem);
				}
				
			} else {
				result.add(repositoryItem);
			}
		}
		
		Collections.sort(result, new Comparator<RepositoryItem>(){
			@Override
			public int compare(RepositoryItem paramT1, RepositoryItem paramT2) {
				String name1 = (String) paramT1.getPropertyValue("name");
				String name2 = (String) paramT2.getPropertyValue("name");
				return name1.compareTo(name2);
			}
		});
		
		return result;
	}

}
