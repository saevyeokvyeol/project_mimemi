package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.GoodsDTO;

public interface GoodsService {
	/**
	 * 상품 등록
	 * @param: GoodsDTO(String goodsId, String goodsName, String goodsDetail, String goodsThumbnail,
	 * 		   int goodsPrice, boolean goodsSale, String goodsDetailImg)
	 * */
	void insert(GoodsDTO goods) throws SQLException;
	
	/**
	 * 상품 수정
	 * @param: GoodsDTO(String goodsId, String goodsName, String goodsDetail, int goodsPrice)
	 * */
	void update(GoodsDTO goods) throws SQLException;
	
	/**
	 * 상품 썸네일 수정
	 * @param: GoodsDTO(String goodsId, String goodsThumbnail)
	 * */
	void updateThumbnail(GoodsDTO goods) throws SQLException;
	
	/**
	 * 상품 상세이미지 수정
	 * @param: GoodsDTO(String goodsId, String goodsDetailImg)
	 * */
	void updateDetailImg(GoodsDTO goods) throws SQLException;
	
	/**
	 * 상품 썸네일 삭제
	 * @param: String goodsId
	 * */
	void deleteThumbnail(String goodsId) throws SQLException;
	
	/**
	 * 상품 상세이미지 삭제
	 * @param: String goodsId
	 * */
	void deleteDetailImg(String goodsId) throws SQLException;
	
	/**
	 * 상품 삭제
	 * : 실제 삭제하는 것이 아니라 판매 여부 컬럼을 수정해 메인 사이트에서 보이지 않도록 처리함
	 * @param: GoodsDTO(String goodsId, boolean goodsSale)
	 * */
	void delete(GoodsDTO goods) throws SQLException;
	
	/**
	 * 전체 상품 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<GoodsDTO>(전체 상품의 모든 데이터를 가지고 옴)
	 * */
	List<GoodsDTO> selectAll(String sort) throws SQLException;
	
	/**
	 * 판매 중인 상품 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<GoodsDTO>(goodsSale이 true인 상품)
	 * */
	List<GoodsDTO> selectForSale(String sort) throws SQLException;
	
	/**
	 * 상품명으로 상품 조회
	 * @param: 이름에 해당 키워드가 들어가는지 체크할 키워드를 받음
	 * @return: List<GoodsDTO>(상품명에 키워드가 들어가는 상품)
	 * */
	List<GoodsDTO> selectByKeyword(String keyword) throws SQLException;
	
	/**
	 * 상품코드로 상품 조회
	 * @param: 조회할 상품 코드
	 * @return: GoodsDTO(인수로 받은 ID와 상품 아이디가 동일한 상품)
	 * */
	GoodsDTO selectByㅇoodsId(String goodsId) throws SQLException;
	
	
}
