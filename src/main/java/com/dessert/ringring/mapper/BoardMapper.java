package com.dessert.ringring.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.dessert.ringring.domain.DTOBoard;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface BoardMapper {
	
	int insertBoard(DTOBoard board); //게시글 생성 쿼리 호출
	DTOBoard selectBoardDetail(long idx); //게시글 조회 쿼리 호출
	int updateBoard(DTOBoard board); //게시글 수정 쿼리 호출
	int deleteBoard(long idx); //게시글 삭제 쿼리 호출
	List<DTOBoard> selectBoardList(String id); //게시글 목록 조회 쿼리 호출
	int countBoard(String id);

}
