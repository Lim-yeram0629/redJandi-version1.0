package com.jandiFactoring.redJandi.configuration;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = "com.jandiFactoring.redJandi")
public class JandiFactoringApplication {

	public static void main(String[] args) {
		SpringApplication.run(JandiFactoringApplication.class, args);
	}

}
