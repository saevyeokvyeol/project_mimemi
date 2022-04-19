package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.GoodsDTO;

public interface GoodsService {
	/**
	 * 상품 등록
	 * @param: GoodsDTO(String goodsId, String goodsName, String goodsDetail, String goodsThumbnail,
	 * 		   int goodsPrice, String goodsDetailImg)
	 * */
	void goodsInsert(GoodsDTO goods) throws SQLException;
	
	/**
	 * 상품 수정
	 * @param: GoodsDTO(String goodsId, String goodsName, String goodsDetail, int goodsPrice)
	 * */
	void goodsUpdate(GoodsDTO goods) throws SQLException;
	
	/**
	 * 상품 판매 여부 수정
	 * @param: String goodsId, String goodsSale
	 * */
	void goodsUpdateForSale(String goodsId, String goodsSale) throws SQLException;
	
	/**
	 * 상품 썸네일 수정
	 * @param: String goodsId, String goodsThumbnail
	 * */
	void goodsUpdateThumbnail(String goodsId, String goodsThumbnail) throws SQLException;
			
	/**
	 * 전체 상품조회 (상품 목록을 가져오기)
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<GoodsDTO>(전체 상품의 모든 데이터를 가지고 옴)
	 * 
	 * 
	 */
	public List<GoodsDTO> goodsSelectAll() throws SQLException;
	/**
	 * 판매 중인 상품 조회
	 * @return: List<GoodsDTO>(goodsSale이 Y인 상품)
	 * */
	public List<GoodsDTO> goodsSelectForSale() throws SQLException;
	
	/**
	 * 상품명으로 상품 조회
	 * @param: 이름에 해당 키워드가 들어가는지 체크할 키워드를 받음
	 * @return: List<GoodsDTO>(상품명에 키워드가 들어가는 상품)
	 * */
	public List<GoodsDTO> goodsSelectByKeyword(String keyword) throws SQLException;
	
	/**
	 * 상품코드로 상품 조회
	 * @param: 조회할 상품 코드
	 * @return: GoodsDTO(인수로 받은 ID와 상품 아이디가 동일한 상품)
	 * */
	GoodsDTO selectByGoodsId(String goodsId) throws SQLException;

	/**
	 * 고객이 주문한 식단명 가져오기
	 * @param String userId
	 * @return List<GoodsDTO>
	 * */
	List<GoodsDTO> selectOrderGoods(String userId) throws SQLException;
	
}
