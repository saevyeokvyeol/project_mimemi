package mimemi.mvc.dto;

public class ReviewDTO {
	private int reviewNo;
	private String userId;
	private String  goodsId;
	private String reviewTitle;
	private String reviewContent;
	private String reviewAttach;
	private String reviewRegdate;
	private int reviewRate;
	private String reviewBlind;
	private int reviewViews;
	
	private GoodsDTO goodsDTO = new GoodsDTO();
	private UserDTO userDTO = new UserDTO();
	
	public ReviewDTO() {}
	
	public ReviewDTO(int reviewNo,String userId, String  goodsId, String reviewTitle, String reviewContent, int reviewRate) {
		super();
		this.reviewNo = reviewNo;
		this.userId = userId;
		this.goodsId = goodsId;
		this.reviewTitle = reviewTitle;
		this.reviewContent = reviewContent;
		this.reviewRate = reviewRate;
	}
	
	public ReviewDTO(int reviewNo, String userId, String  goodsId, String reviewTitle, String reviewContent, String reviewAttach, 
			String reviewRegdate, int reviewRate, String reviewBlind, int reviewViews) {
		this(reviewNo,userId,goodsId,reviewTitle,reviewContent,reviewRate);
		this.reviewAttach = reviewAttach;
		this.reviewRegdate = reviewRegdate;
		this.reviewBlind = reviewBlind;
		this.reviewViews = reviewViews;
	}
	

	public GoodsDTO getGoodsDTO() {
		return goodsDTO;
	}

	public void setGoodsDTO(GoodsDTO goodsDTO) {
		this.goodsDTO = goodsDTO;
	}

	public UserDTO getUserDTO() {
		return userDTO;
	}

	public void setUserDTO(UserDTO userDTO) {
		this.userDTO = userDTO;
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

	public void setReviewBlind(String reviewBlind) {
		this.reviewBlind = reviewBlind;
	}

	public int getReviewViews() {
		return reviewViews;
	}

	public void setReviewViews(int reviewViews) {
		this.reviewViews = reviewViews;
	}

	public String getReviewBlind() {
		return reviewBlind;
	}
	
	
	
}
