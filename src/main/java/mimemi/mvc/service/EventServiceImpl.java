package mimemi.mvc.service;

import java.sql.SQLException;
import java.util.List;

import mimemi.mvc.dao.EventDAO;
import mimemi.mvc.dao.EventDAOImpl;
import mimemi.mvc.dto.EventDTO;
import mimemi.mvc.dto.ReviewDTO;

public class EventServiceImpl implements EventService {
	private EventDAO eventDAO = new EventDAOImpl();
	
	/**
	 * 이벤트 게시글 등록
	 * @param: EventDTO(int eventId, String eventTitle, String eventContent, String eventAttach, String eventImg,
	 * 			String eventStartdate, String eventEnddate)
	 * */
	@Override
	public void insert(EventDTO event, String saveDir) throws SQLException {
		int result = eventDAO.insert(event);
		if(result==0) {
			//첨부파일이 있다면 save폴더에 저장한 첨부파일 삭제하기
			if(event.getEventAttach()!=null) {
				new java.io.File(saveDir+"/"+event.getEventAttach()).delete(); //경로확인하기
			}
			
			if(event.getEventImg()!=null) {
				new java.io.File(saveDir+"/"+event.getEventImg()).delete(); //경로확인하기
			}
			throw new SQLException("이벤트가 등록되지 않았습니다.");
		}

	}
	
	
	
	/**
	 * 이벤트 게시글 수정
	 * @param: EventDTO(int eventId, String eventTitle, String eventContent, String eventStartdate,
	 * 			String eventEnddate)
	 * 			게시글 제목과 내용, 시작일과 종료일만 변경
	 * @return: int(수정 성공한 레코드 수)
	 * */
	@Override
	public void updateEvent(EventDTO event, String saveDir ) throws SQLException {
		EventDTO dbEvent = eventDAO.selectByEventNo(event.getEventNo());
		if(dbEvent==null) {
			throw new SQLException("이벤트 번호에 해당하는 이벤트를 찾을 수 없습니다.");
		}
	//db저장한 기존 이벤트의 첨부파일명과 썸네일명을 미리 구한다.
	String dbAttach = dbEvent.getEventAttach();
	String dbImg = dbEvent.getEventImg();
	
	//dao로 게시물 수정한다.
	int result = eventDAO.updateEvent(event);
		
		if(result==0) {
			//첨부파일이 있다면 save폴더에 예전에 첨부한 첨부파일 삭제하기
			if(dbAttach!=null) {
				new java.io.File(saveDir+"/"+dbAttach).delete(); //경로확인하기
			}
			if(dbImg!=null) {
				new java.io.File(saveDir+"/"+dbImg).delete(); //경로확인하기
			}
			throw new SQLException("수정되지 않았습니다.");
		}else {
			//첨부파일이 있다면 save폴더에 예전에 첨부한 첨부파일 삭제하기
			if(dbAttach!=null) {
				new java.io.File(saveDir+"/"+dbAttach).delete(); //경로확인하기
			}
			System.out.println("삭제되야할 기존 파일이름:"+dbAttach);
			
			if(dbImg!=null) {
				new java.io.File(saveDir+"/"+dbImg).delete(); //경로확인하기
			}
		}

	}
	
	/**
	 * 이벤트 게시글 썸네일 이미지 수정
	 * @param: int eventId, String eventImg
	 * @return: int(수정 성공한 레코드 수)
	 * */
	@Override
	public void updateEventImg(int eventId, String eventImg) throws SQLException {
		// TODO Auto-generated method stub

	}
	
	/**
	 * 이벤트 게시글 상세 이미지 수정
	 * @param: int eventId, String eventAttach
	 * @return: int(수정 성공한 레코드 수)
	 * */
	@Override
	public void updateEventAttach(int eventId, String eventAttach) throws SQLException {
		// TODO Auto-generated method stub

	}
	
	/**
	 * 이벤트 게시글 전체 조회
	 * @return: List<EventDTO>
	 * */
	@Override
	public List<EventDTO> selectAll(String state ,int pageNo) throws SQLException {
		List<EventDTO> eventList = eventDAO.selectAll(state, pageNo);

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
		EventDTO event = eventDAO.selectByEventNo(eventNo);
		
		if(event==null) {
			throw new SQLException("상세보기를 불러올 수 없습니다.");
		}
		return event;
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

	@Override
	public List<EventDTO> selectAll() throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(EventDTO event) throws SQLException {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void updateEvent(EventDTO event) throws SQLException {
		// TODO Auto-generated method stub
		
	}



	@Override
	public void delete(EventDTO event, String path) throws SQLException{
		int result = eventDAO.delete(event.getEventNo());
		
		if(result==0) {
			throw new SQLException("삭제되지 않았습니다.");
		}
		if(event.getEventAttach()!=null) {
			new java.io.File(path + "/" + event.getEventAttach()).delete();
		}
		if(event.getEventImg()!=null) {
			new java.io.File(path + "/" + event.getEventImg()).delete();
		}
		
	}

}
