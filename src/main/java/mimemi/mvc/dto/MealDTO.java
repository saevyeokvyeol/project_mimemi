package mimemi.mvc.dto;

public class MealDTO {
	private String mealId;
	private String goodsId;
	private String mealName;
	private int mealWeight;
	private int mealCarbo;
	private int mealProtein;
	private int mealFat;
	
	public MealDTO() {}	
	public MealDTO(String mealId, String goodsId, String mealName, int mealWeight, int mealCarbo, int mealProtein,
			int mealFat) {
		super();
		this.mealId = mealId;
		this.goodsId = goodsId;
		this.mealName = mealName;
		this.mealWeight = mealWeight;
		this.mealCarbo = mealCarbo;
		this.mealProtein = mealProtein;
		this.mealFat = mealFat;
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
	public String getMealName() {
		return mealName;
	}
	public void setMealName(String mealName) {
		this.mealName = mealName;
	}
	public int getMealWeight() {
		return mealWeight;
	}
	public void setMealWeight(int mealWeight) {
		this.mealWeight = mealWeight;
	}
	public int getMealCarbo() {
		return mealCarbo;
	}
	public void setMealCarbo(int mealCarbo) {
		this.mealCarbo = mealCarbo;
	}
	public int getMealProtein() {
		return mealProtein;
	}
	public void setMealProtein(int mealProtein) {
		this.mealProtein = mealProtein;
	}
	public int getMealFat() {
		return mealFat;
	}
	public void setMealFat(int mealFat) {
		this.mealFat = mealFat;
	}
	
	
	
}
