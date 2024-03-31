package com.doctor.servlet;

import com.dao.AppointmentDao;
import com.db.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/updateStatus")
public class UpdateStatus extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            int id = Integer.parseInt(req.getParameter("id"));
            int dId = Integer.parseInt(req.getParameter("dId"));
            String comm = req.getParameter("comm");

            AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.updateCommentStatus(id, dId, comm)){
                session.setAttribute("SucMsg","Comment Updated");
                resp.sendRedirect("doctor/patient.jsp");
            }else {
                session.setAttribute("ErrorMsg","Error Occurred Please Try Again");
                resp.sendRedirect("doctor/patient.jsp");
            }

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
