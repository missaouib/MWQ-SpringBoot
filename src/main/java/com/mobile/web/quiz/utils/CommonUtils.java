package com.mobile.web.quiz.utils;

import java.io.BufferedInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class CommonUtils {

    public static String getMD5Hex(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] hashInBytes = md.digest(str.getBytes(StandardCharsets.UTF_8));

            StringBuilder sb = new StringBuilder();
            for (byte b : hashInBytes) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException ex) {
            ex.printStackTrace();

            return "";
        }
    }

    public static String getRandomDigitString(int length) {
        Random rnd = new Random();
        int digits = rnd.nextInt((int) Math.pow(10, length) - 1);

        return String.format("%0" + length + "d", digits);
    }

    public static String getURLContent(String strURL) {
        final int bufferSize = 1024;
        try{
            URL url = new URL(strURL);
            BufferedInputStream bis = new BufferedInputStream(url.openStream());

            byte[] buffer = new byte[bufferSize];
            ByteArrayOutputStream outString = new ByteArrayOutputStream();

            int bytesRead = 0;
            while ((bytesRead = bis.read(buffer)) != -1) {
                outString.write(buffer, 0, bytesRead);
            }
            bis.close();

            return new String(outString.toByteArray());
        } catch (IOException ex) {
            ex.printStackTrace();

            return null;
        }
    }
}
