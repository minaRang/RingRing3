package com.dessert.ringring.service;

import com.dessert.ringring.config.UploadFileUtils;
import com.dessert.ringring.domain.DTOPerAsk;
import com.dessert.ringring.mapper.PerAskMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

@Transactional
@Service
public class ServicePerAskImpl implements ServicePerAsk{
    @Autowired
    DTOPerAsk perAsk;
    @Autowired
    PerAskMapper perAskMapper;


    @Override
    public void writePerAsk(HttpServletRequest req, MultipartFile file,String id) throws IOException {
        perAsk.setTitle(req.getParameter("title"));
        perAsk.setContent(req.getParameter("content"));
        if(file.isEmpty()) {
            perAsk.setImg(null);
        }else{
            //img등록
            String uploadPath = ResourceUtils.getFile("classpath:static/perAsk/").toPath().toString();
            uploadPath = uploadPath.replace("\\","/");
            uploadPath=uploadPath.replace("/bin/main/static","/src/main/resource/static");
            String ymdPath = UploadFileUtils.calcPath(uploadPath);
            String filesName=null;
            filesName = UploadFileUtils.fileUpload(uploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
            String img = (File.separator + "upload" + ymdPath + File.separator + filesName);
            img = img.replace("\\", "/");
            perAsk.setImg("img");
        }
        perAsk.setId(id);
        perAsk.setAskType(req.getParameter("askType"));
        perAskMapper.insertPerAsk(perAsk);
    }

    @Override
    public DTOPerAsk getInfoOnePerAsk(HttpServletRequest req) {
        int idx=Integer.parseInt((req.getParameter("idx")));
        return perAskMapper.getInfoOnePerAsk(idx);
    }

    @Override
    public List<DTOPerAsk> getListUserPerAsk(String id) {
        perAsk.setId(id);
        return perAskMapper.getListUserPerAsk(perAsk);
    }

    @Override
    public List<DTOPerAsk> listAllPerAsk() {
        return perAskMapper.listAllPerAsk();
    }

    @Override
    public List<DTOPerAsk> noReplyPerAsk() {
        return perAskMapper.noReplyPerAsk();
    }

    @Override
    public int answerPerAsk(HttpServletRequest req) {
        perAsk.setReContent(req.getParameter("reContent"));
        int idx=Integer.parseInt(req.getParameter("idx"));
        perAsk.setIdx(idx);
        return perAskMapper.replyPerAsk(perAsk);
    }

    @Override
    public int deletePerAsk(int idx) {
        return perAskMapper.deletePerAsk(idx);
    }
}
