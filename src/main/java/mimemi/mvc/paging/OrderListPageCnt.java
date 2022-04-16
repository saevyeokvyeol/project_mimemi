package mimemi.mvc.paging;


public class OrderListPageCnt {
	private static int pageCnt; // 총 페이지 수
	public static  int pagesize = 10;// 한 페이지 당 출력할 게시글의 수
	public static int pageNo = 1; // 페이지 넘버
	public int blockcount = 5; // 한 번에 보여줄 게시글 목록 수
	
	public OrderListPageCnt() {
		super();
	}

	public OrderListPageCnt(int pageCnt) {
		super();
		this.pageCnt = pageCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public static int getPagesize() {
		return pagesize;
	}

	public static void setPagesize(int pagesize) {
		OrderListPageCnt.pagesize = pagesize;
	}

	public static int getPageNo() {
		return pageNo;
	}

	public static void setPageNo(int pageNo) {
		OrderListPageCnt.pageNo = pageNo;
	}

	public int getBlockcount() {
		return blockcount;
	}

	public void setBlockcount(int blockcount) {
		this.blockcount = blockcount;
	}

	
}
