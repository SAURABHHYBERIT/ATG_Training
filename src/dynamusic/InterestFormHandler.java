package dynamusic;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;

import atg.droplet.DropletException;
import atg.repository.MutableRepository;
import atg.repository.MutableRepositoryItem;
import atg.repository.RepositoryException;
import atg.repository.servlet.RepositoryFormHandler;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;

public class InterestFormHandler extends RepositoryFormHandler {
	
	@Override
	public boolean handleUpdate(DynamoHttpServletRequest req,
			DynamoHttpServletResponse res) throws ServletException,
			IOException {
		String key = req.getParameter("key");
		String newValue = req.getParameter("newValue");
		if(key == null || key.equals("") || newValue == null || newValue.equals("")){
			addFormException(new DropletException("Fields musn't be empty"));
			if (getUpdateErrorURL() != null) {
				res.sendLocalRedirect(getUpdateErrorURL(), req);
				return false;
			}
			return true;
		}
		
		if(key.length() > 50){
			addFormException(new DropletException("Max lenght 50 characters"));
			if (getUpdateErrorURL() != null) {
				res.sendLocalRedirect(getUpdateErrorURL(), req);
				return false;
			}
			return true;
		}
		
		String userId = req.getParameter("repId");
		
		MutableRepository mu = (MutableRepository) getRepository();
		
		try {
			MutableRepositoryItem mri = mu.getItemForUpdate(userId, "user");
			@SuppressWarnings("unchecked")
			Map<String, Integer> interests = (Map<String, Integer>) mri.getPropertyValue("interests");
			int value = 0;
			try {
				value = Integer.parseInt(newValue);
			} catch (NumberFormatException e){
				addFormException(new DropletException("Wrong number format, use numbers"));
				if (getUpdateErrorURL() != null) {
					res.sendLocalRedirect(getUpdateErrorURL(), req);
					return false;
				}
				return true;
			}
			if(value > 10 || value < 1){
				addFormException(new DropletException("Please use numbers 1 to 10"));
				if (getUpdateErrorURL() != null) {
					res.sendLocalRedirect(getUpdateErrorURL(), req);
					return false;
				}
				return true;
			}
			interests.put(key, value);
			mri.setPropertyValue("interests", interests);
		} catch (RepositoryException e) {
			logDebug("repository exception");
			return true;
		}

		return super.handleUpdate(req, res);
	}
	
	@Override
	public boolean handleDelete(DynamoHttpServletRequest req,
			DynamoHttpServletResponse res) throws ServletException,
			IOException {
		String key = req.getParameter("key");
		if(key == null || key.equals("")){
			addFormException(new DropletException("Fields musn't be empty"));
			if (getDeleteErrorURL() != null) {
				res.sendLocalRedirect(getDeleteErrorURL(), req);
				return false;
			}
			return false;
		}
		
		String userId = req.getParameter("repId");
		
		MutableRepository mu = (MutableRepository) getRepository();
		
		try {
			MutableRepositoryItem mri = mu.getItemForUpdate(userId, "user");
			@SuppressWarnings("unchecked")
			Map<String, Integer> interests = (Map<String, Integer>) mri.getPropertyValue("interests");
			interests.remove(key);
			mri.setPropertyValue("interests", interests);
		} catch (RepositoryException e) {
			logDebug("repository exception");
			return true;
		}
		
		res.sendRedirect(getDeleteSuccessURL());
		return true;
	}
	
}
