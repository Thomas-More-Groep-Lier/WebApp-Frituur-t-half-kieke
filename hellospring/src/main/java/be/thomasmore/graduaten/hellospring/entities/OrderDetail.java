package be.thomasmore.graduaten.hellospring.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class OrderDetail {
    //attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long productId;
    private long orderId;
    private long numberOfProducts;

    public OrderDetail() {

    }

    //constructors
    public OrderDetail(long id, long productId, long orderId, long numberOfProducts) {
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.numberOfProducts = numberOfProducts;
    }

    //constructor without id
    public OrderDetail(long productId, long orderId, long numberOfProducts) {
        this.orderId = orderId;
        this.productId = productId;
        this.numberOfProducts = numberOfProducts;
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

    public long getOrderId() {
        return orderId;
    }

    public void setOrderId(long newOrderId) {
        this.orderId = newOrderId;
    }

    public long getProductId() {
        return productId;
    }

    public void setProductId(long newProductId) {
        this.productId = newProductId;
    }

    public long getNumberOfProducts() {
        return numberOfProducts;
    }

    public void setNumberOfProducts(long newNumberOfProducts) {
        this.numberOfProducts = newNumberOfProducts;
    }
}
