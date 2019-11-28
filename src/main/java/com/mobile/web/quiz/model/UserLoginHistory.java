package com.mobile.web.quiz.model;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = UserLoginHistory.tableName)
@EntityListeners(AuditingEntityListener.class)
public class UserLoginHistory implements Serializable {
    public static final String tableName = "login_history";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public Long getId() {
        return id;
    }

    @Column(nullable = false)
    private String phoneNumber;

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Column(nullable = false)
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Column(nullable = false)
    private String ipAddress;

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    @Column(nullable = false, columnDefinition = "tinyint DEFAULT 0 COMMENT '0-login, 1-logout'")
    private int activity;

    public int getActivity() {
        return activity;
    }

    public void setActivity(int activity) {
        this.activity = activity;
    }

    @Column(nullable = false, updatable = false)
    @Temporal(TemporalType.TIMESTAMP)
    @CreatedDate
    private Date createdAt;

    public Date getCreatedAt() {
        return createdAt;
    }

    @Override
    public String toString() {
        return "UserLoginHistory {" +
                "id=" + id + "," +
                "phoneNumber=" + phoneNumber + "," +
                "username=" + username + "," +
                "ipAddress=" + ipAddress + "," +
                "activity=" + activity + "," +
                "createdAt=" + createdAt +
            "}";
    }
}