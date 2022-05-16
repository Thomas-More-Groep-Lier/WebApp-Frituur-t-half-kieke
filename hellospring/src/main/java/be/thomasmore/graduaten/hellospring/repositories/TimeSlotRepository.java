package be.thomasmore.graduaten.hellospring.repositories;

import be.thomasmore.graduaten.hellospring.entities.TimeSlot;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TimeSlotRepository extends JpaRepository<TimeSlot, Long> {
    TimeSlot findTimeSlotById(long id);
    TimeSlot findTimeslotByHour(String hour);
    List<TimeSlot> findTimeslotsByIsActive(boolean isActive);
    List<TimeSlot> findTimeslotsByDayOfTheWeek(String dayOfTheWeek);
}

