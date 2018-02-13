package com.bit.groupware.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoggingAdvice {
	   
	   private static final Logger logger = LoggerFactory.getLogger(LoggingAdvice.class);
	   
	   public Object logging(ProceedingJoinPoint jp) throws Exception {
	      //�޼ҵ� ���� ��
	      String className = jp.getTarget().getClass().getName();
	      String methodName = jp.getSignature().getName();
	      Object[] args = jp.getArgs();
	      
	      /*logger.info("ClassName : {}", className);
	      logger.info("MethodName : {}", methodName);
	      logger.info("Args : {}", args);
	      logger.info("Fracy : {}", jp.getThis().getClass().getName());*/
	      
	      Object retVal = null;
	      try {
	         //Target ��ü�� ����Ͻ� �޼ҵ� ȣ��
	         retVal = jp.proceed();
	      } catch (Throwable th) {
	         //���ܰ� �߻��� ���
	         logger.error("Error : {}", th.getMessage());
	         throw (Exception)th;
	      } finally {
	         //�޼ҵ� ������
	         /*logger.info("ClassName : {}", className);
	         logger.info("MethodName : {}", methodName);
	         logger.info("RetVal : {}", retVal);*/
	      }
	      return retVal;
	   }

	}







