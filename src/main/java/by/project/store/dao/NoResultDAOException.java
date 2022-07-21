package by.project.store.dao;

public class NoResultDAOException extends Exception{

	private static final long serialVersionUID = 1L;

	public NoResultDAOException() {
		super();
	}

	public NoResultDAOException(String message) {
		super(message);
	}

	public NoResultDAOException(Exception e) {
		super(e);
	}

	public NoResultDAOException(String message, Exception e) {
		super(message, e);
	}

}
