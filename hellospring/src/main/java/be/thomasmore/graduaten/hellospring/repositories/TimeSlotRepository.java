package be.thomasmore.graduaten.hellospring.repositories;

import be.thomasmore.graduaten.hellospring.entities.TimeSlot;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
public interface TimeSlotRepository extends JpaRepository<TimeSlot, Long> {
}

