package mimemi.mvc.dto;

public class RgCouponDTO {
	private String rgcouId;
	private String rgcouName;
	private int rgcouPrice;
	private String rgcouPubdate;
	private String rgcouEnddate;
	
	public RgCouponDTO() {}

	public RgCouponDTO(String rgcouId, String rgcouName, int rgcouPrice, String rgcouPubdate, String rgcouEnddate) {
		super();
		this.rgcouId = rgcouId;
		this.rgcouName = rgcouName;
		this.rgcouPrice = rgcouPrice;
		this.rgcouPubdate = rgcouPubdate;
		this.rgcouEnddate = rgcouEnddate;
	}

	public String getRgcouId() {
		return rgcouId;
	}

	public void setRgcouId(String rgcouId) {
		this.rgcouId = rgcouId;
	}

	public String getRgcouName() {
		return rgcouName;
	}

	public void setRgcouName(String rgcouName) {
		this.rgcouName = rgcouName;
	}

	public int getRgcouPrice() {
		return rgcouPrice;
	}

	public void setRgcouPrice(int rgcouPrice) {
		this.rgcouPrice = rgcouPrice;
	}

	public String getRgcouPubdate() {
		return rgcouPubdate;
	}

	public void setRgcouPubdate(String rgcouPubdate) {
		this.rgcouPubdate = rgcouPubdate;
	}

	public String getRgcouEnddate() {
		return rgcouEnddate;
	}

	public void setRgcouEnddate(String rgcouEnddate) {
		this.rgcouEnddate = rgcouEnddate;
	}
	
}
