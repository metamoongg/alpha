import React from 'react';
import {sprintf} from 'sprintf-js'
import sleep from 'es7-sleep'
import withRouter from './withRouter.js';

class List extends React.Component {
	constructor() {
		super();
		
		this.init();
	}
	
	async init() {
		let response = await fetch("/rest/dept")
		let json = await response.json();
		
		console.log(json)
	}
	
	render() {
		return (
			<>
			<h1>부서목록</h1>
			</>
		)
	}
}

export default withRouter(List);