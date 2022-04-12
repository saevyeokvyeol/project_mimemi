package mimemi.mvc.dto;

public class OrderStateDTO {
	private int orderStateId;
	private String orderStateDetail;
	
	public OrderStateDTO() {}
	public OrderStateDTO(int orderStateId, String orderStateDetail) {
		super();
		this.orderStateId = orderStateId;
		this.orderStateDetail = orderStateDetail;
	}
	public int getOrderStateId() {
		return orderStateId;
	}
	public void setOrderStateId(int orderStateId) {
		this.orderStateId = orderStateId;
	}
	public String getOrderStateDetail() {
		return orderStateDetail;
	}
	public void setOrderStateDetail(String orderStateDetail) {
		this.orderStateDetail = orderStateDetail;
	}
	
	
}
