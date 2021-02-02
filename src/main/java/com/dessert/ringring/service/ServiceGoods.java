package com.dessert.ringring.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.dessert.ringring.domain.DTOGoods;

public interface ServiceGoods {
	public int insertGoods(HttpServletRequest req);
	
	public DTOGoods getInfoGoods(int idx);
	
	public List<DTOGoods> listGoods(String category1,String category2);
	
	public int deleteGoods(int idx);
	
	public int updateGoods(DTOGoods goods);
	
	public int selectBoardTotalCount();
}
