package com.dessert.ringring.service;

import com.dessert.ringring.config.UploadFileUtils;
import com.dessert.ringring.domain.DTOBoard;
import com.dessert.ringring.domain.DTOReview;
import com.dessert.ringring.mapper.ReviewMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class ServiceReviewImpl implements ServiceReview{

    @Autowired
    private ReviewMapper reviewMapper;
    @Autowired
    DTOReview review;

    //리뷰생성
    @Override
    public int insertReview(HttpServletRequest req, MultipartFile file) throws IOException{
        review.setId(req.getParameter("id"));
        review.setTitle(req.getParameter("title"));
        review.setContent(req.getParameter("content"));
        int productIdx = (int)req.getSession().getAttribute("productIdx");
        review.setProductIdx(productIdx);

        //이미지 업로드----------------------------------
        //업로드 경로 설정
        if(file.getOriginalFilename().equals(""))
            System.out.println("파일없음");
        else {
            String uploadPath = ResourceUtils.getFile("classpath:static/upload/").toPath().toString();
            uploadPath = uploadPath.replace("\\", "/");
            uploadPath = uploadPath.replace("/bin/main/static", "/src/main/resource/static");
            String ymdPath = UploadFileUtils.calcPath(uploadPath);
            String filesName = null;

            filesName = UploadFileUtils.fileUpload(uploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
            String img = (File.separator + "upload" + ymdPath + File.separator + filesName);
            img = img.replace("\\", "/");
            String imgS = (File.separator + "upload" + ymdPath + File.separator + "s" + File.separator + "s_" + filesName);
            imgS.replace("\\", "/");
            review.setImg(img);
            //-----------------------------------------

            System.out.println("fileName : " + filesName);
        }
        return reviewMapper.insertReview(review);
    }

    @Override
    public List<DTOReview> getReviewList(long productIdx){
        return reviewMapper.selectReviewList(productIdx);
    }

    @Override
    public List<DTOReview> getMyReviewList(String id){
        return reviewMapper.selectMyReviewList(id);
    }
    @Override
    public DTOReview getReviewDetail(long idx){
        return reviewMapper.selectReviewDetail(idx);
    }

    @Override
    public boolean deleteReview(long idx,long productIdx){
        int queryResult = 0;
        queryResult = reviewMapper.deleteReview(idx,productIdx);
        return (queryResult == 1) ? true : false;
    }
}
