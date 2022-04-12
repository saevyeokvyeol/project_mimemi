package mimemi.mvc.dto;

public class AskDTO {
	private int askNo;
	private String userId;
	private String askTitle;
	private String askContent;
	private String askAttach;
	private String askRegdate;
	private String askCategory;
	private String askComplete;
	
	public AskDTO() {}

	public AskDTO(int askNo, String userId, String askTitle, String askContent, String askAttach, String askRegdate,
			String askCategory, String askComplete) {
		super();
		this.askNo = askNo;
		this.userId = userId;
		this.askTitle = askTitle;
		this.askContent = askContent;
		this.askAttach = askAttach;
		this.askRegdate = askRegdate;
		this.askCategory = askCategory;
		this.askComplete = askComplete;
	}

	public int getAskNo() {
		return askNo;
	}

	public void setAskNo(int askNo) {
		this.askNo = askNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAskTitle() {
		return askTitle;
	}

	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}

	public String getAskContent() {
		return askContent;
	}

	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}

	public String getAskAttach() {
		return askAttach;
	}

	public void setAskAttach(String askAttach) {
		this.askAttach = askAttach;
	}

	public String getAskRegdate() {
		return askRegdate;
	}

	public void setAskRegdate(String askRegdate) {
		this.askRegdate = askRegdate;
	}

	public String getAskCategory() {
		return askCategory;
	}

	public void setAskCategory(String askCategory) {
		this.askCategory = askCategory;
	}

	public String getAskComplete() {
		return askComplete;
	}

	public void setAskComplete(String askComplete) {
		this.askComplete = askComplete;
	}
	
}
