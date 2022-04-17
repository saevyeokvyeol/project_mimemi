package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.GoodsDAO;
import mimemi.mvc.dao.GoodsDAOImpl;
import mimemi.mvc.dto.GoodsDTO;

public class GoodsServiceImpl implements GoodsService {
	
	
	private GoodsDAO goodsDAO = new GoodsDAOImpl();
	
	/**
	 * 전체 상품 조회하기 
	 * public List<GoodsDTO> selectAll(String sort) throws SQLException;
	 */	
	public List<GoodsDTO> goodsSelectAll() throws SQLException {
		List<GoodsDTO> list = goodsDAO.goodsSelectAll();
		if(list.size() == 0 || list.isEmpty()) {
			throw new SQLException("상품의 정보가 없어 검색할 수 없습니다.");
		}
		return list;
	}
	
	/**
	 * 판매 상품 조회하기 
	 * 판매여부가 Y인 경우만 조회하기 
	 */
	
	public List<GoodsDTO> goodsSelectForSale() throws SQLException {
		List<GoodsDTO> list = goodsDAO.goodsSelectForSale();
		if(list.size() == 0 || list.isEmpty()) {
			throw new SQLException("상품의 정보가 없어 검색할 수 없습니다.");
		}
		return list;
	}
	
	/**
	 *  상품 추가하기 
	 */
	public void goodsInsert(GoodsDTO goods) throws SQLException {
		 int result = goodsDAO.goodsInsert(goods);
		 if(result == 0) throw new SQLException("상품이 등록되지 않았습니다");
			
		}
	
	/**
	 * 상품 수정하기 
	 */
	public void goodsUpdate(GoodsDTO goods) throws SQLException {
		int result = goodsDAO.goodsUpdate(goods);
		if(result == 0) throw new SQLException("상품이 수정되지 않았습니다");
	}

	/**
	 * 상품 판매 여부 수정
	 */
	public void goodsUpdateForSale(String goodsId, String goodsSale) throws SQLException {
		int result = goodsDAO.goodsUpdateForSale(goodsId, goodsSale);
		if(result == 0) throw new SQLException("상품이 수정되지 않았습니다");
	}

	/**
	 * 상품 썸네일 수정
	 */
	public void goodsUpdateThumbnail(String goodsId, String goodsThumbnail) throws SQLException {
		int result = goodsDAO.goodsUpdateThumbnail(goodsId, goodsThumbnail);
		if (result == 0) throw new SQLException("상품이 수정되지 않았습니다");
	}

	/**
	 * 상품명으로 상품 조회
	 */
	public List<GoodsDTO> goodsSelectByKeyword(String keyword) throws SQLException {
		List<GoodsDTO> list = goodsDAO.goodsSelectByKeyword(keyword);
		if(list.size() == 0 || list.isEmpty()) {
			throw new SQLException("상품의 정보가 없어 검색할 수 없습니다.");
		}
		return list;
	}
}

