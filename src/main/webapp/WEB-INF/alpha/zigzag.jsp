<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gabarito&family=Montserrat:ital,wght@1,300&display=swap" rel="stylesheet">
<title>zigzag.jsp</title>
<link rel="stylesheet" href="/css/zigzag.css">
<script type="text/javascript" src="/js/zigzag.js"></script>
</head>
<body>
<div class="center">
<h1>external javascript, css로 만들기(zigzag.js/zigzag.css)</h1>
</div>
<div class="center">
<button id="btnCreate">Create</button>
</div>
<div class="center">
<table id="surface">
	<tbody>
	<c:forEach var="list" items="${surface}">
		<tr>
		<c:forEach var="alpha" items="${list}">
			<td style="color: white; background: white;">${alpha.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
</body>
</html>