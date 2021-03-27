package com.dessert.ringring.service;

import com.dessert.ringring.domain.DTOCart;
import com.dessert.ringring.domain.DTOMember;
import com.dessert.ringring.mapper.CartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
@Transactional
public class ServiceCartImpl implements ServiceCart {

    @Autowired
    DTOCart cart;

    @Autowired
    CartMapper cartMapper;

    @Override
    public int insertCart(HttpServletRequest req, DTOMember member) {

        cart.setId(member.getId());
        int amount = Integer.parseInt(req.getParameter("amount"));
        cart.setAmount(amount);
        int productIdx = Integer.parseInt(req.getParameter("productIdx"));
        cart.setProductIdx(productIdx);
        int price = Integer.parseInt(req.getParameter("price"));
        cart.setPrice(price);
        return cartMapper.insertCart(cart);
    }

    @Override
    public List<DTOCart> listCart(String id) {
        return cartMapper.listCart(id);
    }

    @Override
    public int updateCart(HttpServletRequest req) {
        return 0;
    }

    @Override
    public void deleteCart(DTOCart cart) {
        cartMapper.deleteCart(cart);
    }

    @Override
    public int sumMoney(String id) {
        return cartMapper.sumMoney(id);
    }

    @Override
    public void deleteAll(String id) {
        cartMapper.deleteAll(id);
    }

    @Override
    public int countCart(HttpServletRequest req) {
        return 0;
    }

    @Override
    public int checkCart(String id,int productIdx){
        return cartMapper.checkCart(id,productIdx);
    }
}
