<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="emp" class="classic.web.app.DepartmentBean" scope="session"/>
<jsp:setProperty name="emp" property="*"/>
<html>
	<head>
		<title>ClassicWebApp</title>
                <link rel="stylesheet" href="mystyle.css">
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

	</head>
	<body>
		<h1><i class="fa fa-user"/>Welcome HR ${customer.id}</h1>
		<h3>Employee Info</h3>
		<table border="1">
			<tr>
				<th>EMP ID</th>
				<th>EMP Name</th>
				<th>EMP SAL</th>
				<th>EMP AGE</th>
				<th>EMP DEPT ID</th>
			</tr>
			<c:forEach var="entry" items="${emp.details}">
				<tr>
					<td>${entry.eid}</td>
					<td>${entry.ename}</td>
					<td>${entry.sal}</td>
					<td>${entry.age}</td>
					<td>${entry.did}</td>
				</tr>
			</c:forEach>
		</table>
		<p>
			<a href="customer.jsp?signout=true">Logout</a>
		</p>
	</body>
</html>

