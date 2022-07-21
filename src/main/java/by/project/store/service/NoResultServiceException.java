package by.project.store.service;

public class NoResultServiceException extends Exception {


	private static final long serialVersionUID = 1L;

	public NoResultServiceException() {
		super();
	}

	public NoResultServiceException(String message) {
		super(message);
	}

	public NoResultServiceException(Exception e) {
		super(e);
	}

	public NoResultServiceException(String message, Exception e) {
		super(message, e);
	}
}
