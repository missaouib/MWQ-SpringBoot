package com.mobile.web.quiz.model;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = Post.tableName)
@EntityListeners(AuditingEntityListener.class)
public class Post implements Serializable {
    public static final String tableName = "posts";

    public static final int ACTIVE = 1;
    public static final int INACTIVE = 0;
    public static final int PENDING = 2;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    public Long getId() {
        return id;
    }

    @NotBlank
    private String message;

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Column(nullable = false, columnDefinition = "VARCHAR(2048) DEFAULT ''")
    private String imageUrls;

    public String[] getImageUrls() {
        return imageUrls.isEmpty() ? new String[] {} : imageUrls.split("@");
    }

    public void setImageUrls(String imageUrls) {
        this.imageUrls = imageUrls;
    }


    @Column(nullable = false)
    private int status;

    public int getStatus() {
        return status;
    }
    public void setStatus(int status) {
        this.status = status;
    }

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @ManyToOne(fetch = FetchType.LAZY, cascade = CascadeType.PERSIST, optional = false)
    @JoinColumn(name = "group_id", nullable = false)
    private Group group;

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    @OneToMany(mappedBy = "post", cascade = CascadeType.ALL)
    private List<Comment> comments;

    public List<Comment> getComments() {
        return comments;
    }

    public void setComments(List<Comment> comments) {
        this.comments = comments;
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
        return "Post {" +
                "id=" + id + "," +
                "message=" + message + "," +
                "imageUrls=" + imageUrls + "," +
                "status=" + status +
                "}";
    }
}