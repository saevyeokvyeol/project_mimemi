package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.GoodsDTO;

public interface GoodsDAO {
	/**
	 * 상품 등록
	 *
	 * */
	int goodsInsert(GoodsDTO goods) throws SQLException;
	
	/**
	 * 상품 수정
	
	 * */
	int goodsUpdate(GoodsDTO goods) throws SQLException;
	
	/**
	 * 상품 판매 여부 수정

	 * */
	int goodsUpdateForSale(String goodsId, String goodsSale) throws SQLException;
	
	/**
	 * 상품 썸네일 수정
	
	 * */
	int goodsUpdateThumbnail(String goodsId, String goodsThumbnail) throws SQLException;
	
	
	/**
	 * 전체 상품 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<GoodsDTO>(전체 상품의 모든 데이터를 가지고 옴)
	 * 
	 * }
	 * */
	List<GoodsDTO> goodsSelectAll() throws SQLException;
	
	/**
	 * 시간 남으면 판매량 순, 가격 순 조회 만들기 !! 
	 */
	
	/**
	 * 판매 중인 상품 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<GoodsDTO>(goodsSale이 Y인 상품)
	 * */
	List<GoodsDTO> goodsSelectForSale() throws SQLException;
	
	/**
	 * 상품명으로 상품 조회
	 * @param: 이름에 해당 키워드가 들어가는지 체크할 키워드를 받음
	 * @return: List<GoodsDTO>(상품명에 키워드가 들어가는 상품)
	 * */


	List<GoodsDTO> goodsSelectByKeyword(String keyword) throws SQLException;

	/**
	 * 고객이 주문한 식단명 가져오기
	 * @param String userId
	 * @return List<GoodsDTO>
	 * */
	List<GoodsDTO> selectOrderGoods(String userId) throws SQLException;
}