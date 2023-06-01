<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>DetailedTest</title>
	<script src="resources/js/jquery-3.6.4.min.js"></script>
	<script>
		$(document).ready(function() {
		});
	</script>
</head>
<body>
	<h1>전체 회원 정보 (총 ${ usercount }명)</h1>
	<c:forEach items="${ userlist }" var="dto" varStatus="vs">
		[${ vs.count }] ${ dto.name }<br>
	</c:forEach>
</body>
</html>