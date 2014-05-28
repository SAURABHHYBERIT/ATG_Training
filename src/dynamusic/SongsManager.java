package dynamusic;

import javax.transaction.SystemException;
import javax.transaction.TransactionManager;
import atg.dtm.*;

import atg.nucleus.GenericService;
import atg.repository.MutableRepository;
import atg.repository.Repository;
import atg.repository.RepositoryException;
import atg.repository.RepositoryItem;
import atg.repository.RepositoryView;
import atg.repository.rql.RqlStatement;

public class SongsManager extends GenericService {

	private Repository repository;
	private TransactionManager transactionManager;
	
	public SongsManager() {
		logDebug("SongsManager#constructor");
	}

	public Repository getRepository(){
		logDebug("SongsManager#getRepository");
		return repository;
	}
	
	public void setRepository(Repository repository){
		logDebug("SongsManager#setRepository");
		this.repository = repository;
	}
	
	public TransactionManager getTransactionManager(){
		return transactionManager;
	}
	
	public void setTransactionManager(TransactionManager transactionManager){
		this.transactionManager = transactionManager;
	}
	
	public void deleteAlbumsByArtist(String pArtistId) throws RepositoryException {
		logDebug("SongsManager#deleteAlbumsByArtista");
		
		TransactionDemarcation td = new TransactionDemarcation();
		TransactionManager tm = getTransactionManager();
		
		Repository repository = getRepository();
		MutableRepository muRepository = (MutableRepository) getRepository();	
		
		RqlStatement findAlbumsRQL;
		RepositoryView albumsView = repository.getView("album");
		Object rqlparams[] = new Object[1];
		rqlparams[0] = pArtistId;
		findAlbumsRQL = RqlStatement.parseRqlStatement("artist.id = ?0");
		RepositoryItem[] albumsList = findAlbumsRQL.executeQuery(albumsView, rqlparams);
		
		if(albumsList.length > 0){
			int albumsListLenght = albumsList.length;
			try {
				try{
					td.begin(tm, TransactionDemarcation.REQUIRED);
					for(int i = 0; i < albumsListLenght; i++){
						String albumId = (String) albumsList[i].getPropertyValue("id");
						logDebug("SongsManager# deleting album - " + albumId);
						muRepository.removeItem(albumId, "album");
					}	
				} catch(RepositoryException re){
					logError("Unable to delete album", re);
					try {
						getTransactionManager().setRollbackOnly();
					} catch(SystemException se){
						logError("Rollback failed", se);
					}
				} finally {
					td.end();
				}
			} catch (TransactionDemarcationException tde) {
				logError("TransactionDemarcationException occured", tde);
			}
		}
	}
}
