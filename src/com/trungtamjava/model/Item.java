package com.trungtamjava.model;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.NumberFormat;

public class Item implements Serializable{
	private int id;
	private Book book;
	private int quantity;
	private long price;
	
	public Item() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}
	
	public String currencyFormat(long p){
		NumberFormat formatter = new DecimalFormat("###,###,###.##");
	    return formatter.format(p);
	}
	
}
