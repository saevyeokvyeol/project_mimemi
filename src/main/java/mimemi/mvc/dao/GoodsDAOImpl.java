package mimemi.mvc.dao;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import mimemi.mvc.util.DbUtil;
import mimemi.mvc.dto.GoodsDTO;

public class GoodsDAOImpl implements GoodsDAO {
	private Properties proFile = new Properties();
	
	/**
	 * dbQuery.properties 로딩해 Properties 객체에 저장
	 * */
	public GoodsDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// select * from goods -> oods전체 확인 
	public List<GoodsDTO> goodsSelectAll() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		String sql = proFile.getProperty("goods.selectAll");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				GoodsDTO goods = new GoodsDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6).equals("Y"), rs.getString(7));
				list.add(goods);
			}
			System.out.println(list.size());
			
		} finally {
			DbUtil.dbClose(rs, ps, con);
			
		}
		return list;
	}

	@Override
	public int goodsInsert(GoodsDTO goods) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = proFile.getProperty("goods.insert");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			// goods.insert = insert into goods (goods_id, goods_name, goods_detail, goods_thumbnail, goods_price, goods_sale, goods_detail_image) values (?, ?, ?, ?, ?, ?, ?)
			ps.setString(1, goods.getGoodsId());
			ps.setString(2,goods.getGoodsName());
			ps.setString(3,goods.getGoodsDetail());
			ps.setString(4,goods.getGoodsThumbnail());
			ps.setInt(5,goods.getGoodsPrice());
			ps.setBoolean(6, goods.isGoodsSale());
			ps.setString(7,goods.getGoodsDetailImg());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}

	@Override
	public int goodsUpdate(GoodsDTO goods) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = proFile.getProperty("goods.update");
		// goods.update = update goods set goods_name = ?, goods_detail = ?, goods_thumbnail = ?, goods_price = ?, goods_sale = ?, goods_detail_image = ? where goods_id = ?
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(7, goods.getGoodsId());
			ps.setString(1,goods.getGoodsName());
			ps.setString(2,goods.getGoodsDetail());
			ps.setString(3,goods.getGoodsThumbnail());
			ps.setInt(4,goods.getGoodsPrice());
			ps.setBoolean(5, goods.isGoodsSale());
			ps.setString(6,goods.getGoodsDetailImg());
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
			
		}
		return result;
	}

	@Override
	public int goodsUpdateForSale(String goodsId, String goodsSale) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = proFile.getProperty("goods.updateForSale");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, goodsSale);
			ps.setString(2, goodsId);
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
			
		}
		return result;
	}

	@Override
	public int goodsUpdateThumbnail(String goodsId, String goodsThumbnail) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		int result = 0;
		String sql = proFile.getProperty("goods.updateForSale");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, goodsThumbnail);
			ps.setString(2, goodsId);
			result = ps.executeUpdate();
		} finally {
			DbUtil.dbClose(ps, con);
			
		}
		return result;
	}
	

	@Override
	public List<GoodsDTO> goodsSelectForSale() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		String sql = proFile.getProperty("goods.selectForSale");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
//				String forSaleString = rs.getString(6);
//				boolean forSaleBoolean;
//				if (forSaleString.equals("Y")) {
//					forSaleBoolean = true;
//				} else {
//					forSaleBoolean = false;
//				}
				GoodsDTO goods = new GoodsDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6).equals("Y"), rs.getString(7));
				list.add(goods);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
			
		}
		return list;
	}

	@Override
	public List<GoodsDTO> selectByKeyword(String keyword) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		String sql = proFile.getProperty("goods.selectForKeyword");
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, "%" + keyword + "%");
			rs = ps.executeQuery();
			while (rs.next()) {
//				String forSaleString = rs.getString(6);
//				boolean forSaleBoolean;
//				if (forSaleString.equals("Y")) {
//					forSaleBoolean = true;
//				} else {
//					forSaleBoolean = false;
//				}
				GoodsDTO goods = new GoodsDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6).equals("Y"), rs.getString(7));
				list.add(goods);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
			
		}
		return list;
	}

	/**
	 * 고객이 주문한 식단 가져오기
	 * @param String userId
	 * @return List<String>
	 * */
	@Override
	public List<GoodsDTO> selectOrderGoods(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = proFile.getProperty("goods.selectOrderGoods");
		List<GoodsDTO> list = new ArrayList<GoodsDTO>();
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			rs = ps.executeQuery();
			while(rs.next()) {
				GoodsDTO goods = new GoodsDTO(rs.getString(1), rs.getString(2));
				list.add(goods);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return list;
	}
	/**
	 * 상품 ID로 상품 상세 가져오기
	 */
	public GoodsDTO goodsSelectByGoodsId(String goodsId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("goods.selectByGoodsId");
		GoodsDTO goods = null;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, goodsId);
			rs = ps.executeQuery();
			rs.next();
			goods = new GoodsDTO();
			goods.setGoodsId(rs.getString(1));
			goods.setGoodsName(rs.getString(2));
			goods.setGoodsDetail(rs.getString(3));
			goods.setGoodsThumbnail(rs.getString(4));
			goods.setGoodsPrice(rs.getInt(5));
		} finally {
			DbUtil.dbClose(rs, ps, con);
			
		}
		return goods;
	}
}
