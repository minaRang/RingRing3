package com.dessert.ringring.service;

import com.dessert.ringring.domain.DTOOrderSheet;
import com.dessert.ringring.domain.DTOProductSheet;
import com.dessert.ringring.mapper.OrderSheetMapper;
import com.dessert.ringring.mapper.ProductSheetMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

@Service
@Transactional
public class ServiceOrderSheetImpl implements ServiceOrderSheet{

    @Autowired
    OrderSheetMapper orderSheetMapper;
    @Autowired
    DTOOrderSheet orderSheet;
    @Autowired
    ProductSheetMapper productSheetMapper;
    @Autowired
    DTOProductSheet productSheet;

    @Override
    public void insertOrder(HttpServletRequest req) {

        //orderSheet에 넣기
        orderSheet.setOrderId(req.getParameter("orderId"));
        int finalPrice=Integer.parseInt(req.getParameter("finalPrice"));
        orderSheet.setFinalPrice(finalPrice);
        orderSheet.setMemo(req.getParameter("memo"));
        orderSheet.setPayWith(req.getParameter("payWith"));
        orderSheet.setToAddress1(req.getParameter("toAddress1"));
        orderSheet.setToAddress2(req.getParameter("toAddress2"));
        orderSheet.setToAddress3(req.getParameter("toAddress3"));
        orderSheet.setToName(req.getParameter("toName"));
        Calendar cal=Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        String ym=year+new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
        String ymd=ym+new DecimalFormat("00").format(cal.get(Calendar.DATE));
        String num="";
        for(int i=0;i<6;i++){
            num+=(int)(Math.random()*10);
        }
        System.out.println(ymd);
        System.out.println(num);
        String orderNum=ymd+num;
        orderSheet.setOrderNum(orderNum);


        //productSheet에 넣기
        String id=req.getParameter("orderId");
        productSheet.setId(id);
        productSheet.setOrderNum(orderNum);
        productSheetMapper.insertProductSheet(productSheet);

        //product개수,대표 썸네일 달기
        int countProduct=productSheetMapper.countProduct(productSheet);
        productSheet=productSheetMapper.listThumnail(id,orderNum);
        String img=productSheet.getDtoGoods().getImg();
        String name=productSheet.getDtoGoods().getName();
        orderSheet.setThumnail(img);
        orderSheet.setThumnailName(name);
        orderSheet.setCountProduct(countProduct);
        orderSheetMapper.insertOrder(orderSheet);

    }

    @Override
    public DTOOrderSheet getInfoOrder(DTOOrderSheet orderSheet) {
        return null;
    }

    @Override
    public List<DTOOrderSheet> orderList(String id) {

        return orderSheetMapper.orderList(id);
    }

    @Override
    public void modifyDeliveryState(HttpServletRequest req) {
        orderSheet.setDeliveryState(req.getParameter("delivery"));
        orderSheet.setOrderNum(req.getParameter("orderNum"));
        orderSheet.setOrderId(req.getParameter("orderId"));
        orderSheetMapper.modifyDelivery(orderSheet);
    }

    @Override
    public DTOOrderSheet getInfoOrderIdx(int idx) {
        return orderSheetMapper.getOrderInfoIdx(idx);
    }
}
