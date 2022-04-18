package mimemi.mvc.dto;

public class MealDTO {
	private String mealId;
	private String goodsId;
	private String mealName;
	private int mealWeight;
	private int mealKcal;
	private int mealCarbo;
	private int mealProtein;
	private int mealFat;
	private String mealImg;
	private boolean mealSale;
	
	
	public MealDTO() {}	
	public MealDTO(String mealId, String goodsId, String mealName, int mealWeight, int mealKcal, int mealCarbo, int mealProtein,
			int mealFat, String mealImg, Boolean mealSale ) {
		super();
		this.mealId = mealId;
		this.goodsId = goodsId;
		this.mealName = mealName;
		this.mealWeight = mealWeight;
		this.mealKcal = mealKcal;
		this.mealCarbo = mealCarbo;
		this.mealProtein = mealProtein;
		this.mealFat = mealFat;
		this.mealImg = mealImg;
		this.mealSale = mealSale;
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
	
	public int getMealKcal() {
		return mealKcal;
	}
	public void setMealKcal(int mealKcal) {
		this.mealKcal = mealKcal;
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
	public String getMealImg() {
		return mealImg;
	}
	public void setMealImg(String mealImg) {
		this.mealImg = mealImg;
	}
	public boolean isMealSale() {
		return mealSale;
	}
	public void setMealSale(boolean mealSale) {
		this.mealSale = mealSale;
	}
	
	
	
}
