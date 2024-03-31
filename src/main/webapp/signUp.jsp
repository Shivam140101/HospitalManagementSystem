<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%@ include file = "components/allcss.jsp"%>
    <title>Hospital</title>
</head>
<body>

  <%@ include file = "components/navbar.jsp"%>




      <div class="container p-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 text-center">User Register</p>

                        <c:if test="${not empty SucMsg}">
                            <p class="text-center text-success fs-3">${SucMsg}</p>
                            <c:remove var="sucMsg" scope="session"/>
                        </c:if>

                        <c:if test="${not empty ErrorMsg}">
                            <p class="text-center text-danger fs-3">${ErrorMsg}</p>
                            <c:remove var="ErrorMsg" scope="session"/>
                        </c:if>

                        <form action="user_register" method="post">

                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" name="fullname" class="form-control" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label">Email address</label>
                                <input type="text" name="email" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" required>
                            </div>

                            <button type="submit" class="btn bg-success text-white col-md-12">Register</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
      crossorigin="anonymous"
    ></script>
</body>
</html>