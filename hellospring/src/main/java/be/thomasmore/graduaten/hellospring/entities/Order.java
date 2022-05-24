package be.thomasmore.graduaten.hellospring.entities;
import javax.persistence.*;

@Entity
@Table(name = "ORDERTABLE")
public class Order {
    //Attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
 //   private long clientId;
 //   private long timeSlotId;
    private String orderDate;
    private String wantedRetrievalTime;
    private Boolean orderToBig;
    private String status;

    @ManyToOne
    @JoinColumn(name = "timeSlotId")
    private TimeSlot timeSlot;

    @ManyToOne
    @JoinColumn(name = "clientId")
    private Client client;

    public TimeSlot getTimeSlot() {
        return timeSlot;
    }

    public void setTimeSlot(TimeSlot timeSlot) {
        this.timeSlot = timeSlot;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Order() {

    }

    //constructors
    public Order(long id, Client client, String orderDate, Boolean orderToBig, String status, TimeSlot timeSlot,  String wantedRetrievalTime ) {
        this.id = id;
        this.timeSlot = timeSlot;
        this.client = client;
        this.orderDate = orderDate;
        this.wantedRetrievalTime = wantedRetrievalTime;
        this.orderToBig = orderToBig;
        this.status = status;

    }
    //constructor without id
    public Order(Client client, String orderDate, Boolean orderToBig, String status, TimeSlot timeSlot,  String wantedRetrievalTime  ) {
        this.client = client;
        this.timeSlot = timeSlot;
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
