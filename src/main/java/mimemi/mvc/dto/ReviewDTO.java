package mimemi.mvc.dto;

public class ReviewDTO {
	private int reviewNo;
	private String userId;
	private String  goodsId;
	private String reviewTitle;
	private String reviewAttach;
	private String reviewContent;
	private String reviewRegdate;
	private int reviewRate;
	private boolean reviewBlind;
	private int reviewViews;
	
	public ReviewDTO() {}
	
	public ReviewDTO(int reviewNo, String userId, String  goodsId, String reviewTitle, String reviewAttach, String reviewContent,
			String reviewRegdate, int reviewRate, boolean reviewBlind, int reviewViews) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.goodsId = goodsId;
		this.reviewTitle = reviewTitle;
		this.reviewAttach = reviewAttach;
		this.reviewContent = reviewContent;
		this.reviewRegdate = reviewRegdate;
		this.reviewRate = reviewRate;
		this.reviewBlind = reviewBlind;
		this.reviewViews = reviewViews;
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
	
	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public String getReviewAttach() {
		return reviewAttach;
	}

	public void setReviewAttach(String reviewAttach) {
		this.reviewAttach = reviewAttach;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewRegdate() {
		return reviewRegdate;
	}

	public void setReviewRegdate(String reviewRegdate) {
		this.reviewRegdate = reviewRegdate;
	}

	public int getReviewRate() {
		return reviewRate;
	}

	public void setReviewRate(int reviewRate) {
		this.reviewRate = reviewRate;
	}

	public boolean isReviewBlind() {
		return reviewBlind;
	}

	public void setReviewBlind(boolean reviewBlind) {
		this.reviewBlind = reviewBlind;
	}

	public int getReviewViews() {
		return reviewViews;
	}

	public void setReviewViews(int reviewViews) {
		this.reviewViews = reviewViews;
	}

	
	
}
