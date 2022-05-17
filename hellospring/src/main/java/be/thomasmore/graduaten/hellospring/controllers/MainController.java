package be.thomasmore.graduaten.hellospring.controllers;

import be.thomasmore.graduaten.hellospring.entities.Vacation;
import be.thomasmore.graduaten.hellospring.repositories.ProductRepository;
import be.thomasmore.graduaten.hellospring.repositories.VacationRepository;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class MainController {
    private final VacationRepository vacationRepository;

    public MainController(VacationRepository vacationRepository) {
        this.vacationRepository = vacationRepository;

    }

    @RequestMapping("/")
    public String navigateToIndex(Model index) {
        if (isInVacation()) {
            index.addAttribute("pageTitle", "Sorry, we zijn momenteel gesloten ... ");
            return "Client/Closed";
        } else {
            index.addAttribute("pageTitle", "Welkom bij frituur t'half kieke! ");
            return "index";
        }

    }

    public Boolean isInVacation() {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        List<Vacation> planned = vacationRepository.findAll().stream().filter(vac -> {
            try {
                return between(new Date(), sdf.parse(vac.getFromDate()), sdf.parse(vac.getUntilDate()));
            } catch (ParseException e1) {
                // TODO Auto-generated catch block
                e1.printStackTrace();
            }
            return false;
        }).collect(Collectors.toList());
        if (planned.size() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public Boolean between(Date today, Date fromDate, Date endDate) {
        if (today != null && fromDate != null && endDate != null) {
            if (today.after(fromDate) && today.before(endDate)) {
                return true;
            } else {
                return false;
            }
        }
        return false;
    }
}