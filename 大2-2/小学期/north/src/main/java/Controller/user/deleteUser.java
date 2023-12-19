package Controller.user;

import Service.userService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "deleteUser")
public class deleteUser extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType(("Text/html;charset=UTF-8"));
        req.setCharacterEncoding("UTF-8");
        String userId=req.getParameter("userid");
        System.out.println(userId);
        //servlet当中获取对象
        userService userService=new userService();
        int i=userService.deleteUser(Integer.parseInt(userId));
        resp.getWriter().print(i);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
