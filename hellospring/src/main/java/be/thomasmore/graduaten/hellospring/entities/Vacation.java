package be.thomasmore.graduaten.hellospring.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Vacation {

    //attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String fromDate;
    private String untilDate;

    public Vacation() {

    }

    //getters
    public long getId(){
        return id;
    }
    public String getFromDate(){
        return fromDate;
    }
    public String getUntilDate(){
        return untilDate;
    }

    //Setters
    //If setter for Id is never used in the application remove setter
    public void setId(long newId){
        this.id = newId;
    }
    public void setFromDate(String newFromDate){
        this.fromDate = newFromDate;
    }
    public void setUntilDate(String newUntilDate){
        this.untilDate = newUntilDate;
    }

    //constructors
    public Vacation(long id,String fromDate, String untilDate){
        this.id = id;
        this.untilDate  = untilDate;
        this.fromDate = fromDate;
    }
    //constructor without id
    public Vacation(String fromDate, String untilDate){
        this.fromDate = fromDate;
        this.untilDate = untilDate;

    }
}

