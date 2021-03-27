package com.dessert.ringring.service;

import com.dessert.ringring.domain.DTOProductSheet;
import com.dessert.ringring.mapper.ProductSheetMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class ServiceProductSheetImpl implements ServiceProductSheet {
    @Autowired
    DTOProductSheet productSheet;
    @Autowired
    ProductSheetMapper productSheetMapper;
    @Override
    public void insertProductSheet(String id,String orderNum) {
//        productSheet.setId(id);
//        productSheet.setOrderNum(orderNum);
//        productSheetMapper.insertProductSheet(productSheet);
    }

    @Override
    public List<DTOProductSheet> listProductsheetDetail(String orderNum) {
        return productSheetMapper.listProductsheetDetail(orderNum);
    }


}
