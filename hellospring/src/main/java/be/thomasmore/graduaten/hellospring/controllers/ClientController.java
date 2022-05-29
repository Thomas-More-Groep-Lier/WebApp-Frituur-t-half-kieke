package be.thomasmore.graduaten.hellospring.controllers;
import be.thomasmore.graduaten.hellospring.entities.*;
import be.thomasmore.graduaten.hellospring.repositories.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.time.DayOfWeek;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class ClientController {
    private final ProductRepository productRepository;
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final ClientRepository clientRepository;
    private final TimeSlotRepository timeSlotRepository;

    public ClientController(OrderDetailRepository orderDetailRepository, OrderRepository orderRepository, ProductRepository productRepository, ClientRepository clientRepository, TimeSlotRepository timeSlotRepository) {
        this.productRepository = productRepository;
        this.clientRepository = clientRepository;
        this.timeSlotRepository = timeSlotRepository;
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    @PostMapping(path = "Client/clientOrder")
    public String clientEndpoint(Model order,
            @RequestBody @RequestParam(value = "firstName") String first,
            @RequestParam(value = "lastName") String last,
            @RequestParam(value = "email") String mail,
            @RequestParam(value = "tel") String phone,
            @RequestParam(value = "quantity[]") String[] quantities,
            @RequestParam(value = "products[]") String[] products,
            @RequestParam(value = "timeSlot") long timeSlot,
            @RequestParam(value = "_csrf") String token) {
        TimeSlot slot = timeSlotRepository.getById(timeSlot);
        slot.setOrdersPlaced(slot.getOrdersPlaced()+1);
        timeSlotRepository.saveAndFlush(slot);

        Client user = new Client(first, last, phone, mail);
        List<Client> client = clientRepository.findAll()
                 .stream().filter(x -> x.getEmailAdress().equalsIgnoreCase(mail))
                 .collect(Collectors.toList());
         if (client.isEmpty()){
             clientRepository.saveAndFlush(user);
         }
         else {
             user = client.get(0);
         }

         // prepare order
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        String date = dtf.format(now);
        Order x = new Order(user, date, false, "open", slot, slot.getUntil());
        orderRepository.save(x);

        for (int i = 0 ; i < products.length; i++){
            Product p = productRepository.getById(Long.parseLong(products[i]));
            OrderDetail od = new OrderDetail(p, x, Long.parseLong(quantities[i]));
            orderDetailRepository.saveAndFlush(od);
        }

        String name = first + " " + last;
        order.addAttribute("pageTitle", "Bedankt voor je bestelling!");
        order.addAttribute("name", name);
        order.addAttribute("timeBlock", slot);
        order.addAttribute("totalPrice", 0.00);
        return "Client/ClientOrderView";
    }

    @RequestMapping("Client/orderFries")
    public String navigateToFriesView(Model fries) {
        List<Product> products = productRepository.findAll()
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("frieten") && x.getStatus())
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
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("bier") && x.getStatus())
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
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("koude saus") && x.getStatus())
                .collect(Collectors.toList());
        List<Product> productsCategory2 = productRepository.findAll()
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("warme saus") && x.getStatus())
                .collect(Collectors.toList());
        sauces.addAttribute("products", products);
        sauces.addAttribute("productsCategory2", productsCategory2);
        return "Client/OrderSaucesView";
    }

    @RequestMapping("Client/orderSnacks")
    public String navigateToSnacksView(Model snacks) {
        List<Product> products = productRepository.findAll()
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("snack") && x.getStatus())
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
                .stream().filter(x -> x.getCategory().equalsIgnoreCase("frisdrank") && x.getStatus())
                .collect(Collectors.toList());
        soft.addAttribute("category", "Frisdranken");
        soft.addAttribute("pageTitle", "Frisdranken bestellen");
        soft.addAttribute("products", products);
        return "Client/OrderSoftDrinksView";
    }

    @RequestMapping("Client/cart")
    public String navigateToShoppingCartView(Model cart) {
        long currentTimeSlotId = getCurrentTimeSlot();
        long max = 392;
        long limit = currentTimeSlotId + 8 < max ? currentTimeSlotId + 8 : max;
        List<TimeSlot> timeSlots = timeSlotRepository.findAll().stream().filter(w -> w.getId() >= currentTimeSlotId && w.getId() <= limit).collect(Collectors.toList());
        cart.addAttribute("timeSlots", timeSlots);
        cart.addAttribute("pageTitle", "Uw bestelling bij frituur t' half kieke!");
        return "Client/ShoppingCartView";
    }

    public long getCurrentTimeSlot(){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("HH:mm");
        LocalDateTime now = LocalDateTime.now();
        String current = dtf.format(now);
        int hours = Integer.parseInt(current.substring(0, 2));
        int minutes = roundMinutes(Integer.parseInt(current.substring(3)));
        DayOfWeek weekday = now.getDayOfWeek();
        return getTimeSlotId(weekday, hours, minutes);
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
        if (timeSlotId < 0){
            // return first from current weekday...
            switch (weekday) {
                case MONDAY:
                    return 1;
                case TUESDAY:
                    return 57;
                case WEDNESDAY:
                    return 113;
                case THURSDAY:
                    return 169;
                case FRIDAY:
                    return 225;
                case SATURDAY:
                    return 281;
                case SUNDAY:
                    return  337;
                default: return timeSlotId;
            }
        }else {
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




}
