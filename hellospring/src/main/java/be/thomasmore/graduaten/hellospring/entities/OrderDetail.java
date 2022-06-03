package be.thomasmore.graduaten.hellospring.entities;

import javax.persistence.*;
import java.util.List;

@Entity
public class OrderDetail {
    //attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private long numberOfProducts;

    @ManyToOne
    @JoinColumn(name = "productId")
    private Product product;

    @ManyToOne
    @JoinColumn(name = "orderId")
    private Order order;

    @ManyToOne
    @JoinColumn(name = "condimentId")
    private Condiment condiment;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Condiment getCondiment() {
        return condiment;
    }

    public void setProduct(Condiment condiment) {
        this.condiment = condiment;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public OrderDetail() {

    }

    //constructors
    public OrderDetail(long id, Product product, Order order, long numberOfProducts, Condiment condiment) 
    {
        this.id = id;
        this.order = order;
        this.product = product;
        this.numberOfProducts = numberOfProducts;
        this.condiment = condiment;
    }

    //constructor without id
    public OrderDetail(Product product, Order order, long numberOfProducts, Condiment condiment) 
    {
        this.order = order;
        this.product = product;
        this.numberOfProducts = numberOfProducts;
        this.condiment = condiment;
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

    public long getNumberOfProducts() {
        return numberOfProducts;
    }

    public void setNumberOfProducts(long newNumberOfProducts) {
        this.numberOfProducts = newNumberOfProducts;
    }

}
