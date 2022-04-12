package mimemi.mvc.dto;

public class FaqDTO {
	private int faqNo;
	private String faqTitle;
	private String faqContent;
	private String faqAttach;
	private String faqRegdate;
	private String faqModidate;
	
	public FaqDTO() {}

	public FaqDTO(int faqNo, String faqTitle, String faqContent, String faqAttach, String faqRegdate,
			String faqModidate) {
		super();
		this.faqNo = faqNo;
		this.faqTitle = faqTitle;
		this.faqContent = faqContent;
		this.faqAttach = faqAttach;
		this.faqRegdate = faqRegdate;
		this.faqModidate = faqModidate;
	}

	public int getFaqNo() {
		return faqNo;
	}

	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContent() {
		return faqContent;
	}

	public void setFaqContent(String faqContent) {
		this.faqContent = faqContent;
	}

	public String getFaqAttach() {
		return faqAttach;
	}

	public void setFaqAttach(String faqAttach) {
		this.faqAttach = faqAttach;
	}

	public String getFaqRegdate() {
		return faqRegdate;
	}

	public void setFaqRegdate(String faqRegdate) {
		this.faqRegdate = faqRegdate;
	}

	public String getFaqModidate() {
		return faqModidate;
	}

	public void setFaqModidate(String faqModidate) {
		this.faqModidate = faqModidate;
	}	
	
}
