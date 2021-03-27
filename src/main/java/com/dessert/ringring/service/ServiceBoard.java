package com.dessert.ringring.service;

import com.dessert.ringring.domain.DTOBoard;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.List;

public interface ServiceBoard {
    public int insertBoard(HttpServletRequest req, MultipartFile file) throws IOException; //생성
    public int updateBoard(HttpServletRequest req);// 수정

    public DTOBoard getBoardDetail(long idx);

    public boolean deleteBoard(long idx);

    public List<DTOBoard> getBoardList(String id);
}
