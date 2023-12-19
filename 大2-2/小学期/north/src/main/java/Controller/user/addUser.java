package Controller.user;

import Service.userService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "addUser")
public class addUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType(("Text/html;charset=UTF-8"));
        req.setCharacterEncoding("UTF-8");
        String uid=req.getParameter("uid");
        String userName=req.getParameter("userName");
        String password=req.getParameter("passWord");
        String root =req.getParameter("uroot");
        userService userService=new userService();
        int i=userService.addUser(Integer.parseInt(uid),userName,password,Integer.parseInt(root));
        resp.getWriter().print(i);
    }
}
