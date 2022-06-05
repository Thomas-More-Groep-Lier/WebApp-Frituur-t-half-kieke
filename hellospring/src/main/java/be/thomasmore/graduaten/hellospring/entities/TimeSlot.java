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
    private int dayOfTheWeek;
    private String fromTime;
    private String until;

    //constructors
    public TimeSlot() {

    }
    public TimeSlot(long id, Boolean isActive, int maxNumberOfOrders, int ordersPlaced, int dayOfTheWeek, String from, String until) {
        this.id = id;
        this.isActive = isActive;
        this.maxNumberOfOrders = maxNumberOfOrders;
        this.ordersPlaced = ordersPlaced;
        this.dayOfTheWeek = dayOfTheWeek;
        fromTime = from;
        this.until = until;
    }

    //constructor without id
    public TimeSlot(Boolean isActive, int maxNumberOfOrders, int ordersPlaced, int dayOfTheWeek, String from, String until) {
        this.isActive = isActive;
        this.maxNumberOfOrders = maxNumberOfOrders;
        this.ordersPlaced = ordersPlaced;
        this.dayOfTheWeek = dayOfTheWeek;
        fromTime = from;
        this.until = until;
    }

    //getters
    public long getId() {
        return id;
    }
    public Boolean getIsActive() {
        return isActive;
    }
    public Boolean getSpotAvailable() {
        return ordersPlaced <= maxNumberOfOrders;
    }
    public int getMaxNumberOfOrders() {
        return maxNumberOfOrders;
    }
    public int getOrdersPlaced() {
        return ordersPlaced;
    }
    public int getDayOfTheWeek() {
        return dayOfTheWeek;
    }
    public String getFrom() {
        return fromTime;
    }
    public String getUntil() {
        return until;
    }

    //Setters
    public void setId(long newId) {
        id = newId;
    }
    public void setIsActive(Boolean newIsActive) {
        isActive = newIsActive;
    }
    public void setMaxNumberOfOrders(int newMaxNumberOfOrders) {
        maxNumberOfOrders = newMaxNumberOfOrders;
    }
    public void setOrdersPlaced(int newOrdersPlaced) {
        ordersPlaced = newOrdersPlaced;
    }
    public void setFrom(String newFrom) {
        fromTime = newFrom;
    }


}
