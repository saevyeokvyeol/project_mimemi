package mimemi.mvc.dto;

public class OrderDeliDTO {
	private int orderDeliId;
	private int orderLineId;
	private int orderStateId;
	private String orderDeliDate;
	
	public OrderDeliDTO() {}
	public OrderDeliDTO(int orderDeliId, int orderLineId, int orderStateId, String orderDeliDate) {
		super();
		this.orderDeliId = orderDeliId;
		this.orderLineId = orderLineId;
		this.orderStateId = orderStateId;
		this.orderDeliDate = orderDeliDate;
	}
	public int getOrderDeliId() {
		return orderDeliId;
	}
	public void setOrderDeliId(int orderDeliId) {
		this.orderDeliId = orderDeliId;
	}
	public int getOrderLineId() {
		return orderLineId;
	}
	public void setOrderLineId(int orderLineId) {
		this.orderLineId = orderLineId;
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
