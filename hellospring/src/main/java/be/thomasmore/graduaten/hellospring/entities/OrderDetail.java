package be.thomasmore.graduaten.hellospring.entities;

public class OrderDetail {
//attributes
    private long id;
    private long productId;
    private long orderId;
    private long numberOfProducts;
//getters
    public long getId(){
        return id;
    }
    public long getOrderId(){
        return orderId;
    }
    public long getProductId() {
        return productId;
    }
    public long getNumberOfProducts() {
        return numberOfProducts;
    }
//Setters
    //If setter for Id is never used in the application remove setter
    public void setId(long newId){
        this.id = newId;
    }
    public void setOrderId(long newOrderId) {
        this.orderId = newOrderId;
    }
    public void setNumberOfProducts(long newNumberOfProducts) {
        this.numberOfProducts = newNumberOfProducts;
    }
    public void setProductId(long newProductId) {
        this.productId = newProductId;
    }
//constructors
    public OrderDetail(long id, long productId, long orderId, long numberOfProducts){
        this.id = id;
        this.orderId = orderId;
        this.productId = productId;
        this.numberOfProducts = numberOfProducts;
    }
    //constructor without id
    public OrderDetail(long productId, long orderId, long numberOfProducts){
        this.orderId = orderId;
        this.productId = productId;
        this.numberOfProducts = numberOfProducts;
    }
}
