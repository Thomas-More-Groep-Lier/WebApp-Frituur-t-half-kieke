package be.thomasmore.graduaten.hellospring.repositories;

import be.thomasmore.graduaten.hellospring.entities.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {
}

