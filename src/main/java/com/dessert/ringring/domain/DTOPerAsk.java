package com.dessert.ringring.domain;


import java.util.Date;

import lombok.Data;
import org.springframework.stereotype.Component;

@Component
@Data
public class DTOPerAsk {
	private int idx;
	private String id;
	private String title;
	private Date date;
	private String content;
	private String img;
	private String doAnswer;
	private String reContent;
	private String reDate;
	private String askType;
	

}
