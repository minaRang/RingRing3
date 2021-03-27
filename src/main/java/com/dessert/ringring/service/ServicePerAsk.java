package com.dessert.ringring.service;

import com.dessert.ringring.domain.DTOPerAsk;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public interface ServicePerAsk {
    void writePerAsk(HttpServletRequest req, MultipartFile files,String id) throws IOException;
    DTOPerAsk getInfoOnePerAsk(HttpServletRequest req);
    List<DTOPerAsk> getListUserPerAsk(String id);
    List<DTOPerAsk> listAllPerAsk();
    List<DTOPerAsk> noReplyPerAsk();
    int answerPerAsk(HttpServletRequest req);
    int deletePerAsk(int idx);

}
