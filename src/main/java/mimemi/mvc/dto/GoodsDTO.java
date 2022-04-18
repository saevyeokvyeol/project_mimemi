package mimemi.mvc.dto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import mimemi.mvc.util.DbUtil;

public class GoodsDTO {
	private String goodsId;
	private String goodsName;
	private String goodsDetail;
	private String goodsThumbnail;
	private int goodsPrice;
	private boolean goodsSale;
	private String goodsDetailImg;
	
	public GoodsDTO() {}
	public GoodsDTO(String goodsId, String goodsName) {
		super();
		this.goodsId = goodsId;
		this.goodsName = goodsName;
	}
	public GoodsDTO(String goodsId, String goodsName, String goodsDetail, String goodsThumbnail, int goodsPrice,
			boolean goodsSale, String goodsDetailImg) {
		super();
		this.goodsId = goodsId;
		this.goodsName = goodsName;
		this.goodsDetail = goodsDetail;
		this.goodsThumbnail = goodsThumbnail;
		this.goodsPrice = goodsPrice;
		this.goodsSale = goodsSale;
		this.goodsDetailImg = goodsDetailImg;
	}

	public String getGoodsId() {
		return goodsId;
	}

	public void setGoodsId(String goodsId) {
		this.goodsId = goodsId;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getGoodsDetail() {
		return goodsDetail;
	}

	public void setGoodsDetail(String goodsDetail) {
		this.goodsDetail = goodsDetail;
	}

	public String getGoodsThumbnail() {
		return goodsThumbnail;
	}

	public void setGoodsThumbnail(String goodsThumbnail) {
		this.goodsThumbnail = goodsThumbnail;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public boolean isGoodsSale() {
		return goodsSale;
	}

	public void setGoodsSale(boolean goodsSale) {
		this.goodsSale = goodsSale;
	}

	public String getGoodsDetailImg() {
		return goodsDetailImg;
	}

	public void setGoodsDetailImg(String goodsDetailImg) {
		this.goodsDetailImg = goodsDetailImg;
	}
	
	
}
