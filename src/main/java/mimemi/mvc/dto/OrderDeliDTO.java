package mimemi.mvc.dto;

public class OrderDeliDTO {
	private int orderDeliId;
	private int orderLineCode;
	private int orderStateId;
	private String orderDeliDate;
	
	public OrderDeliDTO() {}
	public OrderDeliDTO(int orderDeliId, int orderLineCode, int orderStateId, String orderDeliDate) {
		super();
		this.orderDeliId = orderDeliId;
		this.orderLineCode = orderLineCode;
		this.orderStateId = orderStateId;
		this.orderDeliDate = orderDeliDate;
	}
	public int getOrderDeliId() {
		return orderDeliId;
	}
	public void setOrderDeliId(int orderDeliId) {
		this.orderDeliId = orderDeliId;
	}
	public int getOrderLineCode() {
		return orderLineCode;
	}
	public void setOrderLineCode(int orderLineCode) {
		this.orderLineCode = orderLineCode;
	}
	public int getOrderStateId() {
		return orderStateId;
	}
	public void setOrderStateId(int orderStateId) {
		this.orderStateId = orderStateId;
	}
	public String getOrderDeliDate() {
		return orderDeliDate;
	}
	public void setOrderDeliDate(String orderDeliDate) {
		this.orderDeliDate = orderDeliDate;
	}
	
	
}
