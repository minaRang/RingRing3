package com.dessert.ringring.service;

import com.dessert.ringring.domain.DTOBoard;
import com.dessert.ringring.domain.DTOReview;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

public interface ServiceReview {

    public int insertReview(HttpServletRequest req, MultipartFile file) throws IOException;
    public List<DTOReview> getReviewList(long productIdx);//상품인덱스 넘기면 그 상품의 리뷰 출력
    public List<DTOReview> getMyReviewList(String id);
    public DTOReview getReviewDetail(long idx);
    public boolean deleteReview(long idx, long productIdx);
}
