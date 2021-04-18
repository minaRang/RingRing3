package com.dessert.ringring.mapper;

import com.dessert.ringring.domain.DTOCart;
import com.dessert.ringring.domain.DTOMember;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
@Repository
@Mapper
public interface CartMapper {
    int insertCart(DTOCart cart);
    List<DTOCart> listCart(String userId);

    //insert시 중복확인하는 메서드
    int checkCart(@Param("id")String id, @Param("productIdx")int productIdx);
    int updateCart(int idx);
    int deleteCart(DTOCart cart);
    int sumMoney(String userId);
    int deleteAll(String userId);
    int countCart(String userId);

    


}
