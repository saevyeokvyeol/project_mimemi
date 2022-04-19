package mimemi.mvc.dao;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dto.AddrDTO;

public interface AddrDAO {
	
	/**
	 * addrName으로 select해오는 기능
	 * */
	AddrDTO selectByAddrName(String addrName) throws SQLException;
	
	/**
	 * addrId으로 select해오는 기능
	 * */
	AddrDTO selectByAddrId(int addrId) throws SQLException;

	/**
	 * 유저 아이디로 주소 셀렉트
	 * */
	List<AddrDTO> selectByUserId(String userId) throws SQLException;
}
