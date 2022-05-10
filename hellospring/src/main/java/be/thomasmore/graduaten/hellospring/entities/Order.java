package be.thomasmore.graduaten.hellospring.entities;

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
    private String status;

    public Order() {

    }

    //constructors
    public Order(long id, long clientId, String orderDate, String wantedRetrievalTime, Boolean orderToBig, String status) {
        this.id = id;
        this.clientId = clientId;
        this.orderDate = orderDate;
        this.wantedRetrievalTime = wantedRetrievalTime;
        this.orderToBig = orderToBig;
        this.status = status;

    }

    //constructor without id
    public Order(long clientId, String orderDate, String wantedRetrievalTime, Boolean orderToBig, String status) {
        this.clientId = clientId;
        this.orderDate = orderDate;
        this.wantedRetrievalTime = wantedRetrievalTime;
        this.orderToBig = orderToBig;
        this.status = status;

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

    public long getClientId() {
        return clientId;
    }

    public void setClientId(long newClientId) {
        this.clientId = newClientId;
    }

    public long getTimeSlotId() {
        return timeSlotId;
    }

    public void setTimeSlotId(long newTimeSlotId) {
        this.timeSlotId = newTimeSlotId;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String newOrderDate) {
        this.orderDate = newOrderDate;
    }

    public String getWantedRetrievalTime() {
        return wantedRetrievalTime;
    }

    public void setWantedRetrievalTime(String wantedRetrievalTime) {
        this.wantedRetrievalTime = wantedRetrievalTime;
    }

    public Boolean getOrderToBig() {
        return null;
        // return OrderToBig;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String newStatus) {
        this.status = newStatus;
    }

    public void setOrderToBig() {
        orderToBig = !orderToBig;
    }
}
