package com.dessert.ringring.controller2;

import com.dessert.ringring.domain.DTOBoard;
import com.dessert.ringring.domain.DTOMember;
import com.dessert.ringring.domain.DTOReview;
import com.dessert.ringring.service.ServiceBoard;
import com.dessert.ringring.service.ServiceMember;
import com.dessert.ringring.util.PagingUtils;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.SessionScope;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class BoardController2 {
    @Autowired
    private ServiceBoard serviceBoard;
    @Autowired
    private ServiceMember serviceMember;
    @Autowired
    private PagingUtils pagingUtils;
    @Autowired
    private DTOBoard board;
    @Autowired
    private DTOMember member;

    /*리스트 출력*/
    @GetMapping("/noticeList")
    public String BoardNotice(@RequestParam(value = "id",required = false) String id,HttpServletRequest req, RedirectAttributes redirect) {
        //HttpServletRequest = 클라이언트의 요청 정보를 확인하기 위함.
        System.out.println("게시판 항목은"+id);
        pagingUtils.setPaging(10,serviceBoard.getBoardList(id));

        HttpSession session = req.getSession(); //세션 생성
        session.setAttribute("list",(List<DTOBoard>)pagingUtils.getPaging(1));//게시글리스트 받아옴
        session.setAttribute("now",1);
        session.setAttribute("boardId",id);
        session.setAttribute("pageNum",(int)Math.ceil(pagingUtils.countPaging()/10.0));
        redirect.addAttribute("contentPage","board/notice.jsp");
        return "redirect:mainForm";
    }
    @GetMapping("/noticePage")
    public String pagingNotice(@RequestParam(value = "button",required = false) int button,HttpServletRequest req, RedirectAttributes redirect){
        System.out.println("버튼 항목은"+button);
        HttpSession session = req.getSession(); //세션 생성
        session.setAttribute("list",(List<DTOBoard>)pagingUtils.getPaging(button));//게시글리스트 받아옴
        session.setAttribute("now",button);
        redirect.addAttribute("contentPage","board/notice.jsp");
        return "redirect:mainForm";
    }

    /*게시글 확인*/
    @GetMapping("/notice_section")
    public String BoardSection(@RequestParam(value = "idx",required = false) long idx, HttpServletRequest req, RedirectAttributes redirect) {
        //공지 자세한거 가져와서 보냄
        DTOBoard board=serviceBoard.getBoardDetail(idx);
        HttpSession session = req.getSession(); //세션 생성
        session.setAttribute("board",board);

        redirect.addAttribute("contentPage","board/notice_section.jsp");
        return "redirect:mainForm";
    }


    /*게시글 쓰기*/
    @GetMapping("/boardWrite")
    public String BoardWrite(RedirectAttributes redirect){
        redirect.addAttribute("contentPage","board/boardWrite.jsp");
        return "redirect:mainForm";
    }

    @PostMapping("/boardWrite")
    String insertBoard(HttpServletRequest req, Model model, MultipartFile file) throws IOException{
        System.out.println("여기까지놨더"+file);
        System.out.println(req.getParameter("title"));
        System.out.println(req.getParameter("content"));
        System.out.println(req.getParameter("boardType"));
        int result = serviceBoard.insertBoard(req, file);
        if (result > 0) {
            model.addAttribute("msg", "게시글이 등록되었습니다.");
            model.addAttribute("url", "/");
        } else {
            model.addAttribute("msg", "게시글이 등록에 실패하였습니다.");
            model.addAttribute("url", "/");
        }
        return "redirect";
    }

    /*게시글 업데이트*/
    @GetMapping("/boardUpdate") //URL에 데이터를 붙여 전송하는 것.
    public String boardUpdateOpen(@RequestParam(value = "boardIdx",required = false) int boardIdx,HttpServletRequest req,RedirectAttributes redirect){
        DTOBoard board=serviceBoard.getBoardDetail(boardIdx);
        System.out.println(board);
        req.getSession().setAttribute("board",board);
        redirect.addAttribute("contentPage","board/boardUpdate.jsp");
        return "redirect:mainForm";
    }
    @PostMapping("/boardUpdate") //데이터를 본문안에 전송한다.
    String boardUpdate(HttpServletRequest req,Model model){
        int result=serviceBoard.updateBoard(req);
        String boardType=req.getParameter("boardType");
        if(result>0) {
            model.addAttribute("msg", "게시글이 수정되었습니다.");
            model.addAttribute("url", "/noticeList?id=" + boardType);
        }else{
            model.addAttribute("msg", "게시글 수정에 실패하였습니다.");
            model.addAttribute("url", "/noticeList?id=" + boardType);
        }
        return "redirect";
    }

    /*게시글 삭제*/
    @GetMapping("/boardDelete")
    String boardDelete(HttpServletRequest req,Model model){
        boolean result=serviceBoard.deleteBoard(Integer.parseInt(req.getParameter("idx")));
        String boardType=req.getParameter("boardType");
        if (result==true){
            model.addAttribute("msg","글이 삭제되었습니다");
            model.addAttribute("url","/noticeList?id="+boardType);}
        else{
            model.addAttribute("msg","오류발생");
            model.addAttribute("url","/noticeList?id="+boardType);
        }
        return "redirect";
    }
}