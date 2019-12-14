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
@Table(name = Group.tableName)
@EntityListeners(AuditingEntityListener.class)
public class Group implements Serializable {
    public static final String tableName = "groups";

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public Long getId() {
        return id;
    }

    @NotBlank
    private String title;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Column(nullable = false, columnDefinition = "VARCHAR(255) DEFAULT ''")
    private String logoUrl;

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }


    @Column(nullable = false)
    private int status;

    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }

    @ManyToMany(cascade = CascadeType.ALL)
    @JoinTable(name = "group_user",
            joinColumns = @JoinColumn(name = "user_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "group_id",
                    referencedColumnName = "id"))
    private List<User> users;

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

    @Override
    public String toString() {
        return "Group {" +
                "id=" + id + "," +
                "title=" + title + "," +
                "logoUrl=" + logoUrl + "," +
                "status=" + status +
                "}";
    }
}