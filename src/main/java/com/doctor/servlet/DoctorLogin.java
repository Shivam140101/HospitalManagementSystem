package com.doctor.servlet;

import com.dao.DoctorDao;
import com.dao.UserDao;
import com.db.DBConnect;
import com.entity.Doctor;
import com.entity.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/doctorLogin")
public class DoctorLogin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        HttpSession session = req.getSession();

        DoctorDao dao = new DoctorDao(DBConnect.getConn());
        Doctor doctor = dao.login(email, password);

        if (doctor != null) {
            session.setAttribute("docObj", doctor);
            resp.sendRedirect("doctor/index.jsp");
        }else{
            session.setAttribute("ErrorMsg", "invalid email and password");
            resp.sendRedirect("doctorLogin.jsp");
        }
    }
}
