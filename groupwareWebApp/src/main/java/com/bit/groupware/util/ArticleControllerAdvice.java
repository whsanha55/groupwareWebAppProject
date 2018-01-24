package com.bit.groupware.util;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice(basePackages = "com.bit.article.controller")
public class ArticleControllerAdvice {
	// ����ó�� �޼ҵ�
	@ExceptionHandler(value = Exception.class)
	public ModelAndView handleException(Exception ex) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("exception", ex);
		mv.setViewName("error");
		return mv;

	}
}
