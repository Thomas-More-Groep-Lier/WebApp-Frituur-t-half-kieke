package be.thomasmore.graduaten.hellospring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {

    @RequestMapping("/Admin/AdminDashboard")
    public String navigateToIndex(){
        return "Admin/AdminDashboardView";
    }

    @RequestMapping("/Admin/AdminOrder")
    public String navigateToAdminOrderView(){

        return "Admin/AdminOrderView";
    }

    @RequestMapping("/Admin/AdminProduct")
    public String navigateToAdminProductView(){
        return "Admin/AdminProductView";
    }

    @RequestMapping("/Admin/AdminTimeSlots")
    public String navigateToAdminTimeSlotsView(){
        return "Admin/AdminTimeSlotsView";
    }

}
