package Controller.card;

import Service.cardService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import north.utils.Cardinfo;

import java.io.IOException;

@WebServlet(urlPatterns = "/updateCard")
public class updateCard extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        resp.setContentType(("Text/html;charset=UTF-8"));
        req.setCharacterEncoding("UTF-8");
        String uid=req.getParameter("userid");
        String uname=req.getParameter("username");
        String cardid=req.getParameter("cardid");
        String balance =req.getParameter("balance");
        System.out.println("UPDATE "+uid+" "+uname+" "+cardid+" "+balance);
        Cardinfo cardinfo=new Cardinfo(Integer.parseInt(uid),uname,Integer.parseInt(cardid),(int)(100*Float.parseFloat(balance)));
        cardService cardService =new cardService();
        int i=cardService.updateCard(cardinfo);
        if(i==1)resp.getWriter().print("修改成功！");
        else if(i==2) resp.getWriter().print("修改失败，您输入的用户信息不合法！");
        else resp.getWriter().print("修改失败，系统错误！");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
