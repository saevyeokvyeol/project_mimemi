package mimemi.mvc.dto;

public class ReviewReplyDTO {
	private int replyNo;
	private int reviewNo;
	private String userId;
	private String replyContent;
	private String replyRegdate;
	
	public ReviewReplyDTO() {}

	public ReviewReplyDTO(int replyNo, int reviewNo, String userId, String replyContent, String replyRegdate) {
		super();
		this.replyNo = replyNo;
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.replyContent = replyContent;
		this.replyRegdate = replyRegdate;
	}

	public int getReplyNo() {
		return replyNo;
	}

	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}

	public int getReviewNo() {
		return reviewNo;
	}

	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getReplyContent() {
		return replyContent;
	}

	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}

	public String getReplyRegdate() {
		return replyRegdate;
	}

	public void setReplyRegdate(String replyRegdate) {
		this.replyRegdate = replyRegdate;
	}
	
}
