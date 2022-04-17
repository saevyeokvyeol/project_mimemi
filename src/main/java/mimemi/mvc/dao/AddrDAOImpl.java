package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
		AddrDTO addr = new AddrDTO();
		
		String sql = "select * from addr where addr_name=?";
		
		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setString(1, addrName);
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
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return addr;
	}

}
