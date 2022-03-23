package be.thomasmore.hethalfkieken.repositories;

import be.thomasmore.hethalfkieken.entities.TimeSlot;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public class TimeSlotRepository extends JpaRepository<TimeSlot, Long> {
}
