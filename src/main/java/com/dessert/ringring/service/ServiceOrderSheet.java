package com.dessert.ringring.service;

import com.dessert.ringring.domain.DTOOrderSheet;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ServiceOrderSheet{
    void insertOrder(HttpServletRequest req);
    DTOOrderSheet getInfoOrder(DTOOrderSheet orderSheet);
    List<DTOOrderSheet> orderList(String id);
    void modifyDeliveryState(HttpServletRequest req);
    DTOOrderSheet getInfoOrderIdx(int idx);
}
