<%--
  Created by IntelliJ IDEA.
  User: VTS
  Date: 11/2/2022
  Time: 8:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>List Customers</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
          integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: green">
        <div id="header-name">
            <a href="${pageContext.request.contextPath}/" class="navbar-brand">
                CRM - Customer Relationship Manager
            </a>
        </div>

        <div id="log-out">
            <form:form action="${pageContext.request.contextPath}/logout" method="post">
                <input type="submit" value="Log out">
            </form:form>
        </div>
    </nav>
</header>
<br>

<div class="row">

    <div class="container">
        <h3 class="text-center">List of Customers</h3>
        <hr>

        <security:authorize access="hasRole('ADMIN')">
            <div class="container text-left">
                <a href="${pageContext.request.contextPath}/customer/showFormForAdd" class="btn btn-success">
                    Add New Customer
                </a>
            </div>
            <br>
        </security:authorize>

        <table class="table table-bordered">
            <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>

                <security:authorize access="hasRole('ADMIN')">
                    <th>Update</th>
                    <th>Delete</th>
                </security:authorize>

            </tr>
            </thead>
            <tbody>

            <c:forEach var="tempCustomer" items="${customers}">
                <tr>
                    <td>${tempCustomer.firstName}</td>
                    <td>${tempCustomer.lastName}</td>
                    <td>${tempCustomer.email}</td>

                    <security:authorize access="hasRole('ADMIN')">
                        <td>
                            <form class="form-center"
                                  action="${pageContext.request.contextPath}/customer/showFormForUpdate"
                                  method="post">
                                <input type="hidden" name="customerID" value="${tempCustomer.id}">
                                <input id="update-btn" type="image"
                                       src="${pageContext.request.contextPath}/resources/image/update-icon.jpg"
                                       alt="update">
                            </form>
                        </td>
                    </security:authorize>

                    <security:authorize access="hasRole('ADMIN')">
                        <td>
                            <form onsubmit="return confirmDelete();" class="form-center"
                                  action="${pageContext.request.contextPath}/customer/deleteCustomer" method="post">
                                <input type="hidden" name="customerID" value="${tempCustomer.id}">
                                <input id="delete-btn" type="image"
                                       src="${pageContext.request.contextPath}/resources/image/delete-icon.png"
                                       alt="delete">
                            </form>
                        </td>
                    </security:authorize>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="${pageContext.request.contextPath}/resources/js/script.js"></script>
</body>
</html>
