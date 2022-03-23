package be.thomasmore.hethalfkieken.repositories;

import be.thomasmore.hethalfkieken.entities.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import javax.swing.*;
import java.util.List;

@Repository
public class UserRepository extends JpaRepository<User, Long> {
    @Override
    public List<User> findAll() {
        return null;
    }
}
