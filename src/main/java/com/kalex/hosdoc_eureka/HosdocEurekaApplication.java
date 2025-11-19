package com.kalex.hosdoc_eureka;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;

@SpringBootApplication
@EnableEurekaServer
public class HosdocEurekaApplication {

	public static void main(String[] args) {
		SpringApplication.run(HosdocEurekaApplication.class, args);
	}
}
