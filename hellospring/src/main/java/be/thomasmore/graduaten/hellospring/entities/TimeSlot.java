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
    private String hour;
    private Boolean isActive;
    private int maxNumberOfOrders;
    private int ordersPlaced;
    private Boolean spotAvailable;
    private String dayOfTheWeek;

    public TimeSlot() {

    }

    //constructors
    public TimeSlot(long id, Boolean isActive, int maxNumberOfOrders, int ordersPlaced, String dayOfTheWeek, String Hour) {
        this.id = id;
        this.isActive = isActive;
        this.maxNumberOfOrders = maxNumberOfOrders;
        this.ordersPlaced = ordersPlaced;
        this.dayOfTheWeek = dayOfTheWeek;
        this.hour = hour;
    }

    //constructor without id
    public TimeSlot(Boolean isActive, int maxNumberOfOrders, int ordersPlaced, String dayOfTheWeek, String Hour) {
        this.isActive = isActive;
        this.maxNumberOfOrders = maxNumberOfOrders;
        this.ordersPlaced = ordersPlaced;
        this.dayOfTheWeek = dayOfTheWeek;
        this.hour = hour;
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

    public String getDayOfTheWeek() {
        return dayOfTheWeek;
    }

    public void setDayOfTheWeek(String NewDayOfTheWeek) {
        this.dayOfTheWeek = null;
    } //newDayOfTheWeek;

    public String getHour() {
        return hour;
    }

    public void setHour(String newHour) {
        this.hour = newHour;
    }
}
