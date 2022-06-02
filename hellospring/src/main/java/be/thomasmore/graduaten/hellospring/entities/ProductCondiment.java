package be.thomasmore.graduaten.hellospring.entities;

import javax.persistence.*;

@Entity
public class ProductCondiment {
    //attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ManyToOne
    @JoinColumn(name = "productId")
    private Product product;

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

    public void setCondiment(Condiment condiment) {
        this.condiment = condiment;
    }

    public ProductCondiment() {

    }

    //constructors
    public ProductCondiment(long id, Product product, Condiment condiment) {
        this.id = id;
        this.condiment = condiment;
        this.product = product;
    }

    //constructor without id
    public ProductCondiment(Product product, Condiment condiment) {
        this.condiment = condiment;
        this.product = product;
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

}
