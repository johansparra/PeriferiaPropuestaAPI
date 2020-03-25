package com.api.rest.server.main;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;


/*
@SpringBootApplication
public class ApiPeriferiaApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApiPeriferiaApplication.class, args);
	}

}
*/

@SpringBootApplication(scanBasePackages = {"com.api"})
public class ApiPeriferiaApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApiPeriferiaApplication.class, args);
	}
}
