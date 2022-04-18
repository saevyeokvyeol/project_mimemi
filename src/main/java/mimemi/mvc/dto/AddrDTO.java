package mimemi.mvc.dto;

public class AddrDTO {
	private int addrId;
	private String userId;
	private String addrName;
	private int zipcode;
	private String addrAddr;
	private String addrDetailAddr;
	private String addrRefAddr;
	private String receiverName;
	private String receiverPhone;
	
	public AddrDTO() {}

	public AddrDTO(int addrId, String userId, String addrName, int zipcode, String addrAddr, String addrDetailAddr,
			String addrRefAddr, String receiverName, String receiverPhone) {
		super();
		this.addrId = addrId;
		this.userId = userId;
		this.addrName = addrName;
		this.zipcode = zipcode;
		this.addrAddr = addrAddr;
		this.addrDetailAddr = addrDetailAddr;
		this.addrRefAddr = addrRefAddr;
		this.receiverName = receiverName;
		this.receiverPhone = receiverPhone;
	}

	public int getAddrId() {
		return addrId;
	}

	public void setAddrId(int addrId) {
		this.addrId = addrId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAddrName() {
		return addrName;
	}

	public void setAddrName(String addrName) {
		this.addrName = addrName;
	}

	public int getZipcode() {
		return zipcode;
	}

	public void setZipcode(int zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddrAddr() {
		return addrAddr;
	}

	public void setAddrAddr(String addrAddr) {
		this.addrAddr = addrAddr;
	}

	public String getAddrDetailAddr() {
		return addrDetailAddr;
	}

	public void setAddrDetailAddr(String addrDetailAddr) {
		this.addrDetailAddr = addrDetailAddr;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public String getAddrRefAddr() {
		return addrRefAddr;
	}

	public void setAddrRefAddr(String addrRefAddr) {
		this.addrRefAddr = addrRefAddr;
	}
	
	
}
