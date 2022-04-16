package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mimemi.mvc.dto.AnswerDTO;
import mimemi.mvc.dto.AskDTO;
import mimemi.mvc.util.DbUtil;
import oracle.jdbc.driver.DBConversion;

public class AskDAOImpl implements AskDAO {

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
	public List<AskDTO> selectAllAsk() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<AskDTO> askList = new ArrayList<AskDTO>();
		
		String sql ="select * from ask";
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				AskDTO ad = new AskDTO(rs.getInt(1),rs.getString(2),rs.getString(3), 
						rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8));
				
				askList.add(ad);
				
			}
		
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		
		
		return askList;
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
