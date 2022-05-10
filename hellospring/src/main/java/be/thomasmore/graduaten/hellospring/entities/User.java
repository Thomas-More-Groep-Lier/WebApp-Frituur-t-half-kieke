package be.thomasmore.graduaten.hellospring.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    //attributes
    private long id;
    private String userName;
    //find out how to hash password
    private String password;

    public User() {

    }

    //constructor
    public User(long id, String password, String userName) {
        this.id = id;
        this.password = password;
        this.userName = userName;
    }

    //getters
    public long getId() {
        return id;
    }

    //Setters
    //If setter for Id is never used in the application remove setter
    public void setId(long newId) {
        this.id = newId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String newUserName) {
        this.userName = newUserName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String newPassword) {
        this.password = newPassword;
    }


}
