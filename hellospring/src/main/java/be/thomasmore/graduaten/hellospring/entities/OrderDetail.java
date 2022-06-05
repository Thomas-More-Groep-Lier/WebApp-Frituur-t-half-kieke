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

    //constructors
    public OrderDetail() {

    }
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
    public Product getProduct() {
        return product;
    }
    public Condiment getCondiment() {
        return condiment;
    }
    public Order getOrder() {
        return order;
    }




    //Setters
    //If setter for Id is never used in the application remove setter
    public void setId(long newId) {
        id = newId;
    }
    public long getNumberOfProducts() {
        return numberOfProducts;
    }
    public void setProduct(Product product) {
        this.product = product;
    }
    public void setProduct(Condiment condiment) {
        this.condiment = condiment;
    }

}
