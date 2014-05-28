package dynamusic;

import java.io.IOException;

import javax.servlet.ServletException;

import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.servlet.DynamoHttpServletRequest;
import atg.servlet.DynamoHttpServletResponse;
import atg.servlet.DynamoServlet;

public class EnumForEach extends DynamoServlet {
	
	private String repositoryName;
	private String itemDescriptorName;
	private String propertyName;

	public String getRepositoryName() {
		return repositoryName;
	}

	public void setRepositoryName(String repositoryName) {
		this.repositoryName = repositoryName;
	}

	public String getItemDescriptorName() {
		return itemDescriptorName;
	}

	public void setItemDescriptorName(String itemDescriptorName) {
		this.itemDescriptorName = itemDescriptorName;
	}

	public String getPropertyName() {
		return propertyName;
	}

	public void setPropertyName(String propertyName) {
		this.propertyName = propertyName;
	}

	@Override
	public void service(DynamoHttpServletRequest req,
			DynamoHttpServletResponse res) throws ServletException, IOException {

		setRepositoryName(req.getParameter("repositoryName"));
		setItemDescriptorName(req.getParameter("itemDescriptorName"));
		setPropertyName(req.getParameter("propertyName"));
		
		Repository repository = (Repository) resolveName(getRepositoryName());
		
		try {
			String[] enumeratedProperties = EnumeratedProperties.getEnumeratedProperties(repository, itemDescriptorName, propertyName);
			if(enumeratedProperties.length == 0){
				req.setParameter("message", "No properties found");
				req.serviceParameter("empty", req, res);
			} else {
				int arraySize = enumeratedProperties.length;
				for(int i = 0; i < arraySize; i++){
					req.setParameter("element", enumeratedProperties[i]);
					req.serviceParameter("output", req, res);
				}
			}
			
		} catch (RepositoryException e) {
			req.setParameter("message", "Repository exception occured");
			req.serviceParameter("error", req, res);
		}
		
	}
	
}
