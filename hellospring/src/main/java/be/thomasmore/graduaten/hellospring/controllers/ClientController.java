package be.thomasmore.graduaten.hellospring.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ClientController {
    @RequestMapping("Client/clientOrder")
    public String navigateToOrderView(Model order){
        order.addAttribute("pageTitle", "Bedankt voor je bestelling!");
        order.addAttribute("name", "Team Lier");
        order.addAttribute("timeBlock", "17:45 - 18:00");
        order.addAttribute("totalPrice", 0.00);
        return "Client/ClientOrderView"; }

    @RequestMapping("Client/orderFries")
    public String navigateToFriesView(Model fries){
        fries.addAttribute("category", "Frieten");
        fries.addAttribute("pageTitle", "Frieten bestellen");
        fries.addAttribute("names", new String[]{"Mini", "Klein", "Groot", "Maxi", "Familie"});
        fries.addAttribute("prices", new Double[]{1.60, 1.80, 2.20, 3.20, 5.40});
        return "Client/OrderFriesView";
    }

    @RequestMapping("Client/orderBeers")
    public String navigateToBeersView( Model beers){
        beers.addAttribute("category", "Bier");
        beers.addAttribute("pageTitle", "Bier bestellen");
        beers.addAttribute("names", new String[]{"Jupiler - 33cl", "Jupiler - 0.00% - 33cl", "Leffe Blond - 50cl", "Duvel - 33cl", "Vedett Extra White - 33cl", "Gouden Carolus- 33cl"});
        beers.addAttribute("prices", new Double[]{1.80, 1.80, 3.50, 3.50, 3.00, 3.50});
        return "Client/OrderBeersView";
    }

    @RequestMapping("Client/orderSauces")
    public String navigateToSaucesView(Model sauces){
        sauces.addAttribute("category", "Koude Sauzen");
        sauces.addAttribute("category2", "Warme Sauzen");
        sauces.addAttribute("pageTitle", "Sauzen bestellen");
        sauces.addAttribute("names", new String[]{"Mayonaise","Tomaten Ketchup","Curry Ketchup","Koude Curry","Andalouse","Samourai"});
        sauces.addAttribute("prices", new Double[]{0.90,0.90,0.90,0.90,0.90,0.90});
        sauces.addAttribute("names2", new String[]{"Huisgemaakt Stoofvlees Saus","Warme Curry", "Goulash Saus"});
        sauces.addAttribute("prices2", new Double[]{2.20, 1.80, 1.80});
        return "Client/OrderSaucesView";
    }

    @RequestMapping("Client/orderSnacks")
    public String navigateToSnacksView(Model snacks){
        snacks.addAttribute("category", "Snacks");
        snacks.addAttribute("category2", "Vegetarische Snacks");
        snacks.addAttribute("pageTitle", "Snacks bestellen");
        snacks.addAttribute("names", new String[]{"Curryworst","Curryworst Speciaal","Cervela","Mexicano","Boulet","Kipknots"});
        snacks.addAttribute("prices", new Double[]{1.80,2.70,2.20,2.00,2.40,1.60});
        snacks.addAttribute("names2", new String[]{"Burger","Bamischijf","Kaaskroket"});
        snacks.addAttribute("prices2", new Double[]{1.80, 2.70, 2.20});
        return "Client/OrderSnacksView";
    }

    @RequestMapping("Client/orderSoftDrinks")
    public String navigateToSoftDrinksView(Model soft){
        soft.addAttribute("category", "Frisdranken");
        soft.addAttribute("pageTitle", "Frisdranken bestellen");
        soft.addAttribute("names", new String[]{"Chaudfonteine plat - 50cl","Chaudfonteine bruis - 50cl","Coca Cola - 33cl","Coca Cola Zero - 33cl","Fanta Orange - 33cl","Lipton Ice Tea- 33cl"});
        soft.addAttribute("prices", new Double[]{1.80, 1.80, 1.80,1.80,1.80,2.20});
        return "Client/OrderSoftDrinksView";
    }
    @RequestMapping("Client/cart")
    public String navigateToShoppingCartView(){
        return "Client/ShoppingCartView";
    }
}
