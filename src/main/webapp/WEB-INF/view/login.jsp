<%--
  Created by IntelliJ IDEA.
  User: VTS
  Date: 11/9/2022
  Time: 10:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login-page.css">
</head>

<body class="text-center">

<form:form class="form-signin" action="${pageContext.request.contextPath}/authenticateTheUser" method="post">
    <h1 class="h3 mb-3 font-weight-normal">Sign In</h1>
    <c:if test="${param.error != null}">
        <em style="color: red">Invalid name or password!</em>
        <br><br>
    </c:if>

    <c:if test="${param.logout != null}">
        <em style="color: aqua">You have been logged out!</em>
        <br><br>
    </c:if>


    <label for="username" class="sr-only">Username</label>
    <input type="text" name="username" id="username" class="form-control" placeholder="Username" required autofocus>

    <label for="password" class="sr-only">Password</label>
    <input type="password" name="password" id="password" class="form-control" placeholder="Password" required>

    <button class="btn btn-lg btn-info btn-block" type="submit">Sign in</button>
</form:form>
</body>
</html>

