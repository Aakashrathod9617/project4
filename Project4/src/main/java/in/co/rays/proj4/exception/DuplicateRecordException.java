package in.co.rays.proj4.exception;

/**
 * DuplicateRecordException thrown when a duplicate record occurred
 *
 * @author Aakash Rathod
 *
 */
public class DuplicateRecordException extends Exception{
	
	 /**
     * @param msg
     *            error message
     */
	public DuplicateRecordException(String msg){
		super(msg);
	}

}
