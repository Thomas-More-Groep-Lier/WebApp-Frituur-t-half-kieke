package be.thomasmore.hethalfkieken.repositories;

import be.thomasmore.hethalfkieken.entities.Product;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public class ProductRepository extends JpaRepository<Product, Long> {
}
