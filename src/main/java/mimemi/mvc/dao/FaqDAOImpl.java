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
		Connection con=null;
		PreparedStatement ps=null;
		String sql = proFile.getProperty("faq.updateFaq"); 
		int  result = 0;
		
		try { 
			con= DbUtil.getConnection();
			con.setAutoCommit(false);
			
			ps =con.prepareStatement(sql);
			ps.setString(1, faqDTO.getFaqCategory());
			ps.setString(2, faqDTO.getFaqTitle());
			ps.setString(3, faqDTO.getFaqContent());
			ps.setInt(4, faqDTO.getFaqNo());
			
			result = ps.executeUpdate();
			if(result==0) {
				con.rollback();
				throw new SQLException("공지사항 수정에 실패했습니다.");
			}else {
				//수정한 파일이 값이 있다면, 파일 수정한다.
				if(faqDTO.getFaqAttach()!=null) {
					int re = updateFaqImgCon(con,faqDTO.getFaqNo(),faqDTO.getFaqAttach());
						if(re!=1) {
							con.rollback();
							throw new SQLException("후기 파일 수정에 실패했습니다.");
						}
				}
				con.commit();
			}
		}finally {
			con.commit();
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
    

	/*공지사항 게시글 수정할 때, 이미지만 수정하는 메소드*/
	public int updateFaqImgCon(Connection con,int faqNo, String faqAttach) throws SQLException {
		PreparedStatement ps =null;
		String sql = proFile.getProperty("faq.updateFaqImgCon");
		int result =0;
		
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, faqAttach);
			ps.setInt(2, faqNo);
			
			result=ps.executeUpdate();
			System.out.println("이미지수정 ...dao");
		}finally {
			DbUtil.dbClose(ps, null);
		}
		return result;
	} 

	@Override
	public int updateFaqImg(int faqNo, String faqAttach) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteFaq(int faqNo) throws SQLException {
		Connection con =null;
		PreparedStatement ps = null;
		String sql= proFile.getProperty("faq.deleteFaq");
		int result=0;
		
		try {
			con =DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, faqNo);
			
			result= ps.executeUpdate();
			System.out.println("dao: 삭제한 FAQ번호 "+faqNo);
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		return result;
	}
    /**
     *  FAQ 전체 조회
     **/
	@Override
	public List<FaqDTO> selectAllFaq(int pageNum, String field) throws SQLException {
		
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql = null;
		List<FaqDTO> FaqList = new ArrayList<FaqDTO>();
		
		if(field !=null) {
			 if(field.equals("no")) {
				sql = "select * from (select faq.*, rownum rnum from(select * from faq order by faq_no desc) faq) where rnum>=? and rnum<=?";
				//sql = sql=proFile=proFile.getProperty("faq.selectAllreg);	
			}else if (field.equals("cr")) { //교환/환불
				sql = "select * from (select faq.*, rownum  rnum from(select * from faq where faq_category='CR' order by faq_no desc) faq) where rnum>=? and rnum<=?";
				//sql = sql=proFile=proFile.getProperty("faq.selectCr");				
			}else if (field.equals("us")) {//회원관련
				sql = "select * from (select faq.*, rownum  rnum from(select * from faq where faq_category='US' order by faq_no desc) faq) where rnum>=? and rnum<=?";
				//sql = sql=proFile=proFile.getProperty("faq.selectUs");	
			} else if (field.equals("op")) {//주문/결제
				sql = "select * from (select faq.*, rownum  rnum from(select * from faq where faq_category='OP' order by faq_no desc) faq) where rnum>=? and rnum<=?";
				//sql = sql=proFile=proFile.getProperty("faq.selectOp");	
			} else if (field.equals("de")) {//배송관련
				sql = "select * from (select faq.*, rownum  rnum from(select * from faq where faq_category='DE' order by faq_no desc) faq) where rnum>=? and rnum<=?";
				//sql = sql=proFile=proFile.getProperty("faq.selectDe");	
			} else if (field.equals("ec")) {//기타
				sql = "select * from (select faq.*, rownum  rnum from(select * from faq where faq_category='EC' order by faq_no desc) faq) where rnum>=? and rnum<=?";
			}  	//sql = sql=proFile=proFile.getProperty("faq.selectEc");	
			  else if (field.equals("selectAll")) {//기타
					sql = "select * from (SELECT faq.*, ROWNUM rnum FROM (SELECT * FROM faq order by faq_no desc) faq) where rnum >= ? and rnum <= ?";
				}  	//sql = sql=proFile=proFile.getProperty("faq.selectEc");		
			
		}
			
		try {
			// 전체 레코드 수를 반환하는 메소드로 db에 저장된 총 레코드 수를 구함
			int totalCount = this.getTotalCount(field);
			// 구한 전체 레코드 수로 전체 페이지 수를 구함
			int totalPage = totalCount % FaqListPageCnt.getPagesize() == 0 ? totalCount / FaqListPageCnt.getPagesize() : (totalCount / FaqListPageCnt.getPagesize()) + 1;
			
			FaqListPageCnt FaqListPageCnt = new FaqListPageCnt();
			FaqListPageCnt.setPageCnt(totalPage); 
			FaqListPageCnt.setPageNo(pageNum);  
					
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, ((pageNum - 1) * (FaqListPageCnt.pagesize) + 1)); 
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

	private int getTotalCount(String field) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		//select count(*) from faq
		String sql="";
		//String sql = proFile.getProperty("faq.getTotalCount");
		int totalCount = 0;
		
		if(field !=null) {
			 if(field.equals("selectAll")) {
				sql = "select count(*) from faq";
				//sql = sql=proFile=proFile.getProperty("");	
			}else if (field.equals("cr")) { //교환/환불
				sql = "select count(*) from faq where faq_category = 'CR'";
				//sql = sql=proFile=proFile.getProperty("");				
			}else if (field.equals("us")) {//회원관련
				sql = "select count(*) from faq where faq_category = 'US'";
				//sql = sql=proFile=proFile.getProperty("");	
			} else if (field.equals("op")) {//주문/결제
				sql = "select count(*) from faq where faq_category = 'OP'";
				//sql = sql=proFile=proFile.getProperty("");	
			} else if (field.equals("de")) {//배송관련
				sql = "select count(*) from faq where faq_category = 'DE'";
				//sql = sql=proFile=proFile.getProperty("");	
			} else if (field.equals("ec")) {//기타
				sql = "select count(*) from faq where faq_category = 'EC'";	
			}  	//sql = sql=proFile=proFile.getProperty("");	
		
		}
		
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
	
	/**
	 *  
	 **/
	
	

	
	
	@Override
	public List<FaqDTO> selectByKeyword(String faqKeyword, String field) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}
    /**
     * FAQ 상세보기 
     **/
	
	@Override
	public FaqDTO selectByFaqNo(int faqNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = proFile.getProperty("faq.selectByFaqNo");
		FaqDTO faqDetail = null;

		
		try { 
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, faqNo);
			rs=ps.executeQuery();
			
			if(rs.next()) { 
				faqDetail = new FaqDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getString(6),
						rs.getString(7)
								);	 
		    }
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return faqDetail;
	}

	@Override
	public List<FaqDTO> selectByCtg(String faqCategory) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
