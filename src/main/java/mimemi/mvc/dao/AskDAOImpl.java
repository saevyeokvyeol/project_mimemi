package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mimemi.mvc.dto.AnswerDTO;
import mimemi.mvc.dto.AskDTO;
import mimemi.mvc.paging.AskListPageCnt;
import mimemi.mvc.paging.NoticeListPageCnt;
import mimemi.mvc.util.DbUtil;

public class AskDAOImpl implements AskDAO {

	private Properties proFile = new Properties();

	public AskDAOImpl( ) { 
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
			String value = proFile.getProperty("ask.selectAll");
			System.out.println("value = " + value);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public int insertAsk(AskDTO askDTO) throws SQLException {
		
		Connection con=null;
		PreparedStatement ps=null;
		int result=0;
		String sql = "INSERT INTO ASK(ASK_NO,USER_ID,ASK_TITLE,ASK_CONTENT,ASK_ATTACH,ASK_REGDATE,ASK_CATEGORY,ASK_COMPLETE)VALUES(ASK_NO_SEQ.NEXTVAL,?,?,?,?,SYSDATE,?,?";
		
		
		
		
		return result;
	}

	@Override
	public int updateAsk(AskDTO askDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateAskAttach(int askNo, String askAttach) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAsk(int askNo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AskDTO> selectAllAsk(int pageNum, String field) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		String sql = proFile.getProperty("ask.selectAll");
		
		List<AskDTO> askList = new ArrayList<AskDTO>();
		
		if(field != null) {
			if(field.equals("ask_title")) {
				sql=proFile.getProperty("ask.selectAllTitle");
			}else if(field.equals("ask_content")) {
				sql=proFile.getProperty("ask.selectAllContent");
			}
		}
		
	
		try {
			// 전체 레코드 수를 반환하는 메소드로 db에 저장된 총 레코드 수를 구함
			int totalCount = this.getTotalCount();
			// 구한 전체 레코드 수로 전체 페이지 수를 구함
			int totalPage = totalCount % AskListPageCnt.getPagesize() == 0 ? totalCount / AskListPageCnt.getPagesize() : (totalCount / AskListPageCnt.getPagesize()) + 1;
						
			AskListPageCnt AskListPageCnt = new AskListPageCnt();
			AskListPageCnt.setPageCnt(totalPage);
			AskListPageCnt.setPageNo(pageNum);
			
			
			
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, (pageNum - 1) * AskListPageCnt.pagesize + 1); 
			ps.setInt(2, pageNum * AskListPageCnt.pagesize); 
            
			rs = ps.executeQuery();
			while(rs.next()) {
				askList.add(new AskDTO(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),
						rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8)));
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return askList;
	}
	/**
	 * 전체 레코드 수 반환
	 * */

	private int getTotalCount() throws SQLException{
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs= null;
		
		String sql = proFile.getProperty("ask.getTotalCount");
		int totalCount = 0;
		try {
			con= DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		return totalCount;
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
	public int updateState(int askNo, String state) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<AnswerDTO> selectAnsByAskNo(int askNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
