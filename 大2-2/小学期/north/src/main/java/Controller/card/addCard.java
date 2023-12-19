package Controller.card;

import Service.cardService;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/addCard")
public class addCard extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType(("Text/html;charset=UTF-8"));
        req.setCharacterEncoding("UTF-8");
        String userId=req.getParameter("uid");
        String userName=req.getParameter("uname");
        System.out.println("FIND "+userId+" "+userName);
        //servlet当中获取对象
        cardService cardService =new cardService();
        int i=cardService.findUser(Integer.parseInt(userId),userName);
        resp.getWriter().print(i);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType(("Text/html;charset=UTF-8"));
        req.setCharacterEncoding("UTF-8");
        String uid=req.getParameter("uid");
        String userName=req.getParameter("uname");
        String cardid=req.getParameter("cardid");
        String cardbalance =req.getParameter("cardbalance");
        System.out.println("ADD "+uid+" "+userName+" "+cardid+" "+cardbalance);
        cardService cardService =new cardService();
        int i=cardService.addCard(Integer.parseInt(uid),userName,Integer.parseInt(cardid),(int)(100*Float.parseFloat(cardbalance)));
        resp.getWriter().print(i);
    }


}
