package com.dessert.ringring.mapper;

import com.dessert.ringring.domain.DTOOrderSheet;
import com.dessert.ringring.domain.DTOProductSheet;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@Mapper
public interface OrderSheetMapper {
    int insertOrder(DTOOrderSheet order);
    DTOOrderSheet getOrderInfo(DTOOrderSheet order);
    List<DTOOrderSheet> orderList(String id);
    int modifyDelivery(DTOOrderSheet orderSheet);
    DTOOrderSheet getOrderInfoIdx(int idx);
    //모든 주문서 read
    List<DTOOrderSheet> allOrderSheet();
}
