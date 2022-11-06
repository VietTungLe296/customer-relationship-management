<%--
  Created by IntelliJ IDEA.
  User: VTS
  Date: 11/3/2022
  Time: 6:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Add New Customer</title>
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
        integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
  <link type="text/css" rel="stylesheet"
        href="<%=request.getContextPath()%>/resources/static/error/customer-input-error.css">
</head>

<body>

<header>
  <nav class="navbar navbar-expand-md navbar-dark" style="background-color: green">
    <div>
      <a href="<%=request.getContextPath()%>/customer/list" class="navbar-brand">
        CRM - Customer Relationship Manager
      </a>
    </div>

  </nav>
</header>
<br>

<div class="container col-md-5">
  <div class="card">
    <div class="card-body">
      <form:form onsubmit="return confirmAdd()" action="saveNewCustomer" modelAttribute="customer" method="post">
        <caption>
          <h2>Add New Customer</h2>
        </caption>

        <fieldset class="form-group">
          <form:label path="firstName">First Name</form:label>
          <form:input path="firstName" cssClass="form-control"/>
          <form:errors path="firstName" cssClass="error" />
        </fieldset>

        <fieldset class="form-group">
          <form:label path="lastName">Last Name</form:label>
          <form:input path="lastName" cssClass="form-control"/>
          <form:errors path="lastName" cssClass="error" />
        </fieldset>

        <fieldset class="form-group">
          <form:label path="email">Email</form:label>
          <form:input path="email" cssClass="form-control"/>
          <form:errors path="email" cssClass="error" />
        </fieldset>

        <fieldset style="text-align: center" class="form-group">
          <button type="submit" class="btn btn-success">Add</button>
        </fieldset>

        <a href="<%=request.getContextPath()%>/customer/list">Back to List</a>

      </form:form>
    </div>
  </div>
</div>
<script src="<%=request.getContextPath()%>/resources/static/js/script.js"></script>
</body>

</html>
