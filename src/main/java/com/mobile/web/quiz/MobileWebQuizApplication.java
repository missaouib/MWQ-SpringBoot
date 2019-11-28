package com.mobile.web.quiz;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

import java.util.Date;

@EnableJpaAuditing
@SpringBootApplication
public class MobileWebQuizApplication {

    public static void main(String[] args) {
        SpringApplication.run(MobileWebQuizApplication.class, args);
    }
}
