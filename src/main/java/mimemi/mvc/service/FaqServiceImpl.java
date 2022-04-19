package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.FaqDAO;
import mimemi.mvc.dao.FaqDAOImpl;
import mimemi.mvc.dto.FaqDTO;
import mimemi.mvc.dto.NoticeDTO;

public class FaqServiceImpl implements FaqService {
	private FaqDAO faqDao = new FaqDAOImpl();

	@Override
	public void insertFaq(FaqDTO faqDTO,String path) throws SQLException {
		int result = faqDao.insertFaq(faqDTO);
		//등록에 오류가 난다면
		if(result==0) {
			//첨부파일이 있다면 save폴더에 저장한 첨부파일 삭제하기
			if(faqDTO.getFaqAttach()!=null) {
				new java.io.File(path+"/"+faqDTO.getFaqAttach()).delete(); //경로확인하기
			}
			throw new SQLException("후기가 등록되지 않았습니다.");
		}

	}

	@Override
	public void updateFaq(FaqDTO faqDTO, String path) throws SQLException {
		FaqDTO dbfaq = faqDao.selectByFaqNo(faqDTO.getFaqNo());
		if(dbfaq==null) {
			throw new SQLException("FAQ를 찾을수 없습니다.");
		}
		//db저장한 기존 리뷰의 첨부파일명을 미리 구한다.
         String dbAttach = dbfaq.getFaqAttach();
       //dao로 게시물 수정한다.
         int result = faqDao.updateFaq(faqDTO);
			
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
	
		return null;
	}

	@Override
	public FaqDTO selectByFaqNo(int faqNo) throws SQLException {
		FaqDTO faqDetail = faqDao.selectByFaqNo(faqNo);
		 if(faqDetail==null) {
			 throw new SQLException("상세보기를 불러올 수 없습니다.");
		 }
		return faqDetail;
	}

	@Override
	public List<FaqDTO> selectByCtg(String faqCategory) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
