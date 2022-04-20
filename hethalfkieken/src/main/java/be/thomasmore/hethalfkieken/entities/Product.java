package be.thomasmore.hethalfkieken.entities;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
//attributes
    private long id;
    private String description;
    private float price;
//getters
    public long getId(){
        return id;
    }
    public String getDescription(){return description;}
    public float getPrice() {
        return price;
    }
//Setters
    //If setter for Id is never used in the application remove setter
    public void setId(long newId){
        this.id = newId
    }
    public void setDescription(String newDescription) {
        this.description = newDescription;
    }
    public void setPrice(float newPrice) {
        this.price = newPrice;
    }
//constructors
    public Product(long id, String description, float price){
        this.id = id;
        this.description = description;
        this. price = price;
    }
    //constructor without Id
    public Product(String description, float price){
        this.description = description;
        this. price = price;
    }
}
