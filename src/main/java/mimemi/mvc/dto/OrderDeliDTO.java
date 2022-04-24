package mimemi.mvc.dto;

public class OrderDeliDTO {
	private int orderDeliId;
	private int orderLineId;
	private String orderStateId;
	private String orderDeliDate;
	private MealDTO meal;
	
	private OrderLineDTO orderLine;
	
	public OrderDeliDTO() {}
	public OrderDeliDTO(int orderDeliId, int orderLineId, String orderStateId, String orderDeliDate) {
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
	public String getOrderStateId() {
		return orderStateId;
	}
	public void setOrderStateId(String orderStateId) {
		this.orderStateId = orderStateId;
	}
	public String getOrderDeliDate() {
		return orderDeliDate;
	}
	public void setOrderDeliDate(String orderDeliDate) {
		this.orderDeliDate = orderDeliDate;
	}
	public MealDTO getMeal() {
		return meal;
	}
	public void setMeal(MealDTO meal) {
		this.meal = meal;
	}
	public OrderLineDTO getOrderLine() {
		return orderLine;
	}
	public void setOrderLine(OrderLineDTO orderLine) {
		this.orderLine = orderLine;
	}
}
