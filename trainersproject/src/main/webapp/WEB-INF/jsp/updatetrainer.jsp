<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>UPDATE TRAINER</title>
</head>
<body>
<h1>UPDATE TRAINER</h1>
<form:form method="POST" modelAttribute="trainerafter" action="doupdatetrainer.html">
    <table>
        <tbody>
        <tr>
            <td><form:input path="id" value="${trainerbefore.id}"/>id</td>
            <td><form:input path="firstname" value="${trainerbefore.firstname}"/>first name</td>
            <td><form:input path="lastname" value="${trainerbefore.lastname}"/>last name</td>
            <td><form:input path="subject" value="${trainerbefore.subject}"/>subject</td>
        </tr>
        </tbody>
        <td><input type="submit" value="Update Trainer"/></td>
    </table>
</form:form>
</body>
</html>
