package be.thomasmore.hethalfkieken.repositories;

import be.thomasmore.hethalfkieken.entities.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
}
