package com.dessert.ringring.service;

import com.dessert.ringring.config.UploadFileUtils;
import com.dessert.ringring.domain.DTOBoard;
import com.dessert.ringring.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Collections;

@Service
public class ServiceBoardImpl implements ServiceBoard{
    @Autowired
    private BoardMapper boardMapper;

    @Autowired
    DTOBoard board;

    //생성과 수정. 인덱스가 있으면 수정, 없으면 생성
    @Override
    public int insertBoard(HttpServletRequest req, MultipartFile file) throws IOException{
        board.setTitle(req.getParameter("title"));
        board.setContent(req.getParameter("content"));
        board.setBoardType(req.getParameter("boardType"));
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
            board.setImg(img);
            //-----------------------------------------

            System.out.println("fileName : " + filesName);
        }
        return boardMapper.insertBoard(board);
    } //생성

    @Override
    public int updateBoard(HttpServletRequest req){
        board.setTitle(req.getParameter("title"));
        board.setContent(req.getParameter("content"));
        board.setBoardType(req.getParameter("boardType"));

        return boardMapper.updateBoard(board);
    }// 수정
    //하나의 게시글을 조회함
    @Override
    public DTOBoard getBoardDetail(long idx) {
        return boardMapper.selectBoardDetail(idx);
    }

    //특정 게시글 삭제
    @Override
    public boolean deleteBoard(long idx) {
        int queryResult = 0;
        queryResult = boardMapper.deleteBoard(idx);
        return (queryResult == 1) ? true : false;
    }

    //삭제되지 않은 전체 게시글 조회
    @Override
    public List<DTOBoard> getBoardList(String id) {
        List<DTOBoard> boardList = Collections.emptyList();
        boardList = boardMapper.selectBoardList(id);
        return boardList;
    }

    //게시글 수 조회
    @Override
    public int countBoardList(String id){
        return boardMapper.countBoard(id);
    }
}