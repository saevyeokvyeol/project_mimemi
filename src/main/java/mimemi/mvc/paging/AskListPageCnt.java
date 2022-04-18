package mimemi.mvc.paging;

public class AskListPageCnt {
	private static int pageCnt;
	public static  int pagesize = 10;
	public static int pageNo = 1; 
	public int blockcount = 5;
	
	public AskListPageCnt() {}
	
	public AskListPageCnt(int pageCnt) {
		super();
		this.pageCnt=pageCnt;
	}
	
	public static int getPageCnt() {
		return pageCnt;
	}

	public static void setPageCnt(int pageCnt) {
		AskListPageCnt.pageCnt = pageCnt;
	}

	public static int getPagesize() {
		return pagesize;
	}

	public static void setPagesize(int pagesize) {
		AskListPageCnt.pagesize = pagesize;
	}

	public static int getPageNo() {
		return pageNo;
	}

	public static void setPageNo(int pageNo) {
		AskListPageCnt.pageNo = pageNo;
	}

	public int getBlockcount() {
		return blockcount;
	}

	public void setBlockcount(int blockcount) {
		this.blockcount = blockcount;
	}
	
}
