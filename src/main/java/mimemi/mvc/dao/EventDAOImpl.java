package mimemi.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import mimemi.mvc.dto.EventDTO;
import mimemi.mvc.util.DbUtil;

public class EventDAOImpl implements EventDAO {
	private Properties proFile = new Properties();
	
	/**
	 * dbQuery.properties 로딩해 Properties 객체에 저장
	 * */
	public EventDAOImpl() {
		try {
			proFile.load(getClass().getClassLoader().getResourceAsStream("dbQuery.properties"));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 이벤트 게시글 등록
	 * @param: EventDTO(int eventId, String eventTitle, String eventContent, String eventAttach, String eventImg,
	 * 			String eventStartdate, String eventEnddate)
	 * @return: int(등록 성공한 레코드 수)
	 * */
	@Override
	public int insert(EventDTO event) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/**
	 * 이벤트 게시글 수정
	 * @param: EventDTO(int eventId, String eventTitle, String eventContent, String eventStartdate,
	 * 			String eventEnddate)
	 * 			게시글 제목과 내용, 시작일과 종료일만 변경
	 * @return: int(수정 성공한 레코드 수)
	 * */
	@Override
	public int updateEvent(EventDTO event) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 이벤트 게시글 썸네일 이미지 수정
	 * @param: int eventId, String eventImg
	 * @return: int(수정 성공한 레코드 수)
	 * */
	@Override
	public int updateEventImg(int eventId, String eventImg) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/**
	 * 이벤트 게시글 상세 이미지 수정
	 * @param: int eventId, String eventAttach
	 * @return: int(수정 성공한 레코드 수)
	 * */
	@Override
	public int updateEventAttach(int eventId, String eventAttach) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/**
	 * 이벤트 게시글 전체 조회
	 * @return: List<EventDTO>
	 * */
	@Override
	public List<EventDTO> selectAll() throws SQLException {
		Connection con =null;
		PreparedStatement ps =null;
		ResultSet rs =null;
		
		List<EventDTO> eventList = new ArrayList<EventDTO>();
		SimpleDateFormat eventFormat = new SimpleDateFormat("yyyy-MM-dd");
		
		//event.selectAll=select * from EVENT order by EVENT_NO desc
		String sql = proFile.getProperty("event.selectAll");
		
		try {
			con = DbUtil.getConnection();
			ps = con.prepareStatement(sql);
			
			rs = ps.executeQuery();
			while(rs.next()) {
				EventDTO event = new EventDTO(
						rs.getInt(1),
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						eventFormat.format(rs.getDate(6)),
						eventFormat.format(rs.getDate(7)), 
						eventFormat.format(rs.getDate(8))
						);
				
				eventList.add(event);
			}
			
			
		}finally {
			DbUtil.dbClose(rs, ps, con);
		}
			
	
		return eventList;
	}

	/**
	 * 이벤트 게시글 진행 상황별 조회
	 * sysdate를 기준으로 진행 예정/ 진행중 / 진행 완료를 나누어 조회
	 * @param: String state(진행 예정, 진행중, 진행 완료에 따라 쿼리문 변경)
	 * @return: List<EventDTO>
	 * */
	@Override
	public List<EventDTO> selectByDate(String state) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 이벤트 게시글 상세 조회
	 * 글번호 기준으로 게시글 상세 조회
	 * @param: int eventNo
	 * @return: EventDTO
	 * */
	@Override
	public EventDTO selectByEventNo(int eventNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 이벤트 전체 검색(페이지 처리)
	 * @param int pageNo
	 * 특정 페이지를 클릭했을 때 그 페이지로 넘어간다.
	 * */
	@Override
	public List<EventDTO> getEventList(int pageNo) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

}
