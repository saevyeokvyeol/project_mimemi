package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mimemi.mvc.dto.FaqDTO;
import mimemi.mvc.dto.NoticeDTO;
import mimemi.mvc.paging.FaqListPageCnt;
import mimemi.mvc.paging.NoticeListPageCnt;
import mimemi.mvc.util.DbUtil;

public class FaqDAOImpl implements FaqDAO {
	private Properties proFile = new Properties();
	
	public FaqDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
			String value = proFile.getProperty("faq.selectAllNotice");
			System.out.println("value = " + value);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
 
	/**
     * FAQ 등록 
     **/
	
	@Override
	public int insertFaq(FaqDTO faqDTO) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null; 
		String sql = proFile.getProperty("faq.insertFaq");
		int result = 0;
		
		try { 
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, faqDTO.getFaqTitle());
			ps.setString(2, faqDTO.getFaqContent());
			ps.setString(3, faqDTO.getFaqAttach());
			ps.setString(4, faqDTO.getFaqCategory());
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		
		return result;
	}
 
	
	@Override
	public int updateFaq(FaqDTO faqDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateFaqImg(int faqNo, String faqAttach) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFaq(int faqNo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
    /**
     *  FAQ 전체 조회
     **/
	@Override
	public List<FaqDTO> selectAllFaq(int pageNum, String filed) throws SQLException {
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql = proFile.getProperty("faq.selectAllFaq");
		List<FaqDTO> FaqList = new ArrayList<FaqDTO>();
		
		if(filed !=null) {
			if (filed.equals("faq_title")) {
				sql = proFile.getProperty("faq.selectAllTitle");
			} else if (filed.equals("faq_content")) { 
				sql = proFile.getProperty("faq.selectAllContent");
			}
		}
			
		try {
			// 전체 레코드 수를 반환하는 메소드로 db에 저장된 총 레코드 수를 구함
			int totalCount = this.getTotalCount();
			// 구한 전체 레코드 수로 전체 페이지 수를 구함
			int totalPage = totalCount % FaqListPageCnt.getPagesize() == 0 ? totalCount / FaqListPageCnt.getPagesize() : (totalCount / FaqListPageCnt.getPagesize()) + 1;
			
			FaqListPageCnt FaqListPageCnt = new FaqListPageCnt();
			FaqListPageCnt.setPageCnt(totalPage); 
			FaqListPageCnt.setPageNo(pageNum);  
					
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, (pageNum - 1) * FaqListPageCnt.pagesize + 1); 
			ps.setInt(2, pageNum * FaqListPageCnt.pagesize); 
            
			rs = ps.executeQuery();
			while(rs.next()) {
				FaqList.add(new FaqDTO(rs.getInt(1), rs.getString(2), rs.getString(3),
			               rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
				
			}
		
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return FaqList;
	}

	/**
	 * 전체 레코드 수 반환
	 * */

	private int getTotalCount() throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		String sql = proFile.getProperty("faq.getTotalCount");
		int totalCount = 0;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		} finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return totalCount;
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
