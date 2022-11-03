<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="customer" class="classic.web.app.CustomerBean" scope="session"/>
<c:if test="${empty customer.id}">
	<c:redirect url="customer.jsp"/>
</c:if>
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
				<th>Dept id</th>
				<th>Dept Name</th>
				<th>Dept loc</th>
				<th>View Details</th>
			</tr>
			<c:forEach var="entry" items="${customer.orders}">
				<tr>
					<td>${entry.did}</td>
					<td>${entry.dname}</td>
					<td>${entry.dloc}</td>
					<td><a href= "employee.jsp?did=${entry.did}">Details</a></td>
				</tr>
			</c:forEach>
		</table>
		<p>
			<a href="customer.jsp?signout=true">Logout</a>
		</p>
	</body>
</html>

