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
		String sql = proFile.getProperty("ask.insert");	
		
		try {
			con = DbUtil.getConnection();
			ps=con.prepareStatement(sql);
		
		System.out.println(askDTO.getAskTitle());
			ps.setString(1, askDTO.getUserId());
			ps.setString(2, askDTO.getAskTitle());
			ps.setString(3, askDTO.getAskContent());
			
			ps.setString(4, askDTO.getAskAttach());
			ps.setString(5, askDTO.getAskCategory());
			
			
			result= ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		
		
		return result;
	}
	/**
	 * 1:1문의 업데이트
	 * */
	@Override
	public int updateAsk(AskDTO askDTO) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String sql=proFile.getProperty("ask.update");
		int result = 0;
		
		try {
			con=DbUtil.getConnection();
			con.setAutoCommit(false);
			
			ps=con.prepareStatement(sql);
			ps.setString(1, askDTO.getAskTitle());
			ps.setString(2, askDTO.getAskContent());
			ps.setInt(3, askDTO.getAskNo());
			
			result=ps.executeUpdate();
			if(result==0) {
				con.rollback();
				throw new SQLException("문의수정에 실패하였습니다.");
			}else {
				if(askDTO.getAskAttach()!=null) {
					int re = updateAskAttachCon(con,askDTO.getAskNo(),askDTO.getAskAttach());
						if(re!=1) {
							con.rollback();
							throw new SQLException("후기 파일 수정에 실패했습니다.");
						}
				}
			}
			
		}finally {
			con.commit();
			DbUtil.dbClose(ps, con);
		}
		
		
		return result;
	}
	
	//1:1문의 첨부파일 수정
	public int updateAskAttachCon(Connection con,int askNo, String askAttach) throws SQLException {
		PreparedStatement ps =null;
		String sql = proFile.getProperty("ask.updateAskAttachCon");
		int result =0;
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, askAttach);
			ps.setInt(2, askNo);
			
			result=ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, null);
		}
		
		return result;
	}

	@Override
	public int updateAskAttach(int askNo, String askAttach) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAsk(int askNo) throws SQLException {
		Connection con = null;
		PreparedStatement ps=null;
		
		String sql = proFile.getProperty("ask.delete");
		int result = 0;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, askNo);
			result = ps.executeUpdate();
			
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		
		return result;
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
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		AskDTO askDto=null;
		String sql = proFile.getProperty("ask.detail");

		try {
			con=DbUtil.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, askNo);
			
			rs=ps.executeQuery();
			if(rs.next()) {
				askDto = new AskDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5));
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}

		
		return askDto;
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
