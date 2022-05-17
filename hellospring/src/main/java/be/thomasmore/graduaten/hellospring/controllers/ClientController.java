package be.thomasmore.graduaten.hellospring.controllers;

import be.thomasmore.graduaten.hellospring.entities.Client;
import be.thomasmore.graduaten.hellospring.entities.Product;
import be.thomasmore.graduaten.hellospring.entities.TimeSlot;
import be.thomasmore.graduaten.hellospring.repositories.ClientRepository;
import be.thomasmore.graduaten.hellospring.repositories.ProductRepository;
import be.thomasmore.graduaten.hellospring.repositories.TimeSlotRepository;

import org.eclipse.jdt.internal.compiler.ast.EqualExpression;
import org.hibernate.annotations.Any;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.Console;
import java.lang.reflect.Array;
import java.util.ArrayDeque;
import java.util.Date;
import java.util.List;

import java.util.stream.Collectors;

@Controller
public class ClientController {

    private final ProductRepository productRepository;
    private final ClientRepository clientRepository;
    private final TimeSlotRepository timeSlotRepository;

    public ClientController(ProductRepository productRepository, ClientRepository clientRepository, TimeSlotRepository timeSlotRepository) {
        this.productRepository = productRepository;
        this.clientRepository = clientRepository;
        this.timeSlotRepository = timeSlotRepository;
    }

    Boolean inVacation;

    // @RequestMapping("/Client/clientOrder")
    // public String navigateToOrderView(Model order) {

    //     order.addAttribute("pageTitle", "Bedankt voor je bestelling!");
    //     order.addAttribute("name", "Team Lier");
    //     order.addAttribute("timeBlock", "17:45 - 18:00");
    //     order.addAttribute("totalPrice", 0.00);
    //     return "/Client/ClientOrderView";
    // }


    @PostMapping(path = "Client/clientOrder")
    public String addVacationPeriod(Model order,
            @RequestBody @RequestParam(value = "firstName") String first,
            @RequestParam(value = "lastName") String last,
            @RequestParam(value = "email") String mail,
            @RequestParam(value = "tel") String phone,
            @RequestParam(value = "quantity[]") String[] quantities,
            @RequestParam(value = "products[]") String[] products,
            @RequestParam(value = "_csrf") String token) {
        Client user = new Client(first, last, phone, mail);
        

        // List<Client> client = clientRepository.findAll()
        //         .stream().filter(x -> x.getEmailAdress().equalsIgnoreCase(mail))
        //         .collect(Collectors.toList());
        
        // if (client.isEmpty()){
        //     clientRepository.saveAndFlush(user);
        // } 
        // else {
        //     long id = client.get(0).getId();
        // }
       

        order.addAttribute("pageTitle", "Bedankt voor je bestelling!");
        order.addAttribute("name", "Team Lier");
        order.addAttribute("timeBlock", "17:45 - 18:00");
        order.addAttribute("totalPrice", 0.00);
        return "Client/ClientOrderView";
    }




    @RequestMapping("Client/orderFries")
    public String navigateToFriesView(Model fries) {
        List<Product> products = productRepository.findAll()
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("frieten") && x.getStatus() == true)
                .collect(Collectors.toList());
        fries.addAttribute("products", products);
        fries.addAttribute("category", "Frieten");
        fries.addAttribute("pageTitle", "Frieten bestellen");
        return "Client/OrderFriesView";
    }

    @RequestMapping("Client/orderBeers")
    public String navigateToBeersView(Model beers) {
        beers.addAttribute("category", "Bier");
        beers.addAttribute("pageTitle", "Bier bestellen");
        List<Product> products = productRepository.findAll()
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("bier") && x.getStatus() == true)
                .collect(Collectors.toList());
        beers.addAttribute("products", products);
        return "Client/OrderBeersView";
    }

    @RequestMapping("Client/orderSauces")
    public String navigateToSaucesView(Model sauces) {
        sauces.addAttribute("pageTitle", "Sauzen bestellen");
        sauces.addAttribute("category", "Koude Sauzen");
        sauces.addAttribute("category2", "Warme Sauzen");
        List<Product> products = productRepository.findAll()
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("koude saus") && x.getStatus() == true)
                .collect(Collectors.toList());
        List<Product> productsCategory2 = productRepository.findAll()
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("warme saus") && x.getStatus() == true)
                .collect(Collectors.toList());
        sauces.addAttribute("products", products);
        sauces.addAttribute("productsCategory2", productsCategory2);
        return "Client/OrderSaucesView";
    }

    @RequestMapping("Client/orderSnacks")
    public String navigateToSnacksView(Model snacks) {
        List<Product> products = productRepository.findAll()
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("snack") && x.getStatus() == true)
                .collect(Collectors.toList());
        List<Product> productsCategory2 = productRepository.findAll()
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("vegetarische snack"))
                .collect(Collectors.toList());
        snacks.addAttribute("category", "Snacks");
        snacks.addAttribute("category2", "Vegetarische Snacks");
        snacks.addAttribute("pageTitle", "Snacks bestellen");
        snacks.addAttribute("products", products);
        snacks.addAttribute("productsCategory2", productsCategory2);
        return "Client/OrderSnacksView";
    }

    @RequestMapping("Client/orderSoftDrinks")
    public String navigateToSoftDrinksView(Model soft) {
        List<Product> products = productRepository.findAll()
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("frisdrank") && x.getStatus() == true)
                .collect(Collectors.toList());
        soft.addAttribute("category", "Frisdranken");
        soft.addAttribute("pageTitle", "Frisdranken bestellen");
        soft.addAttribute("products", products);
        return "Client/OrderSoftDrinksView";
    }

    @RequestMapping("Client/cart")
    public String navigateToShoppingCartView(Model cart) {
        Date today = new Date();
        int dayOfTheWeek = today.getDay();
        // List<TimeSlot> timeSlots = timeSlotRepository.findAll()
        // .stream().filter(x -> x.getDayOfTheWeek() == 1)
        // .collect(Collectors.toList());
     //   cart.addAttribute("timeSlots", slots);
        cart.addAttribute("pageTitle", "Uw bestelling bij frituur t' half kieke!");
        return "Client/ShoppingCartView";
    }
}
