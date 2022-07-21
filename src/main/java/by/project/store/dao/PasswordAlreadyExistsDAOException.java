package by.project.store.dao;

public class PasswordAlreadyExistsDAOException extends Exception {

	private static final long serialVersionUID = 1L;

	public PasswordAlreadyExistsDAOException() {
		super();
	}

	public PasswordAlreadyExistsDAOException(String message) {
		super(message);
	}

	public PasswordAlreadyExistsDAOException(Exception e) {
		super(e);
	}

	public PasswordAlreadyExistsDAOException(String message, Exception e) {
		super(message, e);
	}

}
