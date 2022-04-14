package mimemi.mvc.dto;

public class OrderLineDTO {
	private int orderLineId;
	private int orderId;
	private String goodsId;
	private int orderQty;
	private int priceQty;
	private String deliWeekday;
	private String deliPeriod;
	private String deliStart;
	
	public OrderLineDTO() {}

	public OrderLineDTO(int orderLineId, int orderId, String goodsId, int orderQty, int priceQty, String deliWeekday,
			String deliPeriod, String deliStart) {
		super();
		this.orderLineId = orderLineId;
		this.orderId = orderId;
		this.goodsId = goodsId;
		this.orderQty = orderQty;
		this.priceQty = priceQty;
		this.deliWeekday = deliWeekday;
		this.deliPeriod = deliPeriod;
		this.deliStart = deliStart;
	}

	public int getOrderLineId() {
		return orderLineId;
	}

	public void setOrderLineId(int orderLineId) {
		this.orderLineId = orderLineId;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public int getOrderQty() {
		return orderQty;
	}

	public void setOrderQty(int orderQty) {
		this.orderQty = orderQty;
	}

	public int getPriceQty() {
		return priceQty;
	}

	public void setPriceQty(int priceQty) {
		this.priceQty = priceQty;
	}

	public String getDeliWeekday() {
		return deliWeekday;
	}

	public void setDeliWeekday(String deliWeekday) {
		this.deliWeekday = deliWeekday;
	}

	public String getDeliPeriod() {
		return deliPeriod;
	}

	public void setDeliPeriod(String deliPeriod) {
		this.deliPeriod = deliPeriod;
	}

	public String getDeliStart() {
		return deliStart;
	}

	public void setDeliStart(String deliStart) {
		this.deliStart = deliStart;
	}
	
}
