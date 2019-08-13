<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INSERT TRAINER</title>
    </head>
    <body>
        <h1>INSERT TRAINER</h1>
        <form:form method="POST" modelAttribute="trainer" action="doinserttrainer.html">
            <table>
                <tbody>
                    <tr>
                        <td><form:input path="id"/>enter id</td>
                    </tr>
                    <tr>
                        <td><form:input path="firstname"/>enter first name</td>
                    </tr>
                    <tr>
                        <td><form:input path="lastname"/>enter last name</td>
                    </tr>
                    <tr>
                        <td><form:input path="subject"/>enter subject</td>
                    </tr>
                </tbody>
                <td><input type="submit" value="Insert Trainer"/></td>
            </table>
        </form:form>
    </body>
</html>
