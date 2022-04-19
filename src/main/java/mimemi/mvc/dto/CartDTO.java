package mimemi.mvc.dto;

public class CartDTO {
	private int cartId;
	private String userId;
	private String goodsId;
	private int cartQty;
	private String cartWeekday;
	private String cartPeriod;
	private String cartStart;
	private int goodsPrice;
	
	public CartDTO() {}

	public CartDTO(String userId, String goodsId, int cartQty, String cartWeekday, String cartPeriod,
			String cartStart, int goodsPrice) {
		super();
		this.userId = userId;
		this.goodsId = goodsId;
		this.cartQty = cartQty;
		this.cartWeekday = cartWeekday;
		this.cartPeriod = cartPeriod;
		this.cartStart = cartStart;
		this.goodsPrice = goodsPrice;
	}

	public CartDTO(int cartId, String userId, String goodsId, int cartQty, String cartWeekday, String cartPeriod,
			String cartStart) {
		super();
		this.cartId = cartId;
		this.userId = userId;
		this.goodsId = goodsId;
		this.cartQty = cartQty;
		this.cartWeekday = cartWeekday;
		this.cartPeriod = cartPeriod;
		this.cartStart = cartStart;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public int getCartQty() {
		return cartQty;
	}

	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}

	public String getCartWeekday() {
		return cartWeekday;
	}

	public void setCartWeekday(String cartWeekday) {
		this.cartWeekday = cartWeekday;
	}

	public String getCartPeriod() {
		return cartPeriod;
	}

	public void setCartPeriod(String cartPeriod) {
		this.cartPeriod = cartPeriod;
	}

	public String getCartStart() {
		return cartStart;
	}

	public void setCartStart(String cartStart) {
		this.cartStart = cartStart;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	
}
