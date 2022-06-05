package be.thomasmore.graduaten.hellospring.repositories;

import be.thomasmore.graduaten.hellospring.entities.OpeningHours;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OpeninghoursRepository extends JpaRepository<OpeningHours, Long> {
    List<OpeningHours> findAllByOrderByDayOfTheWeekAsc();
}

