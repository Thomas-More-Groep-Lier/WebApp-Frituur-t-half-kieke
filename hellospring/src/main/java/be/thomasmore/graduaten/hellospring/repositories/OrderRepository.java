package be.thomasmore.graduaten.hellospring.repositories;

import be.thomasmore.graduaten.hellospring.entities.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Long> {

    Order findOrderById(long id);
    List<Order> findOrdersByOrderDate(String orderDate);
    List<Order> findOrdersByClientId(long clientId);
    List<Order> findOrdersByTimeSlotId(long timeSlotId);
    List<Order> findOrdersByStatus(String status);
}

