package com.dessert.ringring.domain;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.springframework.stereotype.Component;

@Data
@Getter
@Setter
@Component
public class DTOReview {
	//자동 입력되는 부분
	private int idx;
	private Date date;
	private String doAnswer;
	//값 넘겨받는 부분
	private String id;
	private int productIdx;
	//사용자 입력 부분
	private String title;
	private String content;
	private String doSecret;
	private String img;
	//판매자 입력 부분
	private String reContent;
	private Date reDate;

}
