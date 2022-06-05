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

    public OpeningHours() {

    }

    //constructors
    public OpeningHours(long id, int dayOfTheWeek, String from, String until) {
        this.id = id;
        this.dayOfTheWeek = dayOfTheWeek;
        this.fromTime = from;
        this.untilTime = until;
    }

    //constructor without id
    public OpeningHours(int dayOfTheWeek, String from, String until) {
        this.dayOfTheWeek = dayOfTheWeek;
        this.fromTime = from;
        this.untilTime = until;
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


    public int getDayOfTheWeek() {
        return dayOfTheWeek;
    }

    public void setDayOfTheWeek(int NewDayOfTheWeek) {
        this.dayOfTheWeek = NewDayOfTheWeek;
    } 

    public String getFrom() {
        return fromTime;
    }

    public void setFrom(String newFrom) {
        this.fromTime = newFrom;
    }
    public String getUntil() {
        return untilTime;
    }

    public void setUntil(String newUntil) {
        this.untilTime = newUntil;
    }
}
