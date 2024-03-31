<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Hospital</title>
    <%@ include file = "components/allcss.jsp"%>
  </head>
  <body>

    <%@ include file = "components/navbar.jsp"%>

    <div class="container p-5">
        <div class="row">
            <div class="col-md-4 offset-md-4">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="fs-4 text-center">User Login</p>

                        <c:if test="${not empty SucMsg}">
                            <p class="text-center text-success fs-3">${SucMsg}</p>
                            <c:remove var="SucMsg" scope="session"/>
                        </c:if>

                        <c:if test="${not empty ErrorMsg}">
                            <p class="text-center text-danger fs-5">${ErrorMsg}</p>
                            <c:remove var="ErrorMsg" scope="session"/>
                        </c:if>

                        <form action="userLogin" method="post">
                            <div class="mb-3">
                                <label class="form-label">Email address</label>
                                <input type="email" name="email" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" required>
                            </div>

                            <button type="submit" class="btn bg-success text-white col-md-12">Login</button>
                        </form>
                        <br>
                        <p>Don't have an account?<a href="signUp.jsp" class="clink"> create one</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
  </body>
</html>
