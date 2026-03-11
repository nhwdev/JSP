package ex14.model2;

public class ForwardView {
	private boolean redirect;
	private String view;

	public ForwardView() {

	}

	public ForwardView(boolean redirect, String view) {
		this.redirect = redirect;
		this.view = view;
	}

	public boolean isRedirect() {
		return redirect;
	}

	public void setRedirect(boolean redirect) {
		this.redirect = redirect;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}
}
