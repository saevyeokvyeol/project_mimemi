package mimemi.mvc.dao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;


import mimemi.mvc.dto.NoticeDTO;
import mimemi.mvc.util.DbUtil;

public class NoticeDAOImpl implements NoticeDAO {
	private Properties proFile = new Properties();
	
	public NoticeDAOImpl( ) { 
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
			String value = proFile.getProperty("notice.selectAllNotice");
			System.out.println("value = " + value);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override //공지사항 게시판 등록
	public int insertNotice(NoticeDTO noticeDTO) throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		String sql = proFile.getProperty("notice.insertNotice"); 
		int result = 0;
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, noticeDTO.getNoticeNo());
			ps.setString(2, noticeDTO.getNoticeTitle());
			ps.setString(3, noticeDTO.getNoticeContent());
			ps.setString(4, noticeDTO.getNoticeAttach());
			ps.setString(5, noticeDTO.getNoticeRegdate());
			
			result = ps.executeUpdate();
		}finally {
			DbUtil.dbClose(ps, con);
		}
		
		return result;
	}

	@Override
	public int updateNotice(NoticeDTO noticeDTO) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateNoticeAttach(int noticeNo, String noticeAttach) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(int noticeNo) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<NoticeDTO> selectAllNotice() throws SQLException {
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		List<NoticeDTO> NoticeDtoList = new ArrayList<NoticeDTO>();
		String sql = proFile.getProperty("notice.insertNotice");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				NoticeDTO notice = new NoticeDTO(rs.getInt(1), rs.getString(2), rs.getString(3),
						               rs.getString(4), rs.getString(5));
				
				NoticeDtoList.add(notice);
			}
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
		return NoticeDtoList;
	}

	@Override
	public List<NoticeDTO> selectAllByPaging(int pageNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NoticeDTO selectByNoticeNo(int noticeNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<NoticeDTO> selectByKeyword(String noticeKeyword, String field) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
