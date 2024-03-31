<%@page import="com.entity.User"%>
<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hospital</title>
    <%@ include file = "components/allcss.jsp"%>
    <style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }

        .backImg {
        	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),url("images/hos3.jpg");
        	height: 20vh;
        	width: 100%;
        	background-size: cover;
        	background-repeat: no-repeat;
        }

        .doct4{
            height: 20rem;
            position: relative;
            top: 2rem;
            left: 1.5rem;
        }
    </style>
  </head>
  <body>

    <c:if test="${ empty userObj }">
    	<c:redirect url="userLogin.jsp"></c:redirect>
    </c:if>

	<%@include file="components/navbar.jsp"%>

	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment
							List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>

								</tr>
							</thead>
							<tbody>

							    <%
							        User user = (User) session.getAttribute("userObj");
							        AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
							        DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
							        List<Appointment> list = dao.getAllAppointmentByLoginUser(user.getId());
							        for(Appointment ap: list){
							            Doctor d = dao2.getDoctorById(ap.getDoctorId());
							        %>
							            <tr>
                                        	<th><%= ap.getFullName() %></th>
                                        	<td><%= ap.getGender() %></td>
                                        	<td><%= ap.getAge() %></td>
                                        	<td><%= ap.getAppointDate() %></td>
                                        	<td><%= ap.getDisease() %></td>
                                        	<td><%= d.getFullName() %></td>
                                        	<td>
                                        	    <%
                                        	        if("Pending".equals(ap.getStatus())) {%>

                                        	            <a href="#" class="btn btn-sm btn-warning">Pending</a>
                                        	        <%}else {%>
                                        	            <%= ap.getStatus() %>
                                        	        <%}

                                        	    %>
                                        	</td>
                                        </tr>
							        <%
							        }
							    %>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="col-md-3 p-3">
				<img alt="" src="images/doc4.jpeg" class="doct4">
			</div>
		</div>
	</div>
  </body>
  </html>