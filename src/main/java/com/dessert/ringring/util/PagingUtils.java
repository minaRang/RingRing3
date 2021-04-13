package com.dessert.ringring.util;

import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PagingUtils {
    private List subList;
    private List list;
    int paging;
    private double count;

    public void setPaging(int paging, List list){
        this.list=list;
        this.paging=paging;
        this.count=list.size();
    }
    public Object getPaging(int button){ //표시할 게시글 수, 누른 버튼 인덱스, 나눌 리스트
        int pageStart=(button-1)*paging;
        int pageEnd=button*paging;
        try {
            subList=list.subList(pageStart,pageEnd);
        }catch (Exception e){
            subList=list.subList(pageStart,list.size());
        }
        return subList;
    }
    public double countPaging(){
        return count;
    }
    /*public Object getPaging(int paging, int button, List list){ //표시할 게시글 수, 누른 버튼 인덱스, 나눌 리스트
        int pageStart=(button-1)*paging;
        int pageEnd=button*paging;
        try {
            subList=list.subList(pageStart,pageEnd);
        }catch (Exception e){
            subList=list.subList(pageStart,list.size());
        }
        return subList;
    }*/
}
