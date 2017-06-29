package com.cognizant.aspect;

import java.util.Arrays;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LoggingAspect {
	
	private static final Logger LOG = Logger.getLogger(LoggingAspect.class);
	
	@Before("execution(* com.cognizant.service..*(..))")    
	public void before(JoinPoint joinPoint)
	{
		LOG.info(joinPoint.getSignature().getName()+" called");
		System.out.println(joinPoint.getSignature().getName()+" called");
		LOG.info("with Arguments"+Arrays.toString(joinPoint.getArgs()));
		//System.out.println("with Arguments"+Arrays.toString(joinPoint.getArgs()));
	}
	
	/*@org.aspectj.lang.annotation.After("execution(* com.cognizant.service..*(..))")
	public void After(JoinPoint joinPoint)
	{
		LOG.info(joinPoint.getSignature().getName()+" completed");
		System.out.println(joinPoint.getSignature().getName()+" completed");
	}*/
	
	@AfterReturning(pointcut="execution(* com.cognizant.service..*(..))",returning="result")
	public void returning(JoinPoint joinPoint,Object result)
	{
		LOG.info(joinPoint.getSignature().getName()+" called");
		System.out.println(joinPoint.getSignature().getName()+" called");
		LOG.info("Result is "+result);
		//System.out.println("Result is "+result);
	}

}
