package com.mobile.web.quiz.model;

import com.mobile.web.quiz.model.admin.AdminUser;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = VerifySMS.tableName)
@EntityListeners(AuditingEntityListener.class)
public class VerifySMS implements Serializable {
    public static final String tableName = "verify_sms";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public Long getId() {
        return id;
    }

    @NotBlank
    private String phoneNumber;

    public String getPhoneNumber() {
        return phoneNumber;
    }
    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @NotBlank
    private String code;

    public String getCode() {
        return code;
    }
    public void setCode(String password) {
        this.code = password;
    }

    @Column
    private boolean expired;

    public void setExpired(boolean expired) {
        this.expired = expired;
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
        return "User {" +
                "id=" + id + "," +
                "phone=" + phoneNumber + "," +
                "code=" + code + "," +
                "created=" + createdAt +
                "}";
    }
}
