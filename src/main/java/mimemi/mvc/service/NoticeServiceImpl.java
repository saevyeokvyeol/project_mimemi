package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.NoticeDAO;
import mimemi.mvc.dao.NoticeDAOImpl;
import mimemi.mvc.dto.NoticeDTO;

public class NoticeServiceImpl implements NoticeService {
	private NoticeDAO noticeDao = new NoticeDAOImpl();

	@Override
	public void insertNotice(NoticeDTO noticeDTO) throws SQLException {
		int result = noticeDao.insertNotice(noticeDTO);
		if(result==0)throw new SQLException("등록되지 않았습니다.");

	}

	@Override
	public void updateNotice(NoticeDTO noticeDTO) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void updateNoticeAttach(int noticeNo, String noticeAttach) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteNotice(int noticeNo) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<NoticeDTO> selectAllNotice(int pageNum, String filed) throws SQLException {
		List<NoticeDTO> list = noticeDao.selectAllNotice(pageNum, filed);
		
		return list;
	}
    

	@Override
	public List<NoticeDTO> selectAllByPaging(int pageNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeDTO selectByNoticeNo(int noticeNo) throws SQLException {
			NoticeDTO noticeDetail = noticeDao.selectByNoticeNo(noticeNo);
			 if(noticeDetail==null) {
				 throw new SQLException("상세보기를 불러올 수 없습니다.");
			 }
			return noticeDetail;
		}
		

	@Override
	public List<NoticeDTO> selectByKeyword(String noticeKeyword, String field) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
