package core;

@SuppressWarnings("serial")
public class EventFailException extends Exception {

	public EventFailException(String errorMessage) {
		super(errorMessage);
	}
}
