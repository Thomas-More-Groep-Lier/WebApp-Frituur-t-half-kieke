package be.thomasmore.graduaten.hellospring.entities;

import org.springframework.stereotype.Repository;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Order {
//Attributes
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long clientId;
    private long timeSlotId;
    //find out how to use date variables seems to be a bit more complicated then c#
    private String orderDate;
    private String wantedRetrievalTime;
    private Boolean orderToBig;

    public Order() {

    }

    //getters
    public long getId(){
        return id;
    }
    public long getClientId(){
        return clientId;
    }
    public long getTimeSlotId(){return timeSlotId;}
    public String getOrderDate(){
        return orderDate;
    }
    public String getWantedRetrievalTime(){
        return wantedRetrievalTime;
    }
    public Boolean getOrderToBig() {
        return null;
       // return OrderToBig;
    }
//Setters
    //If setter for Id is never used in the application remove setter
    public void setId(long newId){
        this.id = newId;
    }
    public void setClientId(long newClientId){
        this.clientId = newClientId;
    }
    public void setTimeSlotId(long newTimeSlotId){this.timeSlotId = newTimeSlotId;}
    public void setOrderDate(String newOrderDate){
        this.orderDate = newOrderDate;
    }
    public void setWantedRetrievalTime(String wantedRetrievalTime) {
        this.wantedRetrievalTime = wantedRetrievalTime;
    }
    public void setOrderToBig() {
        if(orderToBig){
            orderToBig = false;
        }
        else{
            orderToBig = true;
        }
    }
//constructors
    public Order(long id, long clientId, String orderDate, String wantedRetrievalTime, Boolean orderToBig){
        this.id = id;
        this.clientId = clientId;
        this.orderDate = orderDate;
        this.wantedRetrievalTime = wantedRetrievalTime;
        this.orderToBig = orderToBig;

    }
    //constructor without id
    public Order(long clientId, String orderDate, String wantedRetrievalTime, Boolean orderToBig){
        this.clientId = clientId;
        this.orderDate = orderDate;
        this.wantedRetrievalTime = wantedRetrievalTime;
        this.orderToBig = orderToBig;

    }
}
