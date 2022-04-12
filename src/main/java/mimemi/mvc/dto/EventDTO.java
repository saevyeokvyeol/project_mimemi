package mimemi.mvc.dto;

public class EventDTO {
	private int eventId;
	private String eventTitle;
	private String eventContent;
	private String eventAttach;
	private String eventRegdate;
	private String eventModidate;
	private String eventStartdate;
	private String eventEnddate;
	
	public EventDTO() {}
	public EventDTO(int eventId, String eventTitle, String eventContent, String eventAttach, String eventRegdate,
			String eventModidate, String eventStartdate, String eventEnddate) {
		super();
		this.eventId = eventId;
		this.eventTitle = eventTitle;
		this.eventContent = eventContent;
		this.eventAttach = eventAttach;
		this.eventRegdate = eventRegdate;
		this.eventModidate = eventModidate;
		this.eventStartdate = eventStartdate;
		this.eventEnddate = eventEnddate;
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
	public String getEventModidate() {
		return eventModidate;
	}
	public void setEventModidate(String eventModidate) {
		this.eventModidate = eventModidate;
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
