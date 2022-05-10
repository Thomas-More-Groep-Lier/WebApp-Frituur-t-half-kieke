package be.thomasmore.graduaten.hellospring.controllers;

import be.thomasmore.graduaten.hellospring.entities.Product;
import be.thomasmore.graduaten.hellospring.repositories.ProductRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ClientController {

    private final ProductRepository productRepository;

    public ClientController(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }


    @RequestMapping("Client/clientOrder")
    public String navigateToOrderView(Model order) {
        order.addAttribute("pageTitle", "Bedankt voor je bestelling!");
        order.addAttribute("name", "Team Lier");
        order.addAttribute("timeBlock", "17:45 - 18:00");
        order.addAttribute("totalPrice", 0.00);
        return "Client/ClientOrderView";
    }

    @RequestMapping("Client/orderFries")
    public String navigateToFriesView(Model fries) {
        List<Product> products = productRepository.findAll()
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("frieten"))
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
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("bier"))
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
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("koude saus"))
                .collect(Collectors.toList());
        List<Product> productsCategory2 = productRepository.findAll()
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("warme saus"))
                .collect(Collectors.toList());
        sauces.addAttribute("products", products);
        sauces.addAttribute("productsCategory2", productsCategory2);
        return "Client/OrderSaucesView";
    }

    @RequestMapping("Client/orderSnacks")
    public String navigateToSnacksView(Model snacks) {
        List<Product> products = productRepository.findAll()
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("snack"))
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
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("frisdrank"))
                .collect(Collectors.toList());
        soft.addAttribute("category", "Frisdranken");
        soft.addAttribute("pageTitle", "Frisdranken bestellen");
        soft.addAttribute("products", products);
        return "Client/OrderSoftDrinksView";
    }

    @RequestMapping("Client/cart")
    public String navigateToShoppingCartView() {
        return "Client/ShoppingCartView";
    }
}
