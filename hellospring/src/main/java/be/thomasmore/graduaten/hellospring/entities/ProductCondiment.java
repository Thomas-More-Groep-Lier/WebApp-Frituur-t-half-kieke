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

    //constructors
    public ProductCondiment() {

    }
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
    public Product getProduct() {
        return product;
    }
    public Condiment getCondiment() {
        return condiment;
    }


    //Setters
    public void setId(long newId) {
        id = newId;
    }
    public void setProduct(Product product) {
        this.product = product;
    }
    public void setCondiment(Condiment condiment) {
        this.condiment = condiment;
    }

}
