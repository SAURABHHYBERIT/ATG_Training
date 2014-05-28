package dynamusic;

import java.io.IOException;
import java.util.*;

import javax.servlet.ServletException;

import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.DynamoServlet;

public class ShowInterests extends DynamoServlet {
	
	private Map<String, Integer> interests;
	private String showParameter;
	public static final String SHOW_ALL = "all";
	public static final String SHOW_EVEN = "even";
	public static final String SHOW_ODD = "odd";
	
	public Map<String, Integer> getInterests() {
		return interests;
	}
	public void setInterests(Map<String, Integer> interests) {
		this.interests = interests;
	}
	public String getShowParameter() {
		return showParameter;
	}
	public void setShowParameter(String show) {
		this.showParameter = show;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public void service(DynamoHttpServletRequest req,
			DynamoHttpServletResponse res) throws ServletException, IOException {
		
		setInterests((Map<String, Integer>)req.getObjectParameter("interests"));
		setShowParameter(req.getParameter("showParameter"));
		
		if(getShowParameter() == null){
			setShowParameter(SHOW_ALL);
		}
		
		if(getInterests() == null || getInterests().isEmpty()){
			req.setParameter("message", "No interests found");
			req.serviceParameter("empty", req, res);
		} else {
			
			SortedSet<String> keys = new TreeSet<String>(getInterests().keySet());
			
			for (String key : keys) {
				
				int rating = getInterests().get(key);
				
				if(getShowParameter().equalsIgnoreCase(SHOW_EVEN)){
					
					if((rating % 2) == 0){
						req.setParameter("interestName", key);
						req.setParameter("interestRating", rating);
						req.serviceParameter("output", req, res);
					}
					
				} else if(getShowParameter().equalsIgnoreCase(SHOW_ODD)){
					
					if((rating % 2) != 0){
						req.setParameter("interestName", key);
						req.setParameter("interestRating", rating);
						req.serviceParameter("output", req, res);
					}
					
				} else {
					req.setParameter("interestName", key);
					req.setParameter("interestRating", rating);
					req.serviceParameter("output", req, res);
				}
			}			
		}		
	}

}
