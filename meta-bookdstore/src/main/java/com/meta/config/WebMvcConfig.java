package com.meta.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer{ //web 설정 파일이다.

    @Value("${file.path}")
    private String uploadFolder;

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        WebMvcConfigurer.super.addResourceHandlers(registry);
        //jsp페이지에서 /upload/**가 걸리면 file:///C:/file_repo/ 로 바꿔줌
        registry.addResourceHandler("/image/**") //jsp페이지에서 /upload/** 패턴이 나오면 발동됨
                .addResourceLocations("file:///"+uploadFolder) //위의 주소패턴 나오면 	이게 발동합니다
                .setCachePeriod(60*10*6) //1시간 동안 이미지를 캐싱함
                .resourceChain(true)  //true라고 적어야 발동함
                .addResolver(new PathResourceResolver());
        
         //<!----------------- 404예외처리를 위한 작성 --------------->
         //https://bottom-to-top.tistory.com/39
		 //https://tragramming.tistory.com/95 진짜 땡큐..
        // spring.web.resources.add-mappings=false 하는이유
		 //https://tecoble.techcourse.co.kr/post/2021-11-24-spring-customize-unhandled-api/
			/* '/js/**'로 호출하는 자원은 '/static/js/' 폴더 아래에서 찾는다. */ 
	        registry.addResourceHandler("/js/**").addResourceLocations("classpath:/static/js/").setCachePeriod(60 * 60 * 24 * 365); 
			/* '/css/**'로 호출하는 자원은 '/static/css/' 폴더 아래에서 찾는다. */ 
	        registry.addResourceHandler("/css/**").addResourceLocations("classpath:/static/css/").setCachePeriod(60 * 60 * 24 * 365); 
			/* '/img/**'로 호출하는 자원은 '/static/img/' 폴더 아래에서 찾는다. */ 
	        registry.addResourceHandler("/img/**").addResourceLocations("classpath:/static/img/").setCachePeriod(60 * 60 * 24 * 365); 
			/* '/scss/**'로 호출하는 자원은 '/static/scss/' 폴더 아래에서 찾는다. */ 
	        registry.addResourceHandler("/scss/**").addResourceLocations("classpath:/static/scss/").setCachePeriod(60 * 60 * 24 * 365); 
	        /* '/vendor/**'로 호출하는 자원은 '/static/vendor/' 폴더 아래에서 찾는다. */ 
	        registry.addResourceHandler("/vendor/**").addResourceLocations("classpath:/static/vendor/").setCachePeriod(60 * 60 * 24 * 365); 
    }

}