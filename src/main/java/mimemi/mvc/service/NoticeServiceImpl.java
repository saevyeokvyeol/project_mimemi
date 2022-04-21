package mimemi.mvc.service;

import java.sql.SQLException;
import java.io.File;
import java.util.List;

import mimemi.mvc.dao.NoticeDAO;
import mimemi.mvc.dao.NoticeDAOImpl;
import mimemi.mvc.dto.NoticeDTO;

public class NoticeServiceImpl implements NoticeService {
	private NoticeDAO noticeDao = new NoticeDAOImpl();

	@Override
	public void insertNotice(NoticeDTO noticeDTO, String path) throws SQLException {
		int result = noticeDao.insertNotice(noticeDTO);
		//등록에 오류가 난다면
		if(result==0) {
			//첨부파일이 있다면 save폴더에 저장한 첨부파일 삭제하기
			if(noticeDTO.getNoticeAttach()!=null) {
				new java.io.File(path+"/"+noticeDTO.getNoticeAttach()).delete(); //경로확인하기
			}
			throw new SQLException("공지사항이 등록되지 않았습니다.");
		}

	}

	@Override
	public void updateNotice(NoticeDTO noticeDTO, String path) throws SQLException {
		NoticeDTO dbnotice = noticeDao.selectByNoticeNo(noticeDTO.getNoticeNo());
		if(dbnotice==null) {
			throw new SQLException("공지사항을 찾을 수 없습니다.");
		}
		//db저장한 기존 리뷰의 첨부파일명을 미리 구한다.
         String dbAttach = dbnotice.getNoticeAttach();
       //dao로 게시물 수정한다.
         int result = noticeDao.updateNotice(noticeDTO);
			
			if(result==0) {
				//첨부파일이 있다면 save폴더에 예전에 첨부한 첨부파일 삭제하기
				if(dbAttach!=null) {
					new java.io.File(path+"/"+dbAttach).delete(); //경로확인하기
				}
				throw new SQLException("수정되지 않았습니다.");
			}else {
				//첨부파일이 있다면 save폴더에 예전에 첨부한 첨부파일 삭제하기
				if(dbAttach!=null) {
					new java.io.File(path+"/"+dbAttach).delete(); //경로확인하기
				}
				System.out.println("삭제되야할 기존 파일이름:"+dbAttach);
			}
			

	}


	@Override
	public void updateNoticeAttach(int noticeNo, String noticeAttach) throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteNotice(NoticeDTO notice, String path) throws SQLException {
		//db에서 삭제한다.
		int result =noticeDao.deleteNotice(notice.getNoticeNo());
		if(result==0) {
			throw new SQLException("삭제에 오류가 생겨 삭제되지 않았습니다.");
		}
		//게시물을 삭제했다면 save 폴더에서 삭제한다.
		if(notice.getNoticeAttach()!=null) {
			new java.io.File(path+"/"+notice.getNoticeAttach()).delete();
		}
		System.out.println("폴더에서 삭제완료");

	}

	@Override
	public List<NoticeDTO> selectAllNotice(int pageNum, String field) throws SQLException {
		List<NoticeDTO> list = noticeDao.selectAllNotice(pageNum, field);
		
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
		
    /**
     * 키워드 전체 조회
     **/
	@Override
	public List<NoticeDTO> selectByKeyword(String noticeKeyword, String field, int pageNo) throws SQLException {
		List<NoticeDTO> list = noticeDao.selectByKeyword(noticeKeyword, field ,pageNo);
	    return list;
	}

	@Override
	public List<NoticeDTO> selectByKeywordClient(String noticeKeyword, String field, int pageNo) throws SQLException {
		List<NoticeDTO> list = noticeDao.selectByKeywordClient(noticeKeyword, field ,pageNo);
	    return list;
	}

	
	
}
