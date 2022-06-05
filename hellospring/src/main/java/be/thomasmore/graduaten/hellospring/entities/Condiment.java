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
    private boolean isDeleted;

      //constructors
      public Condiment() {

      }
    public Condiment(long id, String description, float price) {
        this.id = id;
        this.description = description;
        this.price = price;
        isDeleted = false;
    }

    //constructor without Id
    public Condiment(String description, float price) {
        this.description = description;
        this.price = price;
        isDeleted = false;
    }

    //getters
    public long getId() {
        return id;
    }
    public String getDescription() {
        return description;
    }
    public float getPrice() {
        return price;
    }
    public boolean getIsDeleted() {
        return isDeleted;
    }


    //Setters
    //If setter for Id is never used in the application remove setter
    public void setId(long newId) {
        id = newId;
    }
    public void setDescription(String newDescription) {
        description = newDescription;
    }
    public void setPrice(float newPrice) {
        price = newPrice;
    }
    public void setIsDeleted(boolean newIsDeleted) {
        isDeleted = newIsDeleted;
    }

}
