package mimemi.mvc.dto;

import java.util.List;

public class AskDTO {
	private int askNo;//글번호
	private String userId;//회원아이디
	private String askTitle;//제목
	private String askContent;//내용
	private String askAttach;//첨부파일명
	private String askRegdate;//작성날짜
	private String askCategory;//카테고리명
	private String askComplete;//답변완료
	
	private int pageCnt;
	
	List<AskDTO> askDtoList;
	
	public AskDTO() {}
	
	public AskDTO(int askNo, String askComplete) {
		this.askNo=askNo;
		this.askComplete=askComplete;
	}
	
	public AskDTO(int askNo, String askTitle, String askContent) {
		this.askNo=askNo;
		this.askTitle=askTitle;
		this.askContent=askContent;
	}
	
	
	public AskDTO(int askNo, String userId, String askTitle,String askContent,String askAttach) {
		this.askNo=askNo;
		this.userId=userId;
		this.askTitle=askTitle;
		this.askContent=askContent;
		this.askAttach=askAttach;
	}
	public AskDTO(String userId, String askTitle,String askContent, String askCategory) {
		this.userId=userId;
		this.askTitle=askTitle;
		this.askContent=askContent;
		this.askCategory=askCategory;
	}
	
	public AskDTO(int askNo, String userId, String askTitle, String askContent, String askAttach, String askRegdate,
			String askCategory, String askComplete) {
		super();
		this.askNo = askNo;
		this.userId = userId;
		this.askTitle = askTitle;
		this.askContent = askContent;
		this.askAttach = askAttach;
		this.askRegdate = askRegdate;
		this.askCategory = askCategory;
		this.askComplete = askComplete;
	}

	public int getAskNo() {
		return askNo;
	}

	public void setAskNo(int askNo) {
		this.askNo = askNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getAskTitle() {
		return askTitle;
	}

	public void setAskTitle(String askTitle) {
		this.askTitle = askTitle;
	}

	public String getAskContent() {
		return askContent;
	}

	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}

	public String getAskAttach() {
		return askAttach;
	}

	public void setAskAttach(String askAttach) {
		this.askAttach = askAttach;
	}

	public String getAskRegdate() {
		return askRegdate;
	}

	public void setAskRegdate(String askRegdate) {
		this.askRegdate = askRegdate;
	}

	public String getAskCategory() {
		return askCategory;
	}

	public void setAskCategory(String askCategory) {
		this.askCategory = askCategory;
	}

	public String getAskComplete() {
		return askComplete;
	}

	public void setAskComplete(String askComplete) {
		this.askComplete = askComplete;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public List<AskDTO> getAskDtoList() {
		return askDtoList;
	}

	public void setAskDtoList(List<AskDTO> askDtoList) {
		this.askDtoList = askDtoList;
	}
	
}
