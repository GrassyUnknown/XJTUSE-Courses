package Controller.user;

import Service.userService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import north.utils.stata;

import java.io.IOException;

@WebServlet(name = "getLogin")
public class getLogin extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        System.out.println("已登录");
        resp.setContentType("Text/html;chartser=UTF-8");
        req.setCharacterEncoding("UTF-8");
        String userName = req.getParameter("userName");
        String passWord = req.getParameter("passWord");
        System.out.println(userName+passWord);
        userService method=new userService();
        stata stata=method.login2(userName,passWord);
        HttpSession session=req.getSession();
        if (stata.getRe()==1){
            session.setAttribute("uname",userName);
            session.setAttribute("uroot", stata.getRoot());
        }
        resp.getWriter().print(stata.getRe());
    }
}
