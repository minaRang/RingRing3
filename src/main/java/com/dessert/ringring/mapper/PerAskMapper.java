package com.dessert.ringring.mapper;

import com.dessert.ringring.domain.DTOPerAsk;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface PerAskMapper {
    int insertPerAsk(DTOPerAsk perAsk);
    DTOPerAsk getInfoOnePerAsk(int idx);
    List<DTOPerAsk> getListUserPerAsk(DTOPerAsk perAsk);
    List<DTOPerAsk> listAllPerAsk();
    List<DTOPerAsk> noReplyPerAsk();
    int replyPerAsk(DTOPerAsk dtoPerAsk);
    int deletePerAsk(int idx);


}
