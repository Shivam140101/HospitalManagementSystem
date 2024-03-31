package com.user.servlet;

import com.dao.UserDao;
import com.db.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/userChangePassword")
public class ChangePassword extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int uId = Integer.parseInt(req.getParameter("uId"));
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");

        UserDao dao = new UserDao(DBConnect.getConn());
        HttpSession session = req.getSession();

        if (dao.checkOldPassword(uId,oldPassword)){
            if (dao.changePassword(uId,newPassword)){
                session.setAttribute("SucMsg", "Password changed");
                resp.sendRedirect("changePassword.jsp");
            }else {
                session.setAttribute("ErrorMsg","Something Wrong on Server");
                resp.sendRedirect("changePassword.jsp");
            }
        }else {
            session.setAttribute("ErrorMsg","Incorrect Password");
            resp.sendRedirect("changePassword.jsp");
        }
    }
}
