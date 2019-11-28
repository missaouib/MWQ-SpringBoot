package com.mobile.web.quiz.model.admin;

public class SideBarItem {
    public SideBarItem(String mainMenu, String subMenu) {
        this.mainMenu = mainMenu;
        this.subMenu = subMenu;
    }

    private String mainMenu;
    public String getMainMenu() {
        return mainMenu;
    }

    private String subMenu;
    public String getSubMenu() {
        return subMenu;
    }
}
