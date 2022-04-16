package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.AskDAO;
import mimemi.mvc.dao.AskDAOImpl;
import mimemi.mvc.dto.AskDTO;
import mimemi.mvc.dto.UserDTO;

public class AskServiceImpl implements AskService {

	private AskDAO askDao = new AskDAOImpl();
	
	@Override
	public void insertAsk(AskDTO askDTO) throws SQLException {
		
		int result = askDao.insertAsk(askDTO);
		if(result==0)throw new SQLException("등록되지 않았습니다");

	}

	@Override
	public void updateAsk(AskDTO askDTO) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateAskAttach(int askNo, String askAttach) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteAsk(int askNo, String password, String path) throws SQLException {
		//비밀번호 일치 여부 체크
			askDao.selectAnsByAskNo(askNo);
		
		
	}

	@Override
	public List<AskDTO> selectAllAsk() throws SQLException {
		
		List<AskDTO> list = askDao.selectAllAsk();
		
		return list;
	}

	@Override
	public List<AskDTO> selectAllByPaging(int pageNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public AskDTO selectByAskNo(int askNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateState(int askNo, String state) throws SQLException {
		// TODO Auto-generated method stub

	}

}
