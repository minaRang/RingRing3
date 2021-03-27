package com.dessert.ringring.domain;

import lombok.Data;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
@Data
public class DTOOrderSheet {
	private int idx;
	private String toName;
	private String toAddress1;
	private String toAddress2;
	private String toAddress3;
	private String orderId;
	private String memo;
	private String orderNum;
	private int wayBill;
	private String payWith;
	private int finalPrice;
	private String thumnail;
	private String thumnailName;
	private String deliveryState;
	private int countProduct;
	private Date date;
	DTOProductSheet productSheet;

}
