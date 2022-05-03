package be.thomasmore.graduaten.hellospring.entities;

import org.springframework.stereotype.Repository;
import javax.persistence.*;

@Entity
public class Client {

    //attributes
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String name;
    private String phoneNumber;
    private String emailAdress;
    public Client() {

    }

    //getters
    public long getId(){
        return id;
    }
    public String getName(){
        return name;
    }
    public String getPhoneNumber(){
        return phoneNumber;
    }
    public String getEmailAdress(){
        return emailAdress;
    }
//Setters
    //If setter for Id is never used in the application remove setter
    public void setId(long newId){
        this.id = newId;
    }
    public void setName(String newName){
        this.name = newName;
    }
    public void setPhoneNumber(String newPhoneNumber){
        this.phoneNumber = newPhoneNumber;
    }
    public void setEmailAdress(String newEmailAdress){
        this.emailAdress = newEmailAdress;
    }
//constructors
    public Client(long id,String name, String phoneNumber, String emailAdress){
        this.id = id;
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.emailAdress = emailAdress;
    }
    //constructor without id
    public Client(String name, String phoneNumber, String emailAdress){
        this.name = name;
        this.phoneNumber = phoneNumber;
        this.emailAdress = emailAdress;
    }
}
