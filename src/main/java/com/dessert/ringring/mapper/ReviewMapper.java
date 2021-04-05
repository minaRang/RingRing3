package com.dessert.ringring.mapper;

import com.dessert.ringring.domain.DTOReview;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


import java.util.List;

@Repository
@Mapper
public interface ReviewMapper {
    int insertReview(DTOReview review); //리뷰생성
    List<DTOReview> selectReviewList(long productIdx); //리뷰리스트조회
    List<DTOReview> selectMyReviewList(String id); //리뷰리스트아이디로조회
    DTOReview selectReviewDetail(long inx); //리뷰상세조회
    int updateReview(DTOReview review);//리뷰수정
    int deleteReview(long idx, long productIdx);//리뷰삭제

}