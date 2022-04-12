package mimemi.mvc.dto;

public class LiveCouponDTO {
	private String livecouId;
	private String livecouName;
	private int livecouPrice;
	private String livecouPubdate;
	private int livecouUseperiod;
	
	public LiveCouponDTO() {}
	public LiveCouponDTO(String livecouId, String livecouName, int livecouPrice, String livecouPubdate,
			int livecouUseperiod) {
		super();
		this.livecouId = livecouId;
		this.livecouName = livecouName;
		this.livecouPrice = livecouPrice;
		this.livecouPubdate = livecouPubdate;
		this.livecouUseperiod = livecouUseperiod;
	}
	public String getLivecouId() {
		return livecouId;
	}
	public void setLivecouId(String livecouId) {
		this.livecouId = livecouId;
	}
	public String getLivecouName() {
		return livecouName;
	}
	public void setLivecouName(String livecouName) {
		this.livecouName = livecouName;
	}
	public int getLivecouPrice() {
		return livecouPrice;
	}
	public void setLivecouPrice(int livecouPrice) {
		this.livecouPrice = livecouPrice;
	}
	public String getLivecouPubdate() {
		return livecouPubdate;
	}
	public void setLivecouPubdate(String livecouPubdate) {
		this.livecouPubdate = livecouPubdate;
	}
	public int getLivecouUseperiod() {
		return livecouUseperiod;
	}
	public void setLivecouUseperiod(int livecouUseperiod) {
		this.livecouUseperiod = livecouUseperiod;
	}
	
	
}
