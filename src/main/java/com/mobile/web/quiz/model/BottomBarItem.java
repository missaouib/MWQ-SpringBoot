package com.mobile.web.quiz.model;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = BottomBarItem.tableName)
@EntityListeners(AuditingEntityListener.class)
public class BottomBarItem implements Serializable {
    public static final String tableName = "bottom_bar";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public Long getId() {
        return id;
    }

    @Column(nullable = false)
    private String itemTitle;

    public String getItemTitle() {
        return itemTitle;
    }

    public void setItemTitle(String itemTitle) {
        this.itemTitle = itemTitle;
    }

    @Column(nullable = false)
    private String itemIcon;

    public String getItemIcon() {
        return itemIcon;
    }

    public void setItemIcon(String itemIcon) {
        this.itemIcon = itemIcon;
    }

    @Column(nullable = false)
    private String itemUrl;

    public String getItemUrl() {
        return itemUrl;
    }

    public void setItemUrl(String itemUrl) {
        this.itemUrl = itemUrl;
    }

    @Column(nullable = false)
    private int itemOrder;

    public int getItemOrder() {
        return itemOrder;
    }

    public void setItemOrder(int itemOrder) {
        this.itemOrder = itemOrder;
    }

    @Column(nullable = false)
    private String itemDefaultTitle;

    public String getItemDefaultTitle() {
        return itemDefaultTitle;
    }

    public void setItemDefaultTitle(String itemDefaultTitle) {
        this.itemDefaultTitle = itemDefaultTitle;
    }

    @Column(nullable = false)
    private String itemDefaultIcon;

    public String getItemDefaultIcon() {
        return itemDefaultIcon;
    }

    public void setItemDefaultIcon(String itemDefaultIcon) {
        this.itemDefaultIcon = itemDefaultIcon;
    }

    @Column(nullable = false)
    private String itemDefaultUrl;

    public String getItemDefaultUrl() {
        return itemDefaultUrl;
    }

    public void setItemDefaultUrl(String itemDefaultUrl) {
        this.itemDefaultUrl = itemDefaultUrl;
    }

    @Column(nullable = false)
    private int itemDefaultOrder;

    public int getItemDefaultOrder() {
        return itemDefaultOrder;
    }

    public void setItemDefaultOrder(int itemDefaultOrder) {
        this.itemDefaultOrder = itemDefaultOrder;
    }

    @Column(nullable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @CreatedDate
    private Date createdAt;

    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @LastModifiedDate
    private Date updatedAt;

    @Override
    public String toString() {
        return "Bottom Bar Item {" +
                "id=" + id + "," +
                "title=" + itemTitle + "," +
                "icon=" + itemIcon + "," +
                "url=" + itemUrl + "," +
                "order=" + itemOrder +
                "}";
    }
}