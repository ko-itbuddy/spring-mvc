package org.itbuddy.spring1.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm() {
		logger.info("registerForm");
		return "success";
	}
	
	@RequestMapping("/modify")
	public void modifyForm() {
		logger.info("modifyForm");
	}
	
	@RequestMapping("/list")
	public void list() {
		logger.info("list");
	}
	
	@RequestMapping("/register")
	public String read(@PathVariable("boardNo") int boardNo) {
		logger.info("read boardNo : "+ boardNo);
		return "board/read";
	}

}
