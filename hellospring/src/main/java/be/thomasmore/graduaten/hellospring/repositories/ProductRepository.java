package be.thomasmore.graduaten.hellospring.repositories;

import be.thomasmore.graduaten.hellospring.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ProductRepository extends JpaRepository<Product, Long> {
    Product findProductByDescription(String description);
    Product findProductById(long id);
    List<Product> findProductsByCategory(String category);
    List<Product> findProductsByPrice(float price);
    List<Product> findProductsByStatus(boolean status);
}

