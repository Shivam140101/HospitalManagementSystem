<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.DoctorDao"%>

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

    <c:if test = "${empty adminObj}">
        <c:redirect url = "../adminLogin.jsp"></c:redirect>
    </c:if>

    <div class="container p-5">
        <p class="text-center fs-3">Admin Dashboard</p>
        <c:if test="${not empty ErrorMsg}">
        	<p class="fs-3 text-center text-danger">${ErrorMsg}</p>
        	<c:remove var="ErrorMsg" scope="session" />
        </c:if>
        <c:if test="${not empty SucMsg}">
        	<div class="fs-3 text-center text-success" role="alert">${SucMsg}</div>
        	<c:remove var="SucMsg" scope="session" />
        </c:if>

        <%
            DoctorDao dao = new DoctorDao(DBConnect.getConn());
        %>

        <div class="row">
            <div class="col-md-4">
                <div class="card paint-card">
                    <div class="card-body text-center text-success">
                       <i class="fas fa-user-md fa-3x"></i><br>
                       <p class="fs-4 text-center">
                           Doctor <br> <%= dao.countDoctor() %>
                       </p>
                    </div>
                </div>
            </div>


            <div class="col-md-4">
                <div class="card paint-card">
                    <div class="card-body text-center text-success">
                       <i class="fas fa-user-circle fa-3x"></i><br>
                       <p class="fs-4 text-center">
                           User <br> <%= dao.countUser() %>
                       </p>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card paint-card">
                    <div class="card-body text-center text-success">
                       <i class="far fa-calendar-check fa-3x"></i><br>
                       <p class="fs-4 text-center">
                           Total Appointment <br> <%= dao.countAppointment() %>
                       </p>
                    </div>
                </div>
            </div>

            <div class="col-md-4 mt-2">
                <div class="card paint-card" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    <div class="card-body text-center text-success">
                       <i class="far fa-calendar-check fa-3x"></i><br>
                       <p class="fs-4 text-center">
                           Specialist <br> <%= dao.countSpecialist() %>
                       </p>
                    </div>
                </div>
            </div>
        </div>



        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form action="../addSpecialist" method="post">
                    <div class="form-group">
                        <label for=""> Enter Specialist Name</label>
                        <input type="text" name="specName" class="from-control">
                    </div>

                    <button type="submit" class="btn btn-primary mt-3">Add</button>
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              </div>
            </div>
          </div>
        </div>


  </body>
</html>
