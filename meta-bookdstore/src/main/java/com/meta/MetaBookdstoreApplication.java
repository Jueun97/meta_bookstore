package com.meta;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.PropertySource;
import org.springframework.web.servlet.DispatcherServlet;

@SpringBootApplication
@PropertySource(value = {"classpath:filepath.properties"})
public class MetaBookdstoreApplication{

	public static void main(String[] args) {
		ApplicationContext ctx = SpringApplication.run(MetaBookdstoreApplication.class, args);
		DispatcherServlet dispatcherServlet = (DispatcherServlet)ctx.getBean("dispatcherServlet");
        dispatcherServlet.setThrowExceptionIfNoHandlerFound(true);
	}

}