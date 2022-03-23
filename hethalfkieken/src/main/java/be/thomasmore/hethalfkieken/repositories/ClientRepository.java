package be.thomasmore.hethalfkieken.repositories;
import be.thomasmore.hethalfkieken.entities.Client;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public class ClientRepository extends JpaRepository<Client, Long> {
}
