package mimemi.mvc.dto;

public class ReviewReplyDTO {
	private int replyNo;
	private int reviewNo;
	private String userId;
	private String managerId;
	private String replyContent;
	private String replyRegdate;
	
	public ReviewReplyDTO() {}
	
	public ReviewReplyDTO(int reviewNo, String userId, String managerId, String replyContent) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.managerId = managerId;
		this.replyContent = replyContent;
	}

	public ReviewReplyDTO(int replyNo, int reviewNo, String userId, String managerId, String replyContent, String replyRegdate) {
		this(reviewNo,userId,managerId,replyContent);
		this.replyNo = replyNo;
		this.replyRegdate = replyRegdate;
	}
	
	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
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
