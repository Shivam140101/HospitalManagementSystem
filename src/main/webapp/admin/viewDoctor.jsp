<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hospital</title>
    <%@ include file = "../components/allcss.jsp" %>
    <style>
    .paint-card {
    	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
    }
    </style>
  </head>
  <body>
    <%@ include file = "navbar.jsp" %>

    <div class="container-fluid p-3">
    		<div class="row">

    			<div class="col-md-12">
                        <div class="card paint-card">
                            <div class="card-body">
                                <p class="fs-3 text-center">Doctor Details</p>
                                <c:if test="${not empty ErrorMsg}">
                                	<p class="fs-3 text-center text-danger">${ErrorMsg}</p>
                                	<c:remove var="ErrorMsg" scope="session" />
                                </c:if>
                                <c:if test="${not empty SucMsg}">
                                	<div class="fs-3 text-center text-success" role="alert">${SucMsg}</div>
                                	<c:remove var="SucMsg" scope="session" />
                                </c:if>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">Full_Name</th>
                                            <th scope="col">DOB</th>
                                            <th scope="col">Qualification</th>
                                            <th scope="col">Specialist</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Mob No</th>
                                            <th scope="col">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%
                                            DoctorDao dao2 = new DoctorDao(DBConnect.getConn());
                                            List<Doctor> list2  =dao2.getAllDoctor();
                                            for(Doctor d: list2){%>
                                                <tr>
                                                    <td><%=d.getFullName() %></td>
                                                    <td><%=d.getDob() %></td>
                                                    <td><%=d.getQualification() %></td>
                                                    <td><%=d.getSpecialist() %></td>
                                                    <td><%=d.getEmail() %></td>
                                                    <td><%=d.getMobNo() %></td>
                                                    <td>
                                                        <a href="editDoctor.jsp?id=<%=d.getId() %>" class="btn btn-sm btn-primary">Edit</a>
                                                        <a href="../deleteDoctor?id=<%=d.getId() %>" class="btn btn-sm btn-danger">Delete</a>
                                                    </td>
                                                </tr>
                                            <%}
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