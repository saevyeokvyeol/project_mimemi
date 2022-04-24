package mimemi.mvc.dto;

public class OrderStateDTO {
	private String orderStateId;
	private String orderStateDetail;
	
	public OrderStateDTO() {}
	public OrderStateDTO(String orderStateId, String orderStateDetail) {
		super();
		this.orderStateId = orderStateId;
		this.orderStateDetail = orderStateDetail;
	}
	public String getOrderStateId() {
		return orderStateId;
	}
	public void setOrderStateId(String orderStateId) {
		this.orderStateId = orderStateId;
	}
	public String getOrderStateDetail() {
		return orderStateDetail;
	}
	public void setOrderStateDetail(String orderStateDetail) {
		this.orderStateDetail = orderStateDetail;
	}
	
	
}
