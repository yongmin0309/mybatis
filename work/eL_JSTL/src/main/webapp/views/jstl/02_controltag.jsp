<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List,com.jstl.model.dto.Food" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>코어태그 활용하기</title>
</head>
<body>
	<h2>저장,출력하는 태그</h2>
	<p>
		c:set var="" value="" [scope=] -> 내장객체()에 데이터를 저장하는 태그 <br>
		c:out value="EL표현식" default="" espaceXml="" -> 내장객체에 저장되어있는 값을 페이지에 출력할때 <br> 
	</p>
	<h3>값을 저장하기</h3>
	<c:set var="comment" value="여러분 힘내요"/>
	<h4><c:out value="${comment}"/></h4>
	<h4>${comment }</h4>
	<c:set var="test" value="<script>alert('짠');</script>"/>
	<p><c:out value="${test }" escapeXml="false"/></p>
	<c:set var="bs" value="유병승"/>
	<p><c:out value="${bs }" default="bs없어" />야</p>
	
	<h3>if,for문 이용하기</h3>
	
	<p>
		c:if test="{조건식 }"  /c:if
	</p>
	
	
	<c:set var="su" value="20"/>
	<%-- <%if(pageContext.getAttribute("su")>10) { %>
				dfasd
	<%} %> --%>
 
	<c:if test="${su>20 }">
		<h3><c:out value="${su }"/>는 10보다 크다</h3>
	</c:if>
	
	<c:if test="${su<=20 }">
		<h3><c:out value="${su }"/>는 20보다 작거나 같다</h3>
	</c:if>
	
	<c:if test="${su>5 }">
		<c:if test="${su>10 }">
			<h2>20보다크네</h2>
		</c:if>
	</c:if>
	
	<h2>c:choose태그이용하기</h2>
	<p>
		c:shoose태그
			c:when test=""
			c:when test=""
			c:otherwise -> else
	</p>
	
	<c:set var="su2" value="5"/>
	
	<c:choose>
		<c:when test="${su2<10 }">
			<p>10보다 작은값</p>
		</c:when>
		<c:when test="${su2<15 }">
			<p>15보다 작은값</p>
		</c:when>
		<c:otherwise>
			<p>10보다 작지않고 15보다 작지않은값</p>
		</c:otherwise>
	</c:choose>
	
	
	<h2>반복문활용하기</h2>
	<p>
		c:forEach태그를 이용한다.<br>
		begin : 시작한느 숫자
		end : 끝나는 숫자
		step : 증감하는 숫자
		var : 변화되는 값을 저장하는 변수<br>
		items : 순회활 데이터지정(배열, collection)
		varStatus : 반복문에 대한 정보를 저장하는 객체(index, 반복한수 등을 저장) <br>
	</p>
	
	
	<h2>1부터 10까지 출력하기</h2>
	<c:forEach var="i" begin="1" end="10" step="1">
		<p>오늘만나서반가워요 ${i }</p> 
	</c:forEach>
	
	<h3>리스트나 배열에 있는 데이터를 출력하기</h3>
	<%
		List<String> names=List.of("김상훈","김용민","박은서","심지호","정은찬","148cm/60kg");
		request.setAttribute("names", names);
	%>
	
	<ul>
		<c:forEach var="name" items="${names}">
			<c:if test="${String.valueOf(name.charAt(0)) =='김' }">
				<li><c:out value="${name}"/></li>
			</c:if>
		</c:forEach>
	</ul>
	
	
	
	<%
		List<Food> foods=List.of (
				new Food("치킨", 20000,"새콤달콤"),
				new Food("낙곱새", 24000,"매콤"),
				new Food("초밥", 15000, "신선함"),
				new Food("지지고",4500, "물리는맛"),
				new Food("취두부", 5000, "짠맛")
				);
		request.setAttribute("foods", foods);
	%>
	<table>
		 <tr>
		 	<th>이름</th>
		 	<th>가격</th>
		 	<th>맛</th>
		 </tr>
		 <c:forEach var="f" items="${foods }">
		 	<c:if test="${f.price<10000 }">
		 		<tr>
		 			<td><c:out value="${f.name }"/></td> 
		 			
		 			<td><c:out value="${f.price }"/></td> 
		 				 
		 			<td><c:out value="${f.flavor }"/></td>  
		 		</tr>
		 	</c:if>
		 </c:forEach>
	</table>
	
	
	
	 <h3>다른페이지를 가져오기</h3>
		<p>
			c:import 태그 -> jsp:include 와 비슷함
			var="" url=""
		</p>
	
		<c:import var="header1" url="/views/common/header.jsp">
			<c:param name="titile" value="import해서"/>
			<c:param name="style" value="color:lightgreen;background-color:coral;"/>
		</c:import> <%--저장 --%>
	
		
	
		${header1 }
	
</body>
</html>




