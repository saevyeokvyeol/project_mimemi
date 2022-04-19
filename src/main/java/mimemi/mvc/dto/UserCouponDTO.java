package mimemi.mvc.dto;

public class UserCouponDTO {
	private int userCouId;
	private String userId;
	private String livecouId;
	private String rgcouId;
	private String usercouUsable;
	private String usercouPubdate;
	private String usercouEnddate;
	
	public UserCouponDTO() {}
	
	public UserCouponDTO(int userCouId, String usercouUsable) {
		super();
		this.userCouId = userCouId;
		this.usercouUsable = usercouUsable;
	}

	public UserCouponDTO(String userId, String livecouId, String rgcouId, String usercouUsable, String usercouPubdate,
			String usercouEnddate) {
		super();
		this.userId = userId;
		this.livecouId = livecouId;
		this.rgcouId = rgcouId;
		this.usercouUsable = usercouUsable;
		this.usercouPubdate = usercouPubdate;
		this.usercouEnddate = usercouEnddate;
	}



	public UserCouponDTO(int userCouId, String userId, String livecouId, String rgcouId, String usercouUsable,
			String usercouPubdate, String usercouEnddate) {
		super();
		this.userCouId = userCouId;
		this.userId = userId;
		this.livecouId = livecouId;
		this.rgcouId = rgcouId;
		this.usercouUsable = usercouUsable;
		this.usercouPubdate = usercouPubdate;
		this.usercouEnddate = usercouEnddate;
	}

	public int getuserCouId() {
		return userCouId;
	}

	public void setuserCouId(int userCouId) {
		this.userCouId = userCouId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getLivecouId() {
		return livecouId;
	}

	public void setLivecouId(String livecouId) {
		this.livecouId = livecouId;
	}

	public String getRgcouId() {
		return rgcouId;
	}

	public void setRgcouId(String rgcouId) {
		this.rgcouId = rgcouId;
	}

	public String getUsercouUsable() {
		return usercouUsable;
	}

	public void setUsercouUsable(String usercouUsable) {
		this.usercouUsable = usercouUsable;
	}

	public String getUsercouPubdate() {
		return usercouPubdate;
	}

	public void setUsercouPubdate(String usercouPubdate) {
		this.usercouPubdate = usercouPubdate;
	}

	public String getUsercouEnddate() {
		return usercouEnddate;
	}

	public void setUsercouEnddate(String usercouEnddate) {
		this.usercouEnddate = usercouEnddate;
	}
	
}
