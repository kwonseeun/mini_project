package com.web.board.domain;

public class Search {

	private String keyWord;
	private String keyType;
	private String boardNo;
	
	private int totalPage; // 전체 페이지 
	private int currentPage; // 현재 페이지
	private int pageSize; // 총 게시글 수
	
	public String getKeyWord() {
		return keyWord;
	}
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	public String getKeyType() {
		return keyType;
	}
	public void setKeyType(String keyType) {
		this.keyType = keyType;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	@Override
	public String toString() {
		return "Search [keyWord=" + keyWord + ", keyType=" + keyType + ", boardNo=" + boardNo + ", totalPage="
				+ totalPage + ", currentPage=" + currentPage + ", pageSize=" + pageSize + "]";
	}
	
	

}
