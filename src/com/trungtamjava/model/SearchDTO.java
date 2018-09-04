package com.trungtamjava.model;

public class SearchDTO {
	private String keyWord;
	private Integer page;
	private Integer pageSize;
	private Integer totalPage;
	private Integer total;
	
	public SearchDTO() {
		page = 1;
		pageSize = 2;
	}

	public SearchDTO(String keyWord, Integer page, Integer pageSize) {
		super();
		this.keyWord = keyWord;
		this.page = page;
		this.pageSize = pageSize;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public Integer getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}
}
