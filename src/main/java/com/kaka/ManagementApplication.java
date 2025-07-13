package com.kaka;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@ServletComponentScan
@SpringBootApplication
public class ManagementApplication {

    public static void main(String[] args) {

        SpringApplication.run(ManagementApplication.class, args);
    }

}
