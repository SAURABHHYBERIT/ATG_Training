package dynamusic;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;

import atg.repository.MutableRepository;
import atg.repository.MutableRepositoryItem;
import atg.repository.RepositoryException;
import atg.repository.servlet.RepositoryFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

public class InterestFormHandler extends RepositoryFormHandler {
	
	private String userId;
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	protected void postCreateItem(DynamoHttpServletRequest pRequest,
			DynamoHttpServletResponse pResponse) throws ServletException,
			IOException {
		
		MutableRepository mr = (MutableRepository) getRepository();
		try {
			MutableRepositoryItem mri = mr.getItemForUpdate(getUserId(), "user");
			@SuppressWarnings("unchecked")
			Set<Object> userInterests = (Set<Object>) mri.getPropertyValue("interests");
			userInterests.add(getRepositoryItem());
			mri.setPropertyValue("interests", userInterests);
		} catch (RepositoryException e) {
			logError("Unable to update interest");
		}
	}
	
	@Override
	protected void preDeleteItem(DynamoHttpServletRequest pRequest,
			DynamoHttpServletResponse pResponse) throws ServletException,
			IOException {
		MutableRepository mr = (MutableRepository) getRepository();
		try {
			MutableRepositoryItem mri = mr.getItemForUpdate(getUserId(), "user");
			@SuppressWarnings("unchecked")
			Set<Object> userInterests = (Set<Object>) mri.getPropertyValue("interests");
			userInterests.remove(getRepository().getItem(getRepositoryId(), "interest"));
			mri.setPropertyValue("interests", userInterests);
		} catch (RepositoryException e) {
			logError("Unable to delete interest from user");
		}
	}
	
}
