package be.thomasmore.graduaten.hellospring.entities;

public class Product {
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
        this.id = newId;
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
