package be.thomasmore.graduaten.hellospring.entities;

public class TimeSlot {

//attributes
    private long id;
    private String hour;
    private Boolean isActive;
    private int maxNumberOfOrders;
    private int ordersPlaced;
    private Boolean spotAvailable;
    private String dayOfTheWeek;
//getters
    public long getId(){
        return id;
    }
    public Boolean getIsActive() {
        return isActive;
    }
    public Boolean getSpotAvailable() {
        if (ordersPlaced == maxNumberOfOrders){ return false;}
        else{ return true;}
    }
    public int getMaxNumberOfOrders() {
        return maxNumberOfOrders;
    }
    public int getOrdersPlaced() {
        return ordersPlaced;
    }
    public String getDayOfTheWeek() {
        return dayOfTheWeek;
    }
    public String getHour() {
        return hour;
    }
//Setters
    //If setter for Id is never used in the application remove setter
    public void setId(long newId){
        this.id = newId;
    }
    public void setDayOfTheWeek(String NewDayOfTheWeek) {
        this.dayOfTheWeek = null; } //newDayOfTheWeek;
    public void setHour(String newHour) {
        this.hour = newHour;
    }
    public void setIsActive(Boolean newIsActive) {
        this.isActive = newIsActive;
    }
    public void setMaxNumberOfOrders(int newMaxNumberOfOrders) {
        this.maxNumberOfOrders = newMaxNumberOfOrders;
    }
    public void setOrdersPlaced(int newOrdersPlaced) {
        this.ordersPlaced = newOrdersPlaced;
    }
//constructors
    public TimeSlot(long id, Boolean isActive, int maxNumberOfOrders, int ordersPlaced, String dayOfTheWeek, String Hour){
        this.id = id;
        this.isActive = isActive;
        this.maxNumberOfOrders = maxNumberOfOrders;
        this.ordersPlaced = ordersPlaced;
        this.dayOfTheWeek = dayOfTheWeek;
        this.hour = hour;
    }
    //constructor without id
    public TimeSlot(Boolean isActive, int maxNumberOfOrders, int ordersPlaced, String dayOfTheWeek, String Hour){
        this.isActive = isActive;
        this.maxNumberOfOrders = maxNumberOfOrders;
        this.ordersPlaced = ordersPlaced;
        this.dayOfTheWeek = dayOfTheWeek;
        this.hour = hour;
    }
}
