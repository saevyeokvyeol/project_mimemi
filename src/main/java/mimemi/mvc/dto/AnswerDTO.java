package mimemi.mvc.dto;

public class AnswerDTO {
	private int answerNo;//댓글번호(시퀀스)
	private int askNo;//글번호(시퀀스)
	private String answerContent;//댓글내용
	private String answerRegdate;//작성날짜
	
	public AnswerDTO() {}

	public AnswerDTO(String answerContent) {
		super();
		this.answerContent=answerContent;
	}
	
	public AnswerDTO(int answerNo, int askNo, String answerContent, String answerRegdate) {
		super();
		this.answerNo = answerNo;
		this.askNo = askNo;
		this.answerContent = answerContent;
		this.answerRegdate = answerRegdate;
	}

	public int getAnswerNo() {
		return answerNo;
	}

	public void setAnswerNo(int answerNo) {
		this.answerNo = answerNo;
	}

	public int getAskNo() {
		return askNo;
	}

	public void setAskNo(int askNo) {
		this.askNo = askNo;
	}

	public String getAnswerContent() {
		return answerContent;
	}

	public void setAnswerContent(String answerContent) {
		this.answerContent = answerContent;
	}

	public String getAnswerRegdate() {
		return answerRegdate;
	}

	public void setAnswerRegdate(String answerRegdate) {
		this.answerRegdate = answerRegdate;
	}
	
}
