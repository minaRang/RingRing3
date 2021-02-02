package com.dessert.ringring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dessert.ringring.domain.DTOGoods;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface GoodsMapper {
	
	int insertGoods(DTOGoods goods);
	
	DTOGoods getInfoGoods(int idx);
	
	List<DTOGoods> listGoods(String category1,String category2);
	
	int deleteGoods(int idx);
	
	int updateGoods(DTOGoods goods);
	
	int selectBoardTotalCount();
}
