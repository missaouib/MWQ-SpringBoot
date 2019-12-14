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
    public static final String GROUP = "group";

    @EventListener
    public void appReady(ApplicationReadyEvent event) {
        if (!Config.UPLOAD_DIR.exists()) {
            Config.UPLOAD_DIR.mkdir();
        }

        String[] subDirs = new String[] { ARTICLE, GROUP };
        for (int i = 0; i < subDirs.length; i++) {
            File subDir = new File(Config.UPLOAD_DIR + "/" + subDirs[i]);
            if (!subDir.exists()) {
                subDir.mkdir();
            }
        }
    }
}
