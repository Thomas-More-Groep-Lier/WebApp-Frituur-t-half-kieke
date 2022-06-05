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
    private Boolean status;
    private Boolean isDeleted;

    //constructors
    public Product() {

    }
    public Product(long id, String description, float price, String category) {
        this.id = id;
        this.description = description;
        this.price = price;
        this.category = category;
        status = true;
        isDeleted = false;
    }

    //constructor without Id
    public Product(String description, float price, String category) {
        this.description = description;
        this.price = price;
        this.category = category;
        status = true;
        isDeleted = false;
    }

    //getters
    public long getId() {
        return id;
    }
    public String getCategory() {
        return category;
    }
    public String getDescription() {
        return description;
    }
    public boolean getStatus(){
        return status;
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
    public void setCategory(String newCategory) {
        category = newCategory;
    }
    public void setStatus(boolean newStatus){
        status = newStatus;
    }
    public void setPrice(float newPrice) {
        price = newPrice;
    }
    public void setIsDeleted(boolean newIsDeleted) {
        isDeleted = newIsDeleted;
    }

}
