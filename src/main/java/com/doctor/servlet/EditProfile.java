package com.doctor.servlet;

import com.dao.DoctorDao;
import com.db.DBConnect;
import com.entity.Doctor;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/doctorUpdateProfile")
public class EditProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {

            String fullName = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String spec = req.getParameter("spec");
            String email = req.getParameter("email");
            String mobNo = req.getParameter("mobno");

            int id = Integer.parseInt(req.getParameter("id"));

            Doctor d = new Doctor(id,fullName,dob,qualification,spec,email,mobNo,"");
            DoctorDao dao = new DoctorDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.editDoctorProfile(d)){
                Doctor updateDetails = dao.getDoctorById(id);
                session.setAttribute("SucMsgd","Doctor Updated Successfully");
                session.setAttribute("docObj",updateDetails);
                resp.sendRedirect("doctor/editProfile.jsp");
            }else {
                session.setAttribute("ErrorMsgd","Error Occurred");
                resp.sendRedirect("doctor/editProfile.jsp");
            }

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
