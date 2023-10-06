<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="/webjars/jquery/jquery.js"></script>
<title>placeholder.jsp</title>
<script type="text/javascript">
/* [javascript]
	img3 = document.querySelector('img:last-child');
	img3.src
 	[jQuery]
	$('img:last-child').attr('src', 'http://via.placeholder.com/100X100');
	$('img').attr('src', 'http://via.placeholder.com/100X100');
	
 $(document).ready(function(){
		console.log("ready...");
	$('img').attr({
		src: function(i){
			let width = 100 + 100 * i;
			let height = 200 + 100 * i;
			return `http://via.placeholder.com/$(width)X$(height)`;
		}
	});
});
*/
$(function() {
	for (let i = 0; i < 50; i++){
		$('body').append('<img alt="xxx"/>');				// 가상의 이미지 태그 10개 생성
	}	
//	$('img').attr('src', 'http://via.placeholder.com/100X100');
	$('img').attr({
		alt: function(i) {
			return i + 'num';
		},
		src: function(i) {									// 랜덤한 크기의 이미지 생성
			let colors = [
							'000000',
							'FF0000',
							'00FF00',
							'0000FF',
							'FFFF00',
							'FF00FF',
							'00FFFF',
							'FFFFFF',
						]
			
			let fg = colors[parseInt(Math.random()*colors.length)];
			let bg = colors[parseInt(Math.random()*colors.length)];
			
			let width = parseInt(Math.random()*10 + 1) * 10;
			let height = parseInt(Math.random()*10 + 1) * 10;
			return `http://via.placeholder.com/\${width}X\${height}/\${bg}/\${fg}`;
		}
	}).css('border', '1px solid tomato')
	  .css('margin', 10)
	  .css('vertical-align', 'top');
});
</script>
</head>
<body>

</body>
</html>