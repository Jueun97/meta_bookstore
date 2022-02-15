package com.meta;

import org.springframework.boot.SpringApplication;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@PropertySource(value = {"classpath:filepath.properties"})
public class MetaBookdstoreApplication{

	public static void main(String[] args) {
		SpringApplication.run(MetaBookdstoreApplication.class, args);
	}

}