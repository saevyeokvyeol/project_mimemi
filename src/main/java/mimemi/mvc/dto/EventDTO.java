package mimemi.mvc.dto;

public class EventDTO {
	private int eventId;
	private String eventTitle;
	private String eventContent;
	private String eventAttach;
	private String eventImg;
	private String eventRegdate;
	private String eventStartdate;
	private String eventEnddate;
	
	public EventDTO() {}
	public EventDTO(int eventId, String eventTitle, String eventContent, String eventAttach,  String eventImg, String eventRegdate,
			String eventStartdate, String eventEnddate) {
		super();
		this.eventId = eventId;
		this.eventTitle = eventTitle;
		this.eventContent = eventContent;
		this.eventAttach = eventAttach;
		this.eventImg = eventImg;
		this.eventRegdate = eventRegdate;
		this.eventStartdate = eventStartdate;
		this.eventEnddate = eventEnddate;
	}
	public String getEventImg() {
		return eventImg;
	}
	public void setEventImg(String eventImg) {
		this.eventImg = eventImg;
	}
	public int getEventId() {
		return eventId;
	}
	public void setEventId(int eventId) {
		this.eventId = eventId;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public String getEventContent() {
		return eventContent;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public String getEventAttach() {
		return eventAttach;
	}
	public void setEventAttach(String eventAttach) {
		this.eventAttach = eventAttach;
	}
	public String getEventRegdate() {
		return eventRegdate;
	}
	public void setEventRegdate(String eventRegdate) {
		this.eventRegdate = eventRegdate;
	}
	public String getEventStartdate() {
		return eventStartdate;
	}
	public void setEventStartdate(String eventStartdate) {
		this.eventStartdate = eventStartdate;
	}
	public String getEventEnddate() {
		return eventEnddate;
	}
	public void setEventEnddate(String eventEnddate) {
		this.eventEnddate = eventEnddate;
	}
	
	
}
