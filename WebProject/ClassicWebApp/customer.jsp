<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="customer" class="classic.web.app.CustomerBean" scope="session"/>
<jsp:setProperty name="customer" property="*"/>
<c:if test="${param.signout}">
	<c:set target="${customer}" property="id"/>
</c:if>
<html>
	<head>
		<title>ClassicWebApp</title>
         <link rel="stylesheet" href="mystyle.css">
	 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
		<h1/><i class="fa fa-user"/>Welcome HR</h1>

		<form method="POST">
			<p>
			<b>HR ID</b><br/>
				<input type="text" name="id" value="Enter ID";/>
			</p>
			<p>
				<b>Password</b><br/>
				<input type="password" name="password" value="EnterP"/>
			</p>
			<button class="divlogin">
				<input type="submit" name="submit" value="Login"/>
			</button>
		</form>
		<c:if test="${param.submit == 'Login'}">
			<c:choose>
				<c:when test="${customer.authenticate()}">
					<c:redirect url="orders.jsp"/>
				</c:when>
				<c:otherwise>
					<b>Authentication Failed</b>
				</c:otherwise>
			</c:choose>
		</c:if>
	</body>
</html>

