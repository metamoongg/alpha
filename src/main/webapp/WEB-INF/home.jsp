<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home.jsp</title>
<link rel="icon" type="image/png" href="media/favicon.png">
<link rel="stylesheet" href="css/cube.css">
<style type="text/css">
.menu {
	display: flex;
	list-style: none;
	align-items: flex-start;		/* 	부모를 크기 정렬 기준으로 삼음 start(맨위 정렬) */
	/* 	화면 고정 */
	position: fixed;
	width: 80%;
	top: 10px;
	left: 10px;
}
.menu-item {
/* 	min-width: 150px; */
	width: 150px;
	flex-shrink: 0;
	background: orange;
}
.menu-item:hover > .menu-title {
	text-shadow: 10px 10px 5px red;
}
.menu-item:hover > .sub-menu {
	max-height: 500px;
	
	transition: max-height 2s;
}
.menu-item:last-child {
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
	font-size: 15px;
}
.sub-menu-item > a {
	padding: 10px;
	font-size: 12px;
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
</style>
<script type="text/javascript">
function resize() {
	let iframe = document.querySelector('iframe');
	iframe.style.height = getComputedStyle(iframe.contentDocument.documentElement).height;
}

window.onload = function() {
	setInterval(resize, 100);	
}
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
			<li class="sub-menu-item"><a target="content" href="/alpha/earthworm">earthworm</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Animation</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/ani/fill">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/ani/cross">cross</a></li>
			<li class="sub-menu-item"><a target="content" href="/ani/race">race</a></li>
			<li class="sub-menu-item"><a target="content" href="/ani/cube">cube</a></li>
		</ol>
	</li>
	<li class="menu-item">
	<div class="menu-title">React</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/react/fill">fill</a></li>
			<li class="sub-menu-item"><a target="content" href="/react/cross">cross</a></li>
			<li class="sub-menu-item"><a target="content" href="/react/race">race</a></li>
		</ol>
	</li>
	<li class="menu-item">
	<div class="menu-title">Employee</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/dept/list">dept</a></li>
			<li class="sub-menu-item"><a target="content" href="/emp/list">cross</a></li>
			<li class="sub-menu-item"><a target="content" href="/salgrade/list">salgrade</a></li>
		</ol>
	</li>
	<li class="menu-item">
	<div class="menu-title">City</div>
		<ol class="sub-menu">
			<li class="sub-menu-item"><a target="content" href="/city/list">city</a></li>
			<li class="sub-menu-item"><a target="content" href="/country/list">country</a></li>
			<li class="sub-menu-item"><a target="content" href="/language/list">country</a></li>
			<li class="sub-menu-item"><a target="content" href="/city/search">search</a></li>
		</ol>
	</li>
	<li class="menu-item">
		<div class="menu-title">Login</div>
	</li>
</ul>
</nav>
<iframe src="/alpha/fill" 
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