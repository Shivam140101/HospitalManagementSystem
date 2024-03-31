<%@page import="com.entity.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entity.Doctor"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital</title>
    <%@ include file = "../components/allcss.jsp"%>
    <style type="text/css">
        .paint-card {
    	    box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
    </style>
</head>
<body>

    <c:if test="${empty docObj}" >
        <c:redirect url="../doctorLogin.jsp"></c:redirect>
    </c:if>

    <%@ include file = "navbar.jsp" %>

    <div class="container p-3">
    		<div class="row">

    			<div class="col-md-12">
    				<div class="card paint-card">
    					<div class="card-body">
    						<p class="fs-3 text-center">Patient Details</p>
    						<c:if test="${not empty ErrorMsg}">
    							<p class="fs-4 text-center text-danger">${ErrorMsg}</p>
    							<c:remove var="ErrorMsg" scope="session" />
    						</c:if>
    						<c:if test="${not empty SucMsg}">
    							<p class=" fs-4 text-center text-success">${SucMsg}</p>
    							<c:remove var="SucMsg" scope="session" />
    						</c:if>

    						<table class="table">
    							<thead>
    								<tr>
    									<th scope="col">Full Name</th>
    									<th scope="col">Gender</th>
    									<th scope="col">Age</th>
    									<th scope="col">Appointment Date</th>
    									<th scope="col">Email</th>
    									<th scope="col">Mob No</th>
    									<th scope="col">Diseases</th>
    									<th scope="col">Status</th>
    									<th scope="col">Action</th>
    								</tr>
    							</thead>
    							<tbody>
    								<%
    								Doctor d = (Doctor) session.getAttribute("docObj");
    								AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
    								List<Appointment> list = dao.getAllAppointmentByDoctorLogin(d.getId());
    								for (Appointment ap : list) {
    								%>
    								<tr>
    									<th><%=ap.getFullName()%></th>
    									<td><%=ap.getGender()%></td>
    									<td><%=ap.getAge()%></td>
    									<td><%=ap.getAppointDate()%></td>
    									<td><%=ap.getEmail()%></td>
    									<td><%=ap.getPhNo()%></td>
    									<td><%=ap.getDisease()%></td>
    									<td><%=ap.getStatus()%></td>
    									<td>
    										<%
    										if ("Pending".equals(ap.getStatus())) {
    										%>
    										<a href="comment.jsp?id=<%=ap.getId()%>"
    										class="btn btn-success btn-sm">Comment</a>
    										 <%
    										 } else {
    										 %>
    										 <a href="comment.jsp?id=<%=ap.getId() %>" class="btn btn-success btn-sm disabled">Comment</a>
    										 <%
    										 }
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

    		</div>
    	</div>



</body>
</html>