package com.trungtamjava.model;

import java.io.Serializable;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;

public class Order implements Serializable{
	private int id;
	private User customer;
	private List<Item> items;
	private int status;
	
	public Order() {
		this.status = 0;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public User getCustomer() {
		return customer;
	}
	public void setCustomer(User customer) {
		this.customer = customer;
	}
	public List<Item> getItems() {
		return items;
	}
	public void setItems(List<Item> items) {
		this.items = items;
	}
	public String getTotal(){
		NumberFormat formatter = new DecimalFormat("###,###,###.##");
		long total = 0;
		for(Item item : items) {
			total += item.getPrice()*item.getQuantity();
		}
	    return formatter.format(total);
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
}
