package com.dessert.ringring.db;

import com.dessert.ringring.domain.DTOCart;
import com.dessert.ringring.domain.DTOGoods;
import com.dessert.ringring.domain.DTOReview;
import com.dessert.ringring.mapper.CartMapper;
import com.dessert.ringring.mapper.GoodsMapper;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;

import com.dessert.ringring.domain.DTOMember;
import com.dessert.ringring.mapper.MemberMapper;
import com.dessert.ringring.service.ServiceMember;
import org.springframework.test.context.web.WebAppConfiguration;

import java.util.List;
@WebAppConfiguration
@SpringBootTest
public class DBConfig {
//	@Autowired
//	private ApplicationContext context;
//
//	@Autowired
//	private SqlSessionFactory sessionFactory;
//
//	@Autowired
//	private MemberMapper mapper;
//
//	@Autowired
//	private ServiceMember serviceMember;
//
//	@Autowired
//	private DTOMember member;
//
//	@Autowired
//	private DTOGoods goods;
//
//	@Autowired
//	private GoodsMapper goodsMapper;
//
//	@Autowired
//	private CartMapper cartMapper;
//
//	@Test
//	public void testGetUserInfo(){
//		System.out.println("κΆνμ"+serviceMember.getUserInfo("omming").getAuthority());
//	}
//
//	@Test
//	public void testByApplicationContext() {
//		try {
//            System.out.println("=========================");
//            System.out.println(context.getBean("sqlSessionFactory"));
//            System.out.println("=========================");
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//	}
//
//	  @Test
//	    public void testBySqlSessionFactory() {
//	        try {
//	            System.out.println("=========================");
//	            System.out.println(sessionFactory.toString());
//	            System.out.println("=========================");
//
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//}
//	  @Test
//	  public void testUser() {
//		  member.setId("admin");
//		  member.setPassword("admin");
//		  member.setName("κ΄λ¦¬μ");
//		  member.setAuthority("admin");
//		  
//		  int result=mapper.insertMember(member);
//		  
//		  System.out.println(result);
//		  
//	  }
	  
//	  @Test
//	  public void loginTest() {
//		  //λ‘κ·ΈμΈ νμ€νΈ
//		 member.setId("admin");
//		 member.setPassword("admin");
//		 int result=mapper.login(member);
//		 
//		 System.out.println("κ²°κ³Όλ "+result);
//	  }
//	  
//	  @Test
//	  public void getInfo() {
//		  member=mapper.getMemberInfo("admin");
//		 
//		  System.out.println(member.getId());
//	  }
//	  @Test
//	  public void email() {
//		  int result =mapper.updateAct("satam_1@naver.com");
//
//		  System.out.println(result);
//	  }
//
//	  @Test
//	public void listGoods(){
//		List<DTOGoods> list=goodsMapper.listGoods();
//
//		  System.out.println(list);
//		  System.out.println(goodsMapper.selectBoardTotalCount());
//
//	  }
//
//	  @Test
//	public void listCart(){
//		List<DTOCart> list=cartMapper.listCart("admin");
//		  System.out.println(list);
//	  }

}

