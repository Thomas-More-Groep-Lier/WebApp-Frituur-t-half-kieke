package be.thomasmore.graduaten.hellospring.controllers;

import be.thomasmore.graduaten.hellospring.entities.Product;
import be.thomasmore.graduaten.hellospring.repositories.ProductRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AdminController {

    private ProductRepository productRepository;

    public AdminController(ProductRepository productRepository){
        this.productRepository = productRepository;
    }

    @RequestMapping("/Login")
    public String navigateToLoginOrderView(Model login){
        login.addAttribute("pageTitle", "Login");
        return "Admin/AdminLoginView"; }

    @RequestMapping("/Admin/Dashboard")
    public String navigateToIndex(Model dashboard){
        dashboard.addAttribute("pageTitle", "Dashboard");
        dashboard.addAttribute("nrOfOpenOrders", 5);
        dashboard.addAttribute("nrOfOrdersReadyToPickUp", 1);
        dashboard.addAttribute("totalNrOfOrdersReady", 20);
        return "Admin/AdminDashboardView";
    }

    @RequestMapping("/Admin/Orders")
    public String navigateToAdminOrderView(Model orders){
        orders.addAttribute("pageTitle", "Orders");
        return "Admin/AdminOrderView"; }

    @RequestMapping("/Admin/Products")
    public String navigateToAdminProductView(Model products){
        List<Product> allProducts = (List<Product>) productRepository.findAll()
                .stream()
                //.filter(p -> p.getCategory() != "Frieten")
                .collect(Collectors.toList());
        products.addAttribute("pageTitle", "Producten");
        products.addAttribute("allProducts",allProducts );
        return "Admin/AdminProductView";
    }

    @RequestMapping("/Admin/TimeSlots")
    public String navigateToAdminTimeSlotsView(Model timeSlots){
        timeSlots.addAttribute("pageTitle", "Time slots");
        return "Admin/AdminTimeSlotsView";
    }

    @RequestMapping("/Admin/Settings")
    public String navigateToAdminSettingsView(Model settings){
        settings.addAttribute("pageTitle", "Orders");
        settings.addAttribute("shopStatus", false);
        settings.addAttribute("logo", "/images/u101.png");
        return "Admin/AdminSettingsView";
    }
}
