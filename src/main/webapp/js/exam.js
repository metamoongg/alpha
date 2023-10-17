import $ from 'jquery'
import {sprintf} from 'sprintf-js'
import sleep from 'es7-sleep'

async function time() {
	for(;;) {
		let current = new Date();
		let timeString = sprintf('%02d:%02d:%02d', current.getHours(),
															 current.getMinutes(),
															 current.getSeconds(),
															  )
//		$('span').text(current.toLocaleString());
		$('span').text(timeString)
				   .css('margin', 10)
				   .css('color', 'red')
		await sleep(500);
	}
}

$(document).ready(function() {
	$('body').append('<button>Start</button>')
	$('body').append('<span></span>')
	
	$('body').append('<hr>')
	for (let i=0; i<10; i++)
		$('body').append('<img alt="xxx">');
	
	$('button').click(function(e) {
		$('img').attr('src', 'http://via.placeholder.com/100x100')
				  .css('margin', 10)
	});	
	
	time();
});