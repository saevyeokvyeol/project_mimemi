package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.FaqDAO;
import mimemi.mvc.dao.FaqDAOImpl;
import mimemi.mvc.dto.FaqDTO;

public class FaqServiceImpl implements FaqService {
	private FaqDAO faqDao = new FaqDAOImpl();

	@Override
	public void insertFaq(FaqDTO faqDTO) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateFaq(FaqDTO faqDTO) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateFaqImg(int faqNo, String faqAttach) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteFaq(int faqNo) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<FaqDTO> selectAllFaq(int pageNum, String filed) throws SQLException {
        List<FaqDTO> list = faqDao.selectAllFaq(pageNum, filed);
		
		return list;
	}

	@Override
	public List<FaqDTO> selectAllByPaging(int pageNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FaqDTO> selectByKeyword(String faqKeyword, String field) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FaqDTO selectByFaqNo(int faqNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<FaqDTO> selectByCtg(String faqCategory) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
