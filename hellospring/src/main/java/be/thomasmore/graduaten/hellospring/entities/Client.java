package be.thomasmore.graduaten.hellospring.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Client {

    //attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String firstName;
    private String lastName;
    private String phoneNumber;
    private String emailAdress;

    //constructors
    public Client() {

    }
    public Client(long id, String firstName, String lastName, String phoneNumber, String emailAdress) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.emailAdress = emailAdress;
    }

    //constructor without id
    public Client(String firstName, String lastName, String phoneNumber, String emailAdress) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.phoneNumber = phoneNumber;
        this.emailAdress = emailAdress;
    }

    //getters
    public long getId() {
        return id;
    }
    public String getFirstName() {
        return firstName;
    }
    public String getEmailAdress() {
        return emailAdress;
    }
    public String getPhoneNumber() {
        return phoneNumber;
    }


    //Setters
    public void setId(long newId) {
        id = newId;
    }

}
