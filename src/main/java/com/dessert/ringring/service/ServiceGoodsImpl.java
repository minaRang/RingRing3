package com.dessert.ringring.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dessert.ringring.domain.DTOGoods;
import com.dessert.ringring.mapper.GoodsMapper;

@Service
public class ServiceGoodsImpl implements ServiceGoods {
	@Autowired
	GoodsMapper mapper;
	@Autowired
	DTOGoods goods;

	@Override
	public int insertGoods(HttpServletRequest req) {
		
		goods.setName(req.getParameter("name"));
		int price = Integer.parseInt(req.getParameter("price"));	
		goods.setPrice(price);
		goods.setCategory1(req.getParameter("category1"));
		goods.setCategory2(req.getParameter("category2"));
		goods.setDetail(req.getParameter("detail"));
		goods.setImg(req.getParameter("IMG"));
		goods.setShortDetail(req.getParameter("shortDetail"));
		int stock=Integer.parseInt(req.getParameter("stock"));
		goods.setStock(stock);
		goods.setWeight(req.getParameter("weight"));
		return mapper.insertGoods(goods);
	}

	@Override
	public DTOGoods getInfoGoods(int idx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<DTOGoods> listGoods(String category1, String category2) {
		return null;
	}

	@Override
	public int deleteGoods(int idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateGoods(DTOGoods goods) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectBoardTotalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

}
