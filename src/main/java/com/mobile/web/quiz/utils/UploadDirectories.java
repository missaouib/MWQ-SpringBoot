package com.mobile.web.quiz.utils;

import com.mobile.web.quiz.config.Config;
import org.springframework.boot.context.event.ApplicationReadyEvent;
import org.springframework.context.event.EventListener;
import org.springframework.stereotype.Component;

import java.io.File;
import java.util.Date;

@Component
public class UploadDirectories {
    public static final String ARTICLE = "article";

    @EventListener
    public void appReady(ApplicationReadyEvent event) {
        if (!Config.UPLOAD_DIR.exists()) {
            Config.UPLOAD_DIR.mkdir();
        }

        File article = new File(Config.UPLOAD_DIR + "/" + ARTICLE);
        if (!article.exists()) {
            article.mkdir();
        }
    }
}
