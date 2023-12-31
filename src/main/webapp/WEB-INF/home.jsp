<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>alpha.jsp</title>
<link rel="stylesheet" href="css/reset.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gabarito&family=Montserrat:ital,wght@1,300&display=swap" rel="stylesheet">
<link rel="icon" type="image/png" href="media/favicon.png">
<link rel="stylesheet" href="css/cube.css">
<style type="text/css">
.menu {
	display: flex;
	list-style: none;
	align-items: flex-start;		/* 	부모를 크기 정렬 기준으로 삼음 start(맨위 정렬) */
	/* 	화면 고정 */
	position: fixed;
	width: 100%;
	height: 20px;
	background-color:rgba(178,204,255,1);
	top: 0px;
	left: 0px;
	padding: 40px;
}
.menu-item {
/* 	min-width: 150px; */
	margin-top: -10px;
	width: 150px;
	flex-shrink: 0;
	background: rgba(178,204,255,1);
	font-family: 'Gabarito', sans-serif;
	text-decoration: none;
}
.cube {
	margin: -20px 40px 0px 0px;
}
.menu-item:hover > .menu-title {
	 font-weight: bold;
	 cursor: pointer;
}
.menu-item:hover > .sub-menu {
	max-height: 500px;
	transition: max-height 2s;
}
.menu-item:nth-last-child(1) {
	margin-left: auto;
	margin-right: 10px;
	
}
.sub-menu {
	max-height: 0px;
	overflow: hidden;
	list-style: none;
	padding-left: 0px;		/* 왼쪽 여백 삭제 */
}
.sub-menu-item {
	
}
.menu-title {
	padding: 10px;
	font-size: 17px;
	
}
.sub-menu-item > a {
	padding: 10px;
	font-size: 14px;
	display: block;
	text-decoration: none;
	color: black;
}
.sub-menu-item:hover > a {
	background-color: tomato;
}
iframe {
	margin-top: 100px;
}
a {
	color: black;
	text-decoration: none;
}
</style>
<script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>
<script type="text/javascript">
function resize() {
	let iframe = document.querySelector('iframe');
	iframe.style.height = getComputedStyle(iframe.contentDocument.documentElement).height;
}

// window.onload = function() {
// 	setInterval(resize, 100);	
// }
$(document).ready(function() {
	setInterval(resize, 100);
});
</script>
</head>
<body>
<nav>
<ul class="menu">
	<li style="padding: 0px 20px;">
		<section class="perspective">
		<article class="cube">
			<div class="base">Alpha</div>
			<div class="base front">A</div>
			<div class="base back">B</div>
			<div class="base left">C</div>
			<div class="base right">D</div>
			<div class="base top">E</div>
			<div class="base bottom">F</div>
		</article>
		</section>
	</li>
	<li class="menu-item">
		<div class="menu-title">Alpha</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/alpha/fill">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/cross">cross</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/race">race</a></li>
			<li class="sub-menu-item"><a target="content" href="/alpha/zigzag">zigzag</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Animation</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/ani/fill">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/cube.jsp">cube</a></li>
			<li class="sub-menu-item"><a target="content" href="/placeholder.jsp">placeholder</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">React</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/fill.jsp">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/sort.jsp">sort</a></li>
			<li class="sub-menu-item"><a target="content" href="/move.jsp">move</a></li>
			<li class="sub-menu-item"><a target="content" href="/flow.jsp">flow</a></li>
			<li class="sub-menu-item"><a target="content" href="/ping.jsp">ping</a></li>
			<li class="sub-menu-item"><a target="content" href="/rest/dept">dept</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Employee</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/dept/list">dept</a></li>
			<li class="sub-menu-item"><a target="content" href="/emp/list">emp</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">City</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/city/list">city</a></li>
			<li class="sub-menu-item"><a target="content" href="/country/list">country</a></li>
		</ol>
	</li>
	<sec:authorize access="isAnonymous()">
	<li class="menu-item">
		<div class="menu-title">
		<a href="/login">Login</a>
		</div>
	</li>
		
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
	<li class="menu-item">
		<div class="menu-title">
			<a href="/logout">Logout</a>
		</div>
	</li>
	<li class="menu-item">
		<div class="menu-title">
			<a href="#"><sec:authentication property="name"/></a>
		</div>
	</li>
	</sec:authorize>
	
</ul>
</nav>
<iframe src="/ani/fill" 
		 name="content" 
		 width="100%"
		 scrolling="no"
		 frameborder='0'
		 sendbox="allow-same-origin"
		 onload="resize()">
iframe 태그를 지원하지 않는 브라우저는 이 글이 보입니다. 
</iframe>
</body>
</html>