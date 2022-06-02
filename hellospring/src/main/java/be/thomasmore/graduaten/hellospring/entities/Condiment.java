package be.thomasmore.graduaten.hellospring.entities;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Condiment {
    //attributes
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String description;
    private float price;

    public Condiment() {

    }

    //constructors
    public Condiment(long id, String description, float price) {
        this.id = id;
        this.description = description;
        this.price = price;

    }

    //constructor without Id
    public Condiment(String description, float price) {
        this.description = description;
        this.price = price;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float newPrice) {
        this.price = newPrice;
    }

    public long getSold(long numberOfProducts){return numberOfProducts;}
    public long getRevenue(long numberOfProducts){return (long) (price * numberOfProducts);}



}
