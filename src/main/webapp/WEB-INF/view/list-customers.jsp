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
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/resources/static/css/style.css">
</head>
<body>

<header>
    <nav class="navbar navbar-expand-md navbar-dark" style="background-color: green">
        <div>
            <a id="header-name" href="<%=request.getContextPath()%>/customer/list" class="navbar-brand">
                CRM - Customer Relationship Manager
            </a>
        </div>

    </nav>
</header>
<br>

<div class="row">

    <div class="container">
        <h3 class="text-center">List of Customers</h3>
        <hr>
        <div class="container text-left">
            <a href="<%=request.getContextPath()%>/customer/showFormForAdd" class="btn btn-success">
                Add New Customer
            </a>
        </div>
        <br>
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email</th>
                <th>Update</th>
                <th>Delete</th>
            </tr>
            </thead>
            <tbody>

            <c:forEach var="tempCustomer" items="${customers}">
                <tr>
                    <td>${tempCustomer.firstName}</td>
                    <td>${tempCustomer.lastName}</td>
                    <td>${tempCustomer.email}</td>
                    <td>
                        <form class="form-center" action="<%=request.getContextPath()%>/customer/showFormForUpdate"
                              method="post">
                            <input type="hidden" name="customerID" value="${tempCustomer.id}">
                            <input id="update-btn" type="image"
                                   src="<%=request.getContextPath()%>/resources/static/image/update-icon.jpg"
                                   alt="update">
                        </form>
                    </td>

                    <td>
                        <form onsubmit="return confirmDelete();" class="form-center"
                              action="<%=request.getContextPath()%>/customer/deleteCustomer" method="post">
                            <input type="hidden" name="customerID" value="${tempCustomer.id}">
                            <input id="delete-btn" type="image"
                                   src="<%=request.getContextPath()%>/resources/static/image/delete-icon.png"
                                   alt="delete">
                        </form>
                    </td>
                </tr>
            </c:forEach>

            </tbody>

        </table>

    </div>
</div>

<script src="<%=request.getContextPath()%>/resources/static/js/script.js"></script>
</body>
</html>
