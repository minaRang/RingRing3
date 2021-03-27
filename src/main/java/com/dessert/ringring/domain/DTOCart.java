package com.dessert.ringring.domain;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class DTOCart {
	private int cartIdx;
	private int productIdx;
	private int price;
	private int amount;
	private String id;
	private DTOGoods dtoGoods;

}
