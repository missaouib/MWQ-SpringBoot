package com.mobile.web.quiz.model;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@EntityListeners(AuditingEntityListener.class)
public class Product implements Serializable {

    public static final int ACTIVE = 1;
    public static final int INACTIVE = 0;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public Long getId() {
        return id;
    }

    @Column(nullable = false)
    private String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(nullable = false)
    private double price;

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Column(nullable = false)
    private double expressDeliveryCost;

    public double getExpressDeliveryCost() {
        return expressDeliveryCost;
    }

    public void setExpressDeliveryCost(double expressDeliveryCost) {
        this.expressDeliveryCost = expressDeliveryCost;
    }

    @Column(nullable = false)
    private String parameter;

    public String getParameter() {
        return parameter;
    }

    public void setParameter(String parameter) {
        this.parameter = parameter;
    }

    @Column(nullable = false)
    private String detail;

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    @Column(nullable = false)
    private int purchaseMemberCount;

    public int getPurchaseMemberCount() {
        return purchaseMemberCount;
    }

    public void setPurchaseMemberCount(int purchaseMemberCount) {
        this.purchaseMemberCount = purchaseMemberCount;
    }

    @Column(nullable = false)
    private int sellCount;

    public int getSellCount() {
        return sellCount;
    }

    public void setSellCount(int sellCount) {
        this.sellCount = sellCount;
    }

    @Column(nullable = false, columnDefinition = "VARCHAR(255) DEFAULT ''")
    private String imageUrl;

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @Column(nullable = false)
    private int status;

    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }

    @Column(nullable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @CreatedDate
    private Date createdAt;

    public Date getCreatedAt() {
        return createdAt;
    }

    @Column(nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @LastModifiedDate
    private Date updatedAt;

    public Date getUpdatedAt() {
        return updatedAt;
    }

    @Override
    public String toString() {
        return "Product {" +
                "id=" + id + "," +
                "name=" + name + "," +
                "imageUrl=" + imageUrl + "," +
                "price=" + price + "," +
                "expressDeliveryCost=" + expressDeliveryCost + "," +
                "parameter=" + parameter + "," +
                "detail=" + detail + "," +
                "purchaseMemberCount=" + purchaseMemberCount + "," +
                "sellCount=" + sellCount + "," +
                "status=" + status +
                "}";
    }
}