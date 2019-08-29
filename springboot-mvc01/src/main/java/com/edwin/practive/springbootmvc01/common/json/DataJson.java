package com.edwin.practive.springbootmvc01.common.json;

import java.util.List;


public class DataJson {
	
	private int total;
	private List rows;
	/**
	 * @return the total
	 */
	public int getTotal() {
		return total;
	}
	/**
	 * @param total the total to set
	 */
	public void setTotal(int total) {
		this.total = total;
	}
	/**
	 * @return the list
	 */
	public List getRows() {
		return rows;
	}
	/**
	 * @param list the list to set
	 */
	public void setRows(List rows) {
		this.rows = rows;
	}
	

}
