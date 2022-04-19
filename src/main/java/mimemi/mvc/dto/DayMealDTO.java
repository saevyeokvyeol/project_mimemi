package mimemi.mvc.dto;

public class DayMealDTO {
	private int dayMenuId;
	private String mealId;
	private String goodsId;
	private String dayMenuDate;
	
	public DayMealDTO() {}
	public DayMealDTO(int dayMenuId, String mealId, String goodsId, String dayMenuDate) {
		super();
		this.dayMenuId = dayMenuId;
		this.mealId = mealId;
		this.goodsId = goodsId;
		this.dayMenuDate = dayMenuDate;
	}
	public int getDayMenuId() {
		return dayMenuId;
	}
	public void setDayMenuId(int dayMenuId) {
		this.dayMenuId = dayMenuId;
	}
	public String getMealId() {
		return mealId;
	}
	public void setMealId(String mealId) {
		this.mealId = mealId;
	}
	public String getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}
	public String getDayMenuDate() {
		return dayMenuDate;
	}
	public void setDayMenuDate(String dayMenuDate) {
		this.dayMenuDate = dayMenuDate;
	}
	
	
}
