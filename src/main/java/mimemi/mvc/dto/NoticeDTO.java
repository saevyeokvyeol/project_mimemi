 package mimemi.mvc.dto;

public class NoticeDTO {
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String noticeAttach;
	private String noticeRegdate;
	
	
	public NoticeDTO() {}

	public NoticeDTO(int noticeNo, String noticeTitle, String noticeContent, String noticeAttach,
			String noticeRegdate) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeAttach = noticeAttach;
		this.noticeRegdate = noticeRegdate;
	}
	
	public NoticeDTO(String noticeTitle, String noticeContent, String noticeAttach) {
		super();
		
		this.noticeTitle = noticeTitle;
		this.noticeContent = noticeContent;
		this.noticeAttach = noticeAttach;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeAttach() {
		return noticeAttach;
	}

	public void setNoticeAttach(String noticeAttach) {
		this.noticeAttach = noticeAttach;
	}

	public String getNoticeRegdate() {
		return noticeRegdate;
	}

	public void setNoticeRegdate(String noticeRegdate) {
		this.noticeRegdate = noticeRegdate;
	}
	
}
