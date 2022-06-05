package be.thomasmore.graduaten.hellospring.entities;
import javax.persistence.*;

@Entity
@Table(name = "ORDERTABLE")
public class Order {
    //Attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String orderDate;
    private String wantedRetrievalTime;
    private String status;

    @ManyToOne
    @JoinColumn(name = "timeSlotId")
    private TimeSlot timeSlot;

    @ManyToOne
    @JoinColumn(name = "clientId")
    private Client client;


    //constructors
    public Order() {

    }
    public Order(long id, Client client, String orderDate, String status, TimeSlot timeSlot,  String wantedRetrievalTime ) {
        this.id = id;
        this.timeSlot = timeSlot;
        this.client = client;
        this.orderDate = orderDate;
        this.wantedRetrievalTime = wantedRetrievalTime;
        this.status = status;

    }
    //constructor without id
    public Order(Client client, String orderDate, String status, TimeSlot timeSlot,  String wantedRetrievalTime  ) {
        this.client = client;
        this.timeSlot = timeSlot;
        this.orderDate = orderDate;
        this.wantedRetrievalTime = wantedRetrievalTime;
        this.status = status;

    }

    //getters
    public long getId() {
        return id;
    }
    public String getOrderDate() {
        return orderDate;
    }
    public String getWantedRetrievalTime() {
        return wantedRetrievalTime;
    }
    public String getStatus() {
        return status;
    }
    public Client getClient() {
        return client;
    }

    //Setters
    public void setId(long newId) {
        id = newId;
    }
    public void setStatus(String newStatus) {
        status = newStatus;
    }
    public void setClient(Client client) {
        this.client = client;
    }

}
