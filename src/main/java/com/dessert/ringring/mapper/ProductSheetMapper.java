package com.dessert.ringring.mapper;

import com.dessert.ringring.domain.DTOProductSheet;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
@Mapper
public interface ProductSheetMapper {
    void insertProductSheet(DTOProductSheet productSheet);
//    void insertProductSheetId(DTOProductSheet dtoProductSheet);
    List<DTOProductSheet> getProductSheet(DTOProductSheet productSheet);
    int sumMoney(DTOProductSheet productSheet);
    int countProduct(DTOProductSheet productSheet);
    DTOProductSheet listThumnail(@Param("id") String id, @Param("orderNum") String orderNum);
    List<DTOProductSheet> listProductsheetDetail(String orderNum);
}
