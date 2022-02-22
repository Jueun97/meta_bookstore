package com.meta.handler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.meta.handler.exceptions.CustomAccessDeniedHandler;

@ControllerAdvice
public class CommonExceptionHandler{
	
	
	private static final Logger log = LoggerFactory.getLogger(CommonExceptionHandler.class);

	//404예외에 대한 클래스 파일을 넘겨서 생성해서 사용하도록 지정
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex) {
		return "error/custom404";
	}
	
	//500예외 처리
	@ExceptionHandler(Exception.class)
	public String handle500(Exception ex,Model model) {
		//예외메시지
		log.error("Exception500....." + ex.getMessage());
		return "error/error_page";
	}

}
