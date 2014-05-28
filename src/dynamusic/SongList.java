/* -------------------------------------------
 * SongList
 *
 * Sample class for Dynamusic exercises.
 * 
 * Developing ATG Applications, Part I
 *
 * Last modified: April 19, 2007
 *--------------------------------------------
 */
 
package dynamusic;

public class SongList extends atg.nucleus.GenericService {

        //---------------------------------------------
	// Member variables
	private String[] mSongs;
	
	//---------------------------------------------
	// Property methods

	public String[] getSongs () {
	        if (isLoggingDebug()) {
	            logDebug("getSongs called, returning " + mSongs);
	        }
		return mSongs;
	}
	
	public void setSongs(String[] pSongs) {
	        if (isLoggingDebug()) {
	            logDebug("setSongs called with " + pSongs);
	        }
		mSongs = pSongs;
	}

        //------------------------------------------------------	
	// Constructors
	
	public SongList () {
                if (isLoggingDebug()) {
	            logDebug("FeaturedSongs constructor called");
	        }
	}

}
