package com.user.servlet;

import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/userLogin")
public class UserLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();

        UserDao dao = new UserDao(DBConnect.getConn());
        User user = dao.login(email, password);

        if (user != null) {
            session.setAttribute("userObj", user);
            resp.sendRedirect("index.jsp");
        }else{
            session.setAttribute("ErrorMsg", "invalid email and password");
            resp.sendRedirect("userLogin.jsp");
        }
    }
}
