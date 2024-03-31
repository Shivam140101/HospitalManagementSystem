package com.user.servlet;

import com.dao.AppointmentDao;
import com.db.DBConnect;
import com.entity.Appointment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/addAppointment")
public class AppointmentServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int userId = Integer.parseInt(req.getParameter("userid"));
        String fullName = req.getParameter("fullName");
        String gender = req.getParameter("gender");
        String age = req.getParameter("age");
        String appointDate = req.getParameter("appointDate");
        String email = req.getParameter("email");
        String phNo = req.getParameter("phNo");
        String disease = req.getParameter("disease");
        int doctorId = Integer.parseInt(req.getParameter("doc"));
        String address = req.getParameter("address");

        Appointment ap = new Appointment(userId, fullName, gender, age,appointDate, email, phNo, disease, doctorId, address,"Pending");

        AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
        HttpSession session = req.getSession();

        if (dao.addAppointment(ap)) {
            session.setAttribute("SucMsg","Appointment added Successfully");
            resp.sendRedirect("userAppointment.jsp");
        }else {
            session.setAttribute("ErrorMsg","Error Occurred");
            resp.sendRedirect("userAppointment.jsp");
        }
    }
}
