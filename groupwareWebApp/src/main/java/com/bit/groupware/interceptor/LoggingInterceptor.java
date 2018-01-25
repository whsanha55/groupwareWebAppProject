package com.bit.groupware.interceptor;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoggingInterceptor implements HandlerInterceptor {
	   private static final Logger logger = LoggerFactory.getLogger(LoggingInterceptor.class);
	   
	   public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	      throws Exception {
	      String params = "";
	      Enumeration<String> paramNames = request.getParameterNames();
	      while(paramNames.hasMoreElements()) {
	         String paramName = paramNames.nextElement();
	         String paramValue = request.getParameter(paramName);
	         params += "[" + paramName + "] : " + paramValue + "\t";
	      }
	      logger.info("Controller : {}", handler);
	      logger.info("params : {}", params);
	      return true;
	   }

	   public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	      ModelAndView modelAndView) throws Exception {
	      logger.info("ModelAndView : {}", modelAndView);   
	   
	   }

	   public void afterCompletion(HttpServletRequest request, HttpServletResponse response, 
	      Object handler, Exception ex)
	      throws Exception {
	      logger.error("ex : {}", ex);
	   }
}
