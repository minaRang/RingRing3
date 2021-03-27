package com.dessert.ringring.service;

import com.dessert.ringring.domain.DTOCart;
import com.dessert.ringring.domain.DTOMember;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface ServiceCart {
    int insertCart(HttpServletRequest req, DTOMember member);
    List<DTOCart> listCart(String id);
    int updateCart(HttpServletRequest req);
    void deleteCart(DTOCart cart);
    int sumMoney(String id);
    void deleteAll(String id);
    int countCart(HttpServletRequest req);
    int checkCart(String id,int productIdx);

}
