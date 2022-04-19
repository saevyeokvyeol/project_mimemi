package mimemi.mvc.service;

import java.sql.SQLException;

import mimemi.mvc.dao.AddrDAO;
import mimemi.mvc.dao.AddrDAOImpl;
import mimemi.mvc.dto.AddrDTO;

public class AddrServiceImpl implements AddrService {
	private AddrDAO addrDAO = new AddrDAOImpl();
	
	@Override
	public AddrDTO selectByAddrName(String addrName) throws SQLException {
		AddrDTO addr = addrDAO.selectByAddrName(addrName);
		
		return addr;
	}

	@Override
	public AddrDTO selectByAddrId(int addrId) throws SQLException {
		AddrDTO addr = addrDAO.selectByAddrId(addrId);

		return addr;
	}

}