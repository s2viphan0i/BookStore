package com.trungtamjava.model;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Book implements Serializable {
	private int id;
	private String name;
	private String author;
	private String image;
	private Date releaseDate;
	private long price;
	private Category category;
	private String note;
	
	public Book() {
	}
	
	public Book(int id, String name, String author, String image, Date releaseDate, long price, Category category,
			String note) {
		this.id = id;
		this.name = name;
		this.author = author;
		this.image = image;
		this.releaseDate = releaseDate;
		this.price = price;
		this.category = category;
		this.note = note;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	public String dateToString() {
		SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
		if(this.releaseDate==null) {
			return "";
		}
		return formatter.format(this.releaseDate);
	}
	
	public String currencyFormat(long p){
		NumberFormat formatter = new DecimalFormat("###,###,###.##");
	    return formatter.format(p);
	}
}
