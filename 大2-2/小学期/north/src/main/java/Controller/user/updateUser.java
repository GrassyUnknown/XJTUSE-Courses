package Controller.user;

import Service.userService;
import north.utils.Userinfo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet(urlPatterns = "/updateUser")
public class updateUser extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType(("Text/html;charset=UTF-8"));
        req.setCharacterEncoding("UTF-8");
        System.out.println("123");
        String uid=req.getParameter("userid");
        String name=req.getParameter("username");
        String pass=req.getParameter("password");
        String root =req.getParameter("uroot");
        System.out.println(uid+name+pass+root);
        Userinfo userinfo=new Userinfo(Integer.parseInt(uid),name,pass,Integer.parseInt(root));
        userService userService=new userService();
        int i=userService.updateUser(userinfo);
        if (i==1){
            resp.getWriter().print("修改成功");
        }else resp.getWriter().print("修改失败");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }
}
