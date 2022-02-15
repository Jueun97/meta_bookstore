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
    }

}