package com.admin.servlet;

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


@WebServlet("/updateDoctor")
public class UpdateDoctor extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {

            String fullName = req.getParameter("fullname");
            String dob = req.getParameter("dob");
            String qualification = req.getParameter("qualification");
            String spec = req.getParameter("spec");
            String email = req.getParameter("email");
            String mobNo = req.getParameter("mobno");
            String password = req.getParameter("password");

            int id = Integer.parseInt(req.getParameter("id"));

            Doctor d = new Doctor(id,fullName,dob,qualification,spec,email,mobNo,password);
            DoctorDao dao = new DoctorDao(DBConnect.getConn());
            HttpSession session = req.getSession();

            if (dao.UpdateDoctor(d)){
                session.setAttribute("SucMsg","Doctor Updated Successfully");
                resp.sendRedirect("admin/viewDoctor.jsp");
            }else {
                session.setAttribute("ErrorMsg","Error Occurred");
                resp.sendRedirect("admin/viewDoctor.jsp");
            }

        }catch (Exception e) {
            e.printStackTrace();
        }
    }
}
