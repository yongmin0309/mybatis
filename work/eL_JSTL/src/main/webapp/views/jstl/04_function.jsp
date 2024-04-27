<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set var="date" value="How are you? I am fine"/>
	<h4><c:out value="${date }"/></h4>
	<h4><c:out value="${fn:toUpperCase(date)}"/></h4>
	<h4><c:out value="${fn:toLowerCase(date)}"/></h4>
	<h4><c:out value="${fn:replace(date, 'fine','tired')}"/></h4>
	<h4><c:out value="${fn:contains(date, 'fine')?'좋다':'싫다'}"/></h4>
	<h4><c:out value="${fn:contains(date, 'notfine')?'좋다':'싫다'}"/></h4>
</body>
</html>