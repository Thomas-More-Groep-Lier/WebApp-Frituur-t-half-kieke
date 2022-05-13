package be.thomasmore.graduaten.hellospring.controllers;

import be.thomasmore.graduaten.hellospring.entities.Product;
import be.thomasmore.graduaten.hellospring.repositories.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.util.List;

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
       /* long nrOfOpenOrders = nrOfOpenOrders();
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
        orders.addAttribute("totalNrOfOrdersReady", picked); */
        return "Admin/AdminOrderView";
    }


    @RequestMapping("Admin/Products")
    public String navigateToAdminProductView(Model products) {
        List<Product> allProducts = productRepository.findAll();
        products.addAttribute("pageTitle", "Producten");
        products.addAttribute("allProducts", allProducts);
        return "Admin/AdminProductView";
    }

    @RequestMapping(value = "Admin/Product/Pause", method = RequestMethod.GET)
    public String pauseProduct(Model products, @PathParam("id") String id) {
        products.addAttribute("pageTitle", "Producten");
        Product product = productRepository.getById(Long.parseLong(id));
            product.setStatus(false);
            productRepository.save(product);
        List<Product> allProducts = productRepository.findAll();
        products.addAttribute("allProducts", allProducts);
        return "Admin/AdminProductView";
    }

    @RequestMapping(value = "Admin/Product/Restart", method = RequestMethod.GET)
    public String restartProduct(Model products, @PathParam("id") String id) {
        products.addAttribute("pageTitle", "Producten");
        Product product = productRepository.getById(Long.parseLong(id));
        if (product != null) {
            product.setStatus(true);
            productRepository.save(product);
        }
        List<Product> allProducts = productRepository.findAll();
        products.addAttribute("allProducts", allProducts);
        return "Admin/AdminProductView";
    }

    @RequestMapping(value = "Admin/Product/Delete", method = RequestMethod.GET)
    public String deleteProduct(Model products, @PathParam("id") String id) {
        products.addAttribute("pageTitle", "Producten");
        Product product = productRepository.getById(Long.parseLong(id));
        if (product != null) {
            productRepository.delete(product);
        }
        List<Product> allProducts = productRepository.findAll();
        products.addAttribute("allProducts", allProducts);
        return "Admin/AdminProductView";
    }

    @PostMapping(path = "/Admin/Products")
    public String updateProduct(Model products,
                                @RequestBody
                                @RequestParam(value = "productId", required = false) String id,
                                @RequestParam(value = "productName") String name,
                                @RequestParam(value = "productCategory") String productCategory,
                                @RequestParam(value = "productPrice") float price,
                                @RequestParam(value = "_csrf") String token) {

        products.addAttribute("pageTitle", "Producten");

        switch (productCategory){
            case "1": productCategory = "Frieten";
                break;
            case "2": productCategory = "Snack";
                break;
            case "3": productCategory = "Vegetarische Snack";
                break;
            case "4": productCategory = "Koude Saus";
                break;
            case "5": productCategory = "Warme Saus";
                break;
            case "6": productCategory = "Frisdrank";
                break;
            case "7": productCategory = "Bier";
                break;
            default:
                break;
        }

        try{

            Product product = productRepository.getById(Long.parseLong(id));
            product.setDescription(name);
            product.setPrice(price);
            product.setCategory(productCategory);
            productRepository.save(product);
        }
        catch(Exception ex){
            Product product = new Product(name, price, productCategory, true);
            productRepository.save(product);
        }

        List<Product> allProducts = productRepository.findAll();
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
