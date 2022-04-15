package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.GoodsDTO;

public interface GoodsDAO {
	/**
	 * 상품 등록
	 * @param: GoodsDTO(String goodsId, String goodsName, String goodsDetail, String goodsThumbnail,
	 * 		   int goodsPrice, String goodsDetailImg)
	 * @return: int(등록된 데이터 수)
	 * */
	int insert(GoodsDTO goods) throws SQLException;
	
	/**
	 * 상품 수정
	 * @param: GoodsDTO(String goodsId, String goodsName, String goodsDetail, int goodsPrice)
	 * @return: int(수정된 데이터 수)
	 * */
	int update(GoodsDTO goods) throws SQLException;
	
	/**
	 * 상품 판매 여부 수정
	 * @param: String goodsId, String goodsSale
	 * @return: int(수정된 데이터 수)
	 * */
	int updateForSale(String goodsId, String goodsSale) throws SQLException;
	
	/**
	 * 상품 썸네일 수정
	 * @param: String goodsId, String goodsThumbnail
	 * @return: int(수정된 데이터 수)
	 * */
	int updateThumbnail(String goodsId, String goodsThumbnail) throws SQLException;
	
	/**
	 * 상품 상세이미지 수정
	 * @param: String goodsId, String goodsDetailImg
	 * @return: int(수정된 데이터 수)
	 * */
	int updateDetailImg(String goodsId, String goodsDetailImg) throws SQLException;
	
	/**
	 * 상품 썸네일 삭제
	 * @param: String goodsId
	 * @return: int(수정된 데이터 수)
	 * */
	int deleteThumbnail(String goodsId) throws SQLException;
	
	/**
	 * 상품 상세이미지 삭제
	 * @param: String goodsId
	 * @return: int(수정된 데이터 수)
	 * */
	int deleteDetailImg(String goodsId) throws SQLException;
	
	/**
	 * 전체 상품 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<GoodsDTO>(전체 상품의 모든 데이터를 가지고 옴)
	 * 
	 * 높은가격순, 낮은가격순
	 * if(String.equals("높은 가격순")){
	 * 	sql = "높은 가격순 쿼리 불러오는... properties..."
	 * }
	 * */
	List<GoodsDTO> selectAll(String sort) throws SQLException;
	
	/**
	 * 판매 중인 상품 조회
	 * @param: 정렬 방식을 인수로 받아 쿼리문의 order by에 변화를 줌
	 * @return: List<GoodsDTO>(goodsSale이 Y인 상품)
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
	GoodsDTO selectByGoodsId(String goodsId) throws SQLException;
	
}
