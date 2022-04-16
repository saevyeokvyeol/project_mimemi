package mimemi.mvc.dto;

public class OrderDTO {
	private int orderId;
	private String userId;
	private int addrId;
	private String payMethod;
	private int payPoint;
	private int totalPrice;
	private String orderDate;
	private String orderMemo;
	private String takeMethod;
	private String enterPwd;
	private int usercouId;
	
	public OrderDTO() {}
	public OrderDTO(int orderId, String userId, int addrId, String payMethod, int payPoint, int totalPrice,
			String orderDate, String orderMemo, String takeMethod, String enterPwd, int usercouId) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.addrId = addrId;
		this.payMethod = payMethod;
		this.payPoint = payPoint;
		this.totalPrice = totalPrice;
		this.orderDate = orderDate;
		this.orderMemo = orderMemo;
		this.takeMethod = takeMethod;
		this.enterPwd = enterPwd;
		this.usercouId = usercouId;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getAddrId() {
		return addrId;
	}
	public void setAddrId(int addrId) {
		this.addrId = addrId;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public int getPayPoint() {
		return payPoint;
	}
	public void setPayPoint(int payPoint) {
		this.payPoint = payPoint;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderMemo() {
		return orderMemo;
	}
	public void setOrderMemo(String orderMemo) {
		this.orderMemo = orderMemo;
	}
	public String getTakeMethod() {
		return takeMethod;
	}
	public void setTakeMethod(String takeMethod) {
		this.takeMethod = takeMethod;
	}
	public String getEnterPwd() {
		return enterPwd;
	}
	public void setEnterPwd(String enterPwd) {
		this.enterPwd = enterPwd;
	}
	public int getUsercouId() {
		return usercouId;
	}
	public void setUsercouId(int usercouId) {
		this.usercouId = usercouId;
	}
	
	
}
