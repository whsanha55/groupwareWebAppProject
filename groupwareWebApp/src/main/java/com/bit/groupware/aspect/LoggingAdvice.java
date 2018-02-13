package com.bit.groupware.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggingAdvice {
	   
	   private static final Logger logger = LoggerFactory.getLogger(LoggingAdvice.class);
	   
	   public Object logging(ProceedingJoinPoint jp) throws Exception {
	      //메소드 실행 전
	      String className = jp.getTarget().getClass().getName();
	      String methodName = jp.getSignature().getName();
	      Object[] args = jp.getArgs();
	      
	      /*logger.info("ClassName : {}", className);
	      logger.info("MethodName : {}", methodName);
	      logger.info("Args : {}", args);
	      logger.info("Fracy : {}", jp.getThis().getClass().getName());*/
	      
	      Object retVal = null;
	      try {
	         //Target 객체의 비즈니스 메소드 호출
	         retVal = jp.proceed();
	      } catch (Throwable th) {
	         //예외가 발생한 경우
	         logger.error("Error : {}", th.getMessage());
	         throw (Exception)th;
	      } finally {
	         //메소드 실행후
	         /*logger.info("ClassName : {}", className);
	         logger.info("MethodName : {}", methodName);
	         logger.info("RetVal : {}", retVal);*/
	      }
	      return retVal;
	   }

	}







