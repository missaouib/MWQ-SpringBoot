package com.mobile.web.quiz.model;

public class BottomBarItem2 {
    private String title;
    private String icon;
    private String url;
    private String color;

    public BottomBarItem2(String title, String icon, String url, String color) {
        this.title = title;
        this.icon = icon;
        this.url = url;
        this.color = color;
    }

    public String getTitle() {
        return title;
    }

    public String getIcon() {
        return icon;
    }

    public String getUrl() {
        return url;
    }

    public String getColor() {
        return color;
    }
}