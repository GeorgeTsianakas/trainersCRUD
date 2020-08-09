<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Customize Trainers </title>
</head>
<body>
<table border="solid black 1px">
    <thead>
    <tr>
        <th>id</th>
        <th>first name</th>
        <th>last name</th>
        <th>subject</th>
        <th>Update</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="trainer" items="${list}">
        <tr>
            <td>
                <c:out value="${trainer.id}"/>
            </td>
            <td>
                <c:out value="${trainer.firstname}"/>
            </td>
            <td>
                <c:out value="${trainer.lastname}"/>
            </td>
            <td>
                <c:out value="${trainer.subject}"/>
            </td>
            <td>
                <form method="get" action="updatetrainer/${trainer.id}.html">
                    <button type="submit">Update</button>
                </form>
            </td>
            <td>
                <form method="get" action="deletetrainer/${trainer.id}.html">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<br>
<td>
    <form method="get" action="inserttrainer.html">
        <button type="submit">Insert New Trainer</button>
    </form>
<td/>
</body>
</html>
