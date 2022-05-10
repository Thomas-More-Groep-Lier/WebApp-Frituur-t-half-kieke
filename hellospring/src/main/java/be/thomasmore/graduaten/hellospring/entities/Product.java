package be.thomasmore.graduaten.hellospring.entities;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Product {
    //attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String description;
    private float price;
    private String category;

    public Product() {

    }

    //constructors
    public Product(long id, String description, float price, String category) {
        this.id = id;
        this.description = description;
        this.price = price;
        this.category = category;
    }

    //constructor without Id
    public Product(String description, float price, String category) {
        this.description = description;
        this.price = price;
        this.category = category;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String newDescription) {
        this.description = newDescription;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String newCategory) {
        this.category = newCategory;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float newPrice) {
        this.price = newPrice;
    }
}
