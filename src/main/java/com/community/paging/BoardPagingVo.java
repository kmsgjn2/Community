package com.community.paging;

public class BoardPagingVo {

	// 페이지당 게시물 수
	private int pageListCnt;
	// 페이지당 버튼 수
	private int paginationCnt;
	// 현재 페이지 번호
	private int currentPage;
	// 이전 버튼의 페이지 번호
	private int prevPage;
	// 다음 버튼의 페이지 번호
	private int nextPage;
	// 전체 페이지 수
	private int totalPage;
	// 현재 페이지버튼 시작 번호
	private int paginationStart;
	// 현재 페이지버튼 끝 번호
	private int paginationEnd;
	// 게시판 번호
	private int board_idx;
	// DB Start
	private int pageStart;
	// DB End
	private int pageEnd;
	// 검색 타입
	private String searchType;
	// 검색어
	private String searchWord;
	
	public BoardPagingVo(int currentPage, int boardCount, int board_idx, int pageListCnt, String searchType, String searchWord) {
		this.pageListCnt = pageListCnt;
		this.paginationCnt = 5;
		this.currentPage = currentPage;
		this.board_idx = board_idx;
		this.searchType = searchType;
		this.searchWord = searchWord;
		
		totalPage = boardCount / pageListCnt;
		
		if (boardCount % pageListCnt > 0) {
			// 101 / 10 = 10 이기 떄문에 1증가 시킴 (몫)
			// 101 % 10 = 1 (나머지)
			totalPage++;
		}
		
		paginationStart = ((currentPage - 1) / paginationCnt * paginationCnt + 1);
		paginationEnd = paginationStart + paginationCnt - 1;
		
		if (paginationEnd > totalPage) {
			paginationEnd = totalPage;
		}
		
		prevPage = paginationStart - 1;
		nextPage = paginationEnd + 1;
		
		if (nextPage > totalPage) {
			nextPage = totalPage;
		}
		
		pageStart = ((currentPage - 1) * pageListCnt + 1);
		pageEnd = (pageStart + pageListCnt - 1);
	}

	public BoardPagingVo(int board_idx, String searchType, String searchWord) {
		this.board_idx = board_idx;
		this.searchType = searchType;
		this.searchWord = searchWord;
	}

	public int getPageListCnt() {
		return pageListCnt;
	}

	public int getPaginationCnt() {
		return paginationCnt;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public int getPaginationStart() {
		return paginationStart;
	}

	public int getPaginationEnd() {
		return paginationEnd;
	}

	public int getBoard_idx() {
		return board_idx;
	}

	public int getPageStart() {
		return pageStart;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public String getSearchType() {
		return searchType;
	}

	public String getSearchWord() {
		return searchWord;
	}

}
