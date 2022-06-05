package be.thomasmore.graduaten.hellospring.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class OpeningHours {

    //attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String fromTime;
    private String untilTime;
    private int dayOfTheWeek;



    //constructors
    public OpeningHours() {

    }
    public OpeningHours(long id, int dayOfTheWeek, String from, String until) {
        this.id = id;
        this.dayOfTheWeek = dayOfTheWeek;
        fromTime = from;
        untilTime = until;
    }

    //constructor without id
    public OpeningHours(int dayOfTheWeek, String from, String until) {
        this.dayOfTheWeek = dayOfTheWeek;
        fromTime = from;
        untilTime = until;
    }

    //getters
    public long getId() {
        return id;
    }
    public String getFrom() {
        return fromTime;
    }
    public int getDayOfTheWeek() {
        return dayOfTheWeek;
    }
    public String getUntil() {
        return untilTime;
    }

    //Setters
    //If setter for Id is never used in the application remove setter
    public void setId(long newId) {
        id = newId;
    }
    public void setFrom(String newFrom) {
        fromTime = newFrom;
    }
}
