package com.dessert.ringring.db;

import com.dessert.ringring.domain.*;
import com.dessert.ringring.mapper.BoardMapper;
import com.dessert.ringring.mapper.CartMapper;
import com.dessert.ringring.mapper.GoodsMapper;
import com.dessert.ringring.util.PagingUtils;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;

import com.dessert.ringring.mapper.MemberMapper;
import com.dessert.ringring.service.ServiceMember;
import java.util.List;

@SpringBootTest
public class DBConfig {

	@Autowired
	private PagingUtils pagingUtils;

	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private SqlSessionFactory sessionFactory;
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private ServiceMember serviceMember;
	
	@Autowired
	private DTOMember member;

	@Autowired
	private DTOGoods goods;

	@Autowired
	private GoodsMapper goodsMapper;

	@Autowired
	private CartMapper cartMapper;
	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private DTOBoard dtoBoard;


	@Test
	public void testGetUserInfo(){
		System.out.println("권한은"+serviceMember.getUserInfo("omming").getAuthority());
	}

	@Test
	public void testByApplicationContext() {
		try {
            System.out.println("=========================");
            System.out.println(context.getBean("sqlSessionFactory"));
            System.out.println("=========================");

        } catch (Exception e) {
            e.printStackTrace();
        }
		
	}
	
	  @Test
	    public void testBySqlSessionFactory() {
	        try {
	            System.out.println("=========================");
	            System.out.println(sessionFactory.toString());
	            System.out.println("=========================");

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
}
//	  @Test
//	  public void testUser() {
//		  member.setId("admin");
//		  member.setPassword("admin");
//		  member.setName("관리자");
//		  member.setAuthority("admin");
//		  
//		  int result=mapper.insertMember(member);
//		  
//		  System.out.println(result);
//		  
//	  }
	  
//	  @Test
//	  public void loginTest() {
//		  //로그인 테스트
//		 member.setId("admin");
//		 member.setPassword("admin");
//		 int result=mapper.login(member);
//		 
//		 System.out.println("결과는 "+result);
//	  }
//	  
//	  @Test
//	  public void getInfo() {
//		  member=mapper.getMemberInfo("admin");
//		 
//		  System.out.println(member.getId());
//	  }
	  @Test
	  public void email() {
		  int result =mapper.updateAct("satam_1@naver.com");
		  
		  System.out.println(result);
	  }

	  @Test
	public void listGoods(){
		List<DTOGoods> list=goodsMapper.listGoods(null,null);

		  System.out.println(list);
		  System.out.println(goodsMapper.selectBoardTotalCount());

	  }

	  @Test
	public void listCart(){
		List<DTOCart> list=cartMapper.listCart("admin");
		  System.out.println(list);
	  }

	  @Test
	public void testBoardList(){
		List<DTOBoard> boardList=boardMapper.selectBoardList("공지");
		  System.out.println(boardList);
	  }

	  @Test
	public void testCountBoard(){
		int c=boardMapper.countBoard("공지");
		  System.out.println("글 개수는"+c);
	  }

	  @Test
	public void pagingTest(){
		List<DTOBoard> boardList=boardMapper.selectBoardList("공지");
		pagingUtils.setPaging(4,boardList);
		List<DTOBoard> pagingBoard=(List<DTOBoard>)pagingUtils.getPaging(3);
		System.out.println(pagingBoard);
	}

}

