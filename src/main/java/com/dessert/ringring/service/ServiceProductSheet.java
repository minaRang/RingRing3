package com.dessert.ringring.service;

import com.dessert.ringring.domain.DTOProductSheet;

import java.util.List;

public interface ServiceProductSheet {
    void insertProductSheet(String id,String orderNum);
    List<DTOProductSheet> listProductsheetDetail(String orderNum);
}
