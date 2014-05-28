package dynamusic;

import java.io.IOException;

import javax.servlet.ServletException;

import atg.repository.*;
import atg.repository.servlet.*;
import atg.servlet.*;

public class ArtistFormHandler extends RepositoryFormHandler {

	private SongsManager songsManager;
	
	public SongsManager getSongsManager(){
		return songsManager;
	}
	
	public void setSongsManager(SongsManager songsManager){
		this.songsManager = songsManager;
	}
	
	@Override
	protected void preDeleteItem(DynamoHttpServletRequest pRequest,
			DynamoHttpServletResponse pResponse) throws ServletException,
			IOException {
		logDebug("ArtsitFormHandler#preDeleteItem()");
		SongsManager sm = getSongsManager();
		String artistId = getRepositoryItem().getRepositoryId();
		try {
			logDebug("Trying to delete artists' albums");
			sm.deleteAlbumsByArtist(artistId);
		} catch (RepositoryException e) {
			logError("Deleting albums error", e);
		}
		super.preDeleteItem(pRequest, pResponse);
	}
}
