package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mimemi.mvc.dto.AddrDTO;
import mimemi.mvc.util.DbUtil;

public class AddrDAOImpl implements AddrDAO {
	private Properties proFile = new Properties();
	
	@Override
	public AddrDTO selectByAddrName(String addrName) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		AddrDTO addr = null;
		
		String sql = "select * from addr where addr_name=?";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, addrName);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				addr = new AddrDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return addr;
	}

	@Override
	public AddrDTO selectByAddrId(int addrId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		AddrDTO addr = new AddrDTO();
		
		String sql = "select * from addr where addr_id=?";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, addrId);
			
			rs = ps.executeQuery();
			if(rs.next()) {
				addr = new AddrDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return addr;
	}
	
	@Override
	public List<AddrDTO> selectByUserId(String userId) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		List<AddrDTO> list = new ArrayList<AddrDTO>();

		String sql = proFile.getProperty("addr.selectByUserId");

		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, userId);

			rs = ps.executeQuery();
			if(rs.next()) {
				AddrDTO addr = new AddrDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getInt(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9));
				list.add(addr);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}

		return list;
	}

}
