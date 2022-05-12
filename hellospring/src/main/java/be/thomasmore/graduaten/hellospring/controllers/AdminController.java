package be.thomasmore.graduaten.hellospring.controllers;

import be.thomasmore.graduaten.hellospring.entities.Product;
import be.thomasmore.graduaten.hellospring.repositories.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import static java.lang.Long.parseLong;

@Controller
public class AdminController {

    private final ProductRepository productRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final OrderRepository orderRepository;
    private final TimeSlotRepository timeSlotRepository;
    private final ClientRepository clientRepository;


    public AdminController(ProductRepository productRepository, OrderDetailRepository orderDetailRepository, OrderRepository orderRepository, TimeSlotRepository timeSlotRepository, ClientRepository clientRepository) {
        this.productRepository = productRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.clientRepository = clientRepository;
        this.orderRepository = orderRepository;
        this.timeSlotRepository = timeSlotRepository;
    }

    @RequestMapping("/Login")
    public String navigateToLoginOrderView(Model login) {
        login.addAttribute("pageTitle", "Login");
        return "Admin/AdminLoginView";
    }

    @RequestMapping("Admin/Dashboard")
    public String navigateToIndex(Model dashboard) {
        dashboard.addAttribute("pageTitle", "Dashboard");
     /*   long nrOfOpenOrders = nrOfOpenOrders();
        long nrOfOrdersReadyToPickUp =  nrOfOrdersReadyToPickUp();
        long picked = picked();
        dashboard.addAttribute("nrOfOpenOrders", nrOfOpenOrders);
        dashboard.addAttribute("nrOfOrdersReadyToPickUp", nrOfOrdersReadyToPickUp);
        dashboard.addAttribute("totalNrOfOrdersReady", picked);*/
        return "Admin/AdminDashboardView";
    }

    @RequestMapping("Admin/Orders")
    public String navigateToAdminOrderView(Model orders) {
        orders.addAttribute("pageTitle", "Orders");
       /* long nrOfOpenOrders = nrOfOpenOrders();
        long nrOfOrdersReadyToPickUp =  nrOfOrdersReadyToPickUp();
        long picked = picked();
        orders.addAttribute("nrOfOpenOrders", nrOfOpenOrders);
        orders.addAttribute("nrOfOrdersReadyToPickUp", nrOfOrdersReadyToPickUp);
        orders.addAttribute("totalNrOfOrdersReady", picked);*/
        return "Admin/AdminOrderView";
    }


    @RequestMapping("Admin/Products")
    public String navigateToAdminProductView(Model products) {
        List<Product> allProducts = productRepository.findAll();
        products.addAttribute("pageTitle", "Producten");
        products.addAttribute("allProducts", allProducts);
        return "Admin/AdminProductView";
    }

    @RequestMapping("Admin/TimeSlots")
    public String navigateToAdminTimeSlotsView(Model timeSlots) {
        timeSlots.addAttribute("pageTitle", "Time slots");
        return "Admin/AdminTimeSlotsView";
    }

    @RequestMapping("Admin/Settings")
    public String navigateToAdminSettingsView(Model settings) {
        settings.addAttribute("pageTitle", "Orders");
        settings.addAttribute("shopStatus", false);
        settings.addAttribute("logo", "/images/u101.png");
        settings.addAttribute("plannedVacation", "");
        return "Admin/AdminSettingsView";
    }

  /*  @RequestMapping(value = "/Admin/Products/Pause", method = RequestMethod.GET)
    public String getUserFeedback(@RequestParam Map<String,String> requestParams) throws Exception{
        String id = requestParams.get("id");
        Optional<Product> product = productRepository.findById(parseLong(id));
        product.map(x -> x.setStatus(false));
        // your code logic
        return "Admin/AdminProductView";
    }*/

    public long nrOfOpenOrders() {
        return orderRepository.findAll()
                .stream().filter(x -> x.getStatus().equalsIgnoreCase("open")).count();
    }

    public long nrOfOrdersReadyToPickUp() {
        return orderRepository.findAll()
                .stream().filter(x -> x.getStatus().equalsIgnoreCase("ready")).count();
    }

    public long picked() {
        return orderRepository.findAll()
                .stream().filter(x -> x.getStatus().equalsIgnoreCase("picked")).count();
    }
}
