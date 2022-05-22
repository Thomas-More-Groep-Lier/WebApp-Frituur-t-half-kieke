package be.thomasmore.graduaten.hellospring.controllers;

import be.thomasmore.graduaten.hellospring.entities.TimeSlot;
import be.thomasmore.graduaten.hellospring.entities.Vacation;
import be.thomasmore.graduaten.hellospring.repositories.TimeSlotRepository;

import be.thomasmore.graduaten.hellospring.repositories.VacationRepository;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.stream.Collectors;

import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class MainController {
    private final VacationRepository vacationRepository;
    private final TimeSlotRepository timeSlotRepository;
    public MainController(VacationRepository vacationRepository, TimeSlotRepository timeSlotRepository) {
        this.vacationRepository = vacationRepository;
        this.timeSlotRepository = timeSlotRepository;

    }
    @RequestMapping("/")
    public String navigateToIndex(Model index) {
        Boolean open = isOpen();
        if (isInVacation() || !open) {

            index.addAttribute("pageTitle", "Sorry, we zijn momenteel gesloten ... ");
            return "Client/Closed";
        } else {
            index.addAttribute("pageTitle", "Welkom bij frituur t'half kieke! ");
            return "index";
        }
    }
    public Boolean isOpen(){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm");
        LocalDateTime now = LocalDateTime.now();
        String current = dtf.format(now);
        int hours = Integer.parseInt(current.substring(0, 2));
        int minutes = roundMinutes(Integer.parseInt(current.substring(3)));
        DayOfWeek weekday = now.getDayOfWeek();
        long timeSlotId = getTimeSlotId(weekday, hours, minutes);
        TimeSlot timeSlot = timeSlotRepository.getById(timeSlotId);
        return timeSlot.getIsActive();
    }
    public long getTimeSlotId(DayOfWeek weekday, int hours, int minutes) {
        long timeSlotId = (hours - 10) * 4;
        if (minutes == 15) {
            timeSlotId = timeSlotId + 1;
        } else if (minutes == 30) {
            timeSlotId = timeSlotId + 2;
        } else if (minutes == 45) {
            timeSlotId = timeSlotId + 3;
        }
        switch (weekday) {
            case MONDAY:
                return timeSlotId;
            case TUESDAY:
                return timeSlotId + 57;
            case WEDNESDAY:
                return timeSlotId + 113;
            case THURSDAY:
                return timeSlotId + 169;
            case FRIDAY:
                return timeSlotId + 225;
            case SATURDAY:
                return timeSlotId + 281;
            case SUNDAY:
            return      timeSlotId + 337;
            default: return timeSlotId;
        }
    }
    public int roundMinutes(int minutes){
         if (minutes >= 0 && minutes <= 7 )
        {
            return  0;
        }
        else if (minutes >= 8 && minutes <= 22 )
        {
            return  15;
        }
        else if (minutes >= 23 && minutes <= 37 )
        {
            return  30;
        }
        else if (minutes >= 38 && minutes <= 52 )
        {
            return  45;
        }
        else {
            return  60;
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
        return planned.size() > 0;
    }
    public Boolean between(Date today, Date fromDate, Date endDate) {
        if (today != null && fromDate != null && endDate != null) {
            return today.after(fromDate) && today.before(endDate);
        }
        return false;
    }

}