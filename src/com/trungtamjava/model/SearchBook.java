package com.trungtamjava.model;

public class SearchBook extends SearchDTO {
	private int sort;
	private long fromPrice = 0;
	private long toPrice = 99999999;
	
	public SearchBook() {
		super();
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
	public long getFromPrice() {
		return fromPrice;
	}
	public void setFromPrice(long fromPrice) {
		this.fromPrice = fromPrice;
	}
	public long getToPrice() {
		return toPrice;
	}
	public void setToPrice(long toPrice) {
		this.toPrice = toPrice;
	}
	
}
