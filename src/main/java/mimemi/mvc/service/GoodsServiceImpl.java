package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.GoodsDAO;
import mimemi.mvc.dao.GoodsDAOImpl;
import mimemi.mvc.dto.GoodsDTO;

public class GoodsServiceImpl implements GoodsService{
	
	
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
	
	public List<GoodsDTO> goodsSelectForSale(String forsale) throws SQLException {
		List<GoodsDTO> list = goodsDAO.goodsSelectForSale(forsale);
		if(list.size() == 0 || list.isEmpty()) {
			throw new SQLException("상품의 정보가 없어 검색할 수 없습니다.");
		}
		return list;
	}
	
	/**
	 * 상품 가격순으로 정렬하기 
	 */
//	public List<GoodsDTO> goodsSelect
	
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
	public void goodsUpdate() throws SQLException {
		int result = goodsDAO.goodsUpdate();
		if(result == 0) throw new SQLException("상품이 수정되지 않았습니다");
		
	}
	
	/**
	 * 상품 삭제하기 
	 */
	
	


	@Override
	public void goodsUpdate(GoodsDTO goods) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void goodsUpdateForSale(String goodsId, String goodsSale) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void goodsUpdateThumbnail(String goodsId, String goodsThumbnail) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void goodsUpdateDetailImg(String goodsId, String goodsDetailImg) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void goodsDeleteThumbnail(String goodsId) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void goodsDeleteDetailImg(String goodsId) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<GoodsDTO> goodsSelectByKeyword(String keyword) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GoodsDTO selectByGoodsId(String goodsId) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 고객이 주문한 식단명 가져오기
	 * @param String userId
	 * @return List<GoodsDTO>
	 * */
	public List<GoodsDTO> selectOrderGoods(String userId) throws SQLException {
		List<GoodsDTO> list = goodsDAO.selectOrderGoods(userId);
		
		return list;
	}
	
}

