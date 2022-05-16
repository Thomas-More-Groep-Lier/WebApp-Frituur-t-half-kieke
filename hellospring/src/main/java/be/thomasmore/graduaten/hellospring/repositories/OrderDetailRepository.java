package be.thomasmore.graduaten.hellospring.repositories;

import be.thomasmore.graduaten.hellospring.entities.OrderDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDetailRepository extends JpaRepository<OrderDetail, Long> {

    OrderDetail findOrderDetailById(long id);
    List<OrderDetail> findOrderDetailsByOrderId(long orderId);
    List<OrderDetail> findOrderDetailsByProductId(long productId);
}

