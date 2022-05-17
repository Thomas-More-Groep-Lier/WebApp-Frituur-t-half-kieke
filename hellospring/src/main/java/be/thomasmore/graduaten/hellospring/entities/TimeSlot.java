package be.thomasmore.graduaten.hellospring.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TimeSlot {

    //attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private Boolean isActive;
    private int maxNumberOfOrders;
    private int ordersPlaced;
    private Boolean spotAvailable;
    private int dayOfTheWeek;
    private String fromTime;
    private String until;

    public TimeSlot() {

    }

    //constructors
    public TimeSlot(long id, Boolean isActive, Boolean spotAvailable, int maxNumberOfOrders, int ordersPlaced, int dayOfTheWeek, String from, String until) {
        this.id = id;
        this.isActive = isActive;
        this.spotAvailable = spotAvailable;
        this.maxNumberOfOrders = maxNumberOfOrders;
        this.ordersPlaced = ordersPlaced;
        this.dayOfTheWeek = dayOfTheWeek;
        this.fromTime = from;
        this.until = until;
    }

    //constructor without id
    public TimeSlot(Boolean isActive, Boolean spotAvailable, int maxNumberOfOrders, int ordersPlaced, int dayOfTheWeek, String from, String until) {
        this.isActive = isActive;
        this.spotAvailable = spotAvailable;
        this.maxNumberOfOrders = maxNumberOfOrders;
        this.ordersPlaced = ordersPlaced;
        this.dayOfTheWeek = dayOfTheWeek;
        this.fromTime = from;
        this.until = until;
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

    public Boolean getIsActive() {
        return isActive;
    }

    public void setIsActive(Boolean newIsActive) {
        this.isActive = newIsActive;
    }

    public Boolean getSpotAvailable() {
        return ordersPlaced != maxNumberOfOrders;
    }

    public int getMaxNumberOfOrders() {
        return maxNumberOfOrders;
    }

    public void setMaxNumberOfOrders(int newMaxNumberOfOrders) {
        this.maxNumberOfOrders = newMaxNumberOfOrders;
    }

    public int getOrdersPlaced() {
        return ordersPlaced;
    }

    public void setOrdersPlaced(int newOrdersPlaced) {
        this.ordersPlaced = newOrdersPlaced;
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
        return until;
    }

    public void setUntil(String newUntil) {
        this.until = newUntil;
    }
}
