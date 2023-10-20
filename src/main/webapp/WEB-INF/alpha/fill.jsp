<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 

<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Gabarito&family=Montserrat:ital,wght@1,300&display=swap" rel="stylesheet">   
<meta charset="UTF-8">
<title>fill.jsp</title>
<style type="text/css">
body {
	font-family: 'Gabarito', sans-serif;
}
#surface {
	border-collapse: collapse;
	font-family: monospace;
	font-size: 2em;
	background: url('/media/sky.jpg');
	background-size: cover;
	background-repeat: no-repeat;
}

#surface td {
	opacity: 0.4;
}
.btn, article, .table__count, .table__alpha {
	display: flex;
	justify-content: center;
}
.table__count {
	margin: 20px;
}
#start ,#clear {
	margin: 0px 10px;
	padding: 10px 20px;
	font-family: 'Gabarito', sans-serif;
	border: none;
	border-radius: 10px;
	transition: 0.5s;
}
#start:hover {
	background-color: rgba(178,204,255,1);
}
#clear:hover {
	background-color: rgba(178,204,255,1);
}
.table__alpha {
	margin-bottom: 50px;
}

</style>
<script type="text/javascript">
window.onload = function() {
}

function startBtn_click(e) {
// 	let btn1 = document.querySelector('#start');
// 	console.log(btn1);
// 	console.log("startBtn...");
// 	btn1.style.color = "blue";
// 	let btn1 = document.querySelector('#start');
	start.disabled = true;
	clear.disabled = true;
//	document.querySelector('.btn').backgroundcolor = 'tomato';
	
	let timer = setInterval(function() {
		seconds.innerText = ++seconds.innerText;
	}, 1000);
	
	let tid = setInterval(function() {
		
		forCount.innerText = ++forCount.innerText;
		
		if (count.innerText == 800) {
			clearInterval(tid);
			clearInterval(timer);
			start.disabled = false;
			clear.disabled = false;
			return;
		}
		
		let xhr = new XMLHttpRequest();
		xhr.open('GET', '/alpha/data')
		xhr.responseType = 'json';
		xhr.onload = e => {
			let alpha = xhr.response;
			console.log(alpha);
			
			let td = surface.rows[alpha.line-1].cells[alpha.column-1];
			
			if (td.style.color=='black' && td.style.background=='black') {
				count.innerText = ++count.innerText;
			}			
			
			td.style.color = alpha.fg;
			td.style.background = alpha.bg;
			td.innerText = alpha.ch;
			
		}
		xhr.send();
	}, 10);
	
}

function clearBtn_click(e) {
	console.log("clearBtn...");
	/*
	for (let i=0; i<surface.rows.length; i++) {
		for (let j=0; j<surface.rows[i].cells.length; j++) {
			surface.rows[i].cells[j].style.color = 'black';
			surface.rows[i].cells[j].style.background = 'black';
		}
	}
	*/
	/*
	for (let row of surface.rows) {
		for (let td of row.cells) {
			td.style.color = 'black';
			td.style.background = 'black';
		}
	}*/
	
	Array.from(surface.rows).forEach(function(row) {
		Array.from(row.cells).forEach(function(td) {
			td.style.color = 'black';
			td.style.background = 'black';
		});
	});
	
	forCount.innerText = 0;
	count.innerText = 0;
	seconds.innerText = 0;
	
	
}
</script>
</head>
<body>
<article>
<h1>Spring MVC + XMLHttpRequest</h1>
</article>
<div class="btn">
<button id="start" onclick="startBtn_click(event);">Start</button>
<button id="clear" onclick="clearBtn_click(event);">Clear</button>
</div>
<div class="table__count">
<table  border="1" width="500">
	<thead>
	<tr>
		<th>forCount</th><th>count</th><th>seconds</th>
	</tr>
	</thead>
	<tbody>
	<tr>
		<td id="forCount" align="right">0</td>
		<td id="count" 	  align="right">0</td>
		<td id="seconds"  align="right">0</td>
	</tr>	
	</tbody>
</table>
</div>
<div class="table__alpha">
<table id="surface" onmousedown="event.preventDefault();" oncontextmenu="event.preventDefault();">
	<tbody>
	<c:forEach var="row" items="${surface}">
		<tr>
		<c:forEach var="alpha" items="${row}">
			<td style="color: ${alpha.fg}; background: ${alpha.bg};">${alpha.ch}</td>
		</c:forEach>
		</tr>
	</c:forEach>
	</tbody>
</table>
</div>
<!-- 전통적 For문 형태로 표면을 만들어 보세요  id="surface2" -->
<!-- <table id="surface2"> -->
<!-- 	<tbody> -->
<%-- 	<c:forEach var="i" begin="0" end="19"> --%>
<!-- 		<tr> -->
<%-- 		<c:forEach var="j" begin="0" end="39"> --%>
<%-- 			<c:set var="alpha" value="${surface[i][j]}"/> --%>
<%-- 			<td>${alpha.ch}</td> --%>
<%-- 		</c:forEach> --%>
<!-- 		</tr> -->
<%-- 	</c:forEach> --%>
<!-- 	</tbody> -->
<!-- </table> -->
</body>
</html>