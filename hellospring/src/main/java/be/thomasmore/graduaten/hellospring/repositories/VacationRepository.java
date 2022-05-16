package be.thomasmore.graduaten.hellospring.repositories;


import be.thomasmore.graduaten.hellospring.entities.Vacation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface VacationRepository extends JpaRepository<Vacation, Long> {

    Vacation findVacationById(long id);
    Vacation findVacationByFromDate(String fromDate);
    Vacation findVacationByUntilDate(String untilDate);

}



