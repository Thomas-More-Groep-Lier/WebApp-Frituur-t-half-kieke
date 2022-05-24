package be.thomasmore.graduaten.hellospring.controllers;

import be.thomasmore.graduaten.hellospring.entities.*;
import be.thomasmore.graduaten.hellospring.repositories.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class AdminController {

    private final ProductRepository productRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final OrderRepository orderRepository;
    private final TimeSlotRepository timeSlotRepository;
    private final ClientRepository clientRepository;
    private final VacationRepository vacationRepository;

    public AdminController(VacationRepository vacationRepository, ProductRepository productRepository,
                           OrderDetailRepository orderDetailRepository, OrderRepository orderRepository,
                           TimeSlotRepository timeSlotRepository, ClientRepository clientRepository) {
        this.productRepository = productRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.clientRepository = clientRepository;
        this.orderRepository = orderRepository;
        this.timeSlotRepository = timeSlotRepository;
        this.vacationRepository = vacationRepository;
    }

    Boolean inVacation;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    Date x = new Date();
    String today = sdf.format(x);

    @RequestMapping("/Login")
    public String navigateToLoginOrderView(Model login) {
        login.addAttribute("pageTitle", "Login");
        return "Admin/AdminLoginView";
    }

    @RequestMapping("Admin/Dashboard")
    public String navigateToIndex(Model dashboard) {
        dashboard.addAttribute("pageTitle", "Dashboard");
        dashboard.addAttribute("nrOfOpenOrders", nrOfOpenOrders());
        dashboard.addAttribute("nrOfOrdersReadyToPickUp", nrOfOrdersReadyToPickUp());
        dashboard.addAttribute("totalNrOfOrdersReady", picked());
        return "Admin/AdminDashboardView";
    }

    @RequestMapping("Admin/Orders")
    public String navigateToAdminOrderView(Model orders) {
        List<OrderDetail> orderDetailList = getOrderDetailList("");
        List<Order> orderList = getOrderList("");
        orders.addAttribute("pageTitle", "Orders");
        orders.addAttribute("nrOfOpenOrders", nrOfOpenOrders());
        orders.addAttribute("nrOfOrdersReadyToPickUp", nrOfOrdersReadyToPickUp());
        orders.addAttribute("totalNrOfOrdersReady", picked());
        orders.addAttribute("orderDetailList", orderDetailList);
        orders.addAttribute("orderList", orderList);
        return "Admin/AdminOrderView";
    }


    @RequestMapping(value = "Admin/Orders", method = RequestMethod.GET)
    public String navigateToAdminOrderView(Model orders, @PathParam("category") String category) {
        List<OrderDetail> orderDetailList = getOrderDetailList(category);
        List<Order> orderList = getOrderList(category);
        orders.addAttribute("pageTitle", "Orders");
        orders.addAttribute("nrOfOpenOrders", nrOfOpenOrders());
        orders.addAttribute("nrOfOrdersReadyToPickUp", nrOfOrdersReadyToPickUp());
        orders.addAttribute("totalNrOfOrdersReady", picked());
        orders.addAttribute("orderList", orderList);
        orders.addAttribute("orderDetailList", orderDetailList);
        return "Admin/AdminOrderView";
    }

    @PostMapping(path = "/Admin/Orders")
    public String updateProduct(Model orders,
                                @RequestBody @RequestParam(value = "orderId") long orderId,
                                @RequestParam(value = "orderStatus") String orderStatus,
                                @RequestParam(value = "category") String category,
                                @RequestParam(value = "_csrf") String token) {
        Order order = orderRepository.getById(orderId);
        order.setStatus(orderStatus);
        orderRepository.saveAndFlush(order);
        List<OrderDetail> orderDetailList = getOrderDetailList(category);
        List<Order> orderList = getOrderList(category);
        orders.addAttribute("pageTitle", "Orders");
        orders.addAttribute("nrOfOpenOrders", nrOfOpenOrders());
        orders.addAttribute("nrOfOrdersReadyToPickUp", nrOfOrdersReadyToPickUp());
        orders.addAttribute("totalNrOfOrdersReady", picked());
        orders.addAttribute("orderList", orderList);
        orders.addAttribute("orderDetailList", orderDetailList);
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
        return navigateToAdminProductView(products);
    }

    @RequestMapping(value = "Admin/Product/Restart", method = RequestMethod.GET)
    public String restartProduct(Model products, @PathParam("id") String id) {
        products.addAttribute("pageTitle", "Producten");
        Product product = productRepository.getById(Long.parseLong(id));
        product.setStatus(true);
        productRepository.save(product);
        List<Product> allProducts = productRepository.findAll();
        products.addAttribute("allProducts", allProducts);
        return navigateToAdminProductView(products);
    }

    @RequestMapping(value = "Admin/Product/Delete", method = RequestMethod.GET)
    public String deleteProduct(Model products, @PathParam("id") String id) {
        products.addAttribute("pageTitle", "Producten");
        Product product = productRepository.getById(Long.parseLong(id));
        productRepository.delete(product);
        List<Product> allProducts = productRepository.findAll();
        products.addAttribute("allProducts", allProducts);
        return navigateToAdminProductView(products);
    }

    @PostMapping(path = "/Admin/Products")
    public String updateProduct(Model products,
                                @RequestBody @RequestParam(value = "productId", required = false) String id,
                                @RequestParam(value = "productName") String name,
                                @RequestParam(value = "productCategory") String productCategory,
                                @RequestParam(value = "productPrice") float price,
                                @RequestParam(value = "_csrf") String token) {
        products.addAttribute("pageTitle", "Producten");

        switch (productCategory) {
            case "1":
                productCategory = "Frieten";
                break;
            case "2":
                productCategory = "Snack";
                break;
            case "3":
                productCategory = "Vegetarische Snack";
                break;
            case "4":
                productCategory = "Koude Saus";
                break;
            case "5":
                productCategory = "Warme Saus";
                break;
            case "6":
                productCategory = "Frisdrank";
                break;
            case "7":
                productCategory = "Bier";
                break;
            default:
                break;
        }
        Product product;
        if (!id.equals("")) {
            product = productRepository.getById(Long.parseLong(id));
            product.setDescription(name);
            product.setPrice(price);
            product.setCategory(productCategory);
            productRepository.save(product);

        } else {
            product = new Product(name, price, productCategory, true);
            productRepository.saveAndFlush(product);
        }

        List<Product> allProducts = productRepository.findAll();
        products.addAttribute("allProducts", allProducts);
        return navigateToAdminProductView(products);
    }

    @RequestMapping("Admin/TimeSlots")
    public String navigateToAdminTimeSlotsView(Model timeSlots) {
        timeSlots.addAttribute("pageTitle", "Time slots");
        timeSlots.addAttribute("timeSlotMan", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 0).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotDin", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 1).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotWoe", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 2).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotDon", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 3).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotVri", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 4).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotZat", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 5).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotZon", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 6).collect(Collectors.toList()));
        return "Admin/AdminTimeSlotsView";
    }

    @PostMapping(path = "Admin/TimeSlots/Default")
    public String addDefaultNrOfOrders(Model timeSlots,
                                       @RequestBody @RequestParam(value = "defaultNrOfOrders") int defaultNrOfOrders,
                                       @RequestParam(value = "_csrf") String token) {
        List<TimeSlot> all = timeSlotRepository.findAll();
        all.forEach(t -> t.setMaxNumberOfOrders(defaultNrOfOrders));
        timeSlotRepository.saveAllAndFlush(all);
        timeSlots.addAttribute("pageTitle", "Time slots");
        timeSlots.addAttribute("timeSlotMan", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 0).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotDin", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 1).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotWoe", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 2).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotDon", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 3).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotVri", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 4).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotZat", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 5).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotZon", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 6).collect(Collectors.toList()));
        return navigateToAdminTimeSlotsView(timeSlots);
    }

    @PostMapping(path = "Admin/TimeSlots/Change")
    public String changeATimeSlot(Model timeSlots,
                                  @RequestBody
                                  @RequestParam(value = "timeSlotId") long timeSlotId,
                                  @RequestParam(value = "isActive") boolean isActive,
                                  @RequestParam(value = "nrOfOrders") int maxNumberOfOrders,
                                  @RequestParam(value = "_csrf") String token) {
        TimeSlot slot = timeSlotRepository.getById(timeSlotId);
        slot.setMaxNumberOfOrders(maxNumberOfOrders);
        slot.setIsActive(isActive);
        timeSlotRepository.saveAndFlush(slot);
        timeSlots.addAttribute("pageTitle", "Time slots");
        timeSlots.addAttribute("timeSlotMan", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 0).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotDin", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 1).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotWoe", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 2).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotDon", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 3).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotVri", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 4).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotZat", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 5).collect(Collectors.toList()));
        timeSlots.addAttribute("timeSlotZon", timeSlotRepository.findAll().stream().filter(t -> t.getDayOfTheWeek() == 6).collect(Collectors.toList()));
        return navigateToAdminTimeSlotsView(timeSlots);
    }

    @PostMapping(path = "Admin/Settings/Openinghours")
    public String changeOpeningshours(Model settings,
                                      @RequestBody
                                      @RequestParam(value = "mondayFrom") String mondayFrom,
                                      @RequestParam(value = "mondayFrom2") String mondayFrom2,
                                      @RequestParam(value = "mondayUntil") String mondayUntil,
                                      @RequestParam(value = "mondayUntil2") String mondayUntil2,
                                      @RequestParam(value = "tuesdayFrom") String tuesdayFrom,
                                      @RequestParam(value = "tuesdayFrom2") String tuesdayFrom2,
                                      @RequestParam(value = "tuesdayUntil") String tuesdayUntil,
                                      @RequestParam(value = "tuesdayUntil2") String tuesdayUntil2,
                                      @RequestParam(value = "wednesdayFrom") String wednesdayFrom,
                                      @RequestParam(value = "wednesdayFrom2") String wednesdayFrom2,
                                      @RequestParam(value = "wednesdayUntil") String wednesdayUntil,
                                      @RequestParam(value = "wednesdayUntil2") String wednesdayUntil2,
                                      @RequestParam(value = "thursdayFrom") String thursdayFrom,
                                      @RequestParam(value = "thursdayFrom2") String thursdayFrom2,
                                      @RequestParam(value = "thursdayUntil") String thursdayUntil,
                                      @RequestParam(value = "thursdayUntil2") String thursdayUntil2,
                                      @RequestParam(value = "fridayFrom") String fridayFrom,
                                      @RequestParam(value = "fridayFrom2") String fridayFrom2,
                                      @RequestParam(value = "fridayUntil") String fridayUntil,
                                      @RequestParam(value = "fridayUntil2") String fridayUntil2,
                                      @RequestParam(value = "saturdayFrom") String saturdayFrom,
                                      @RequestParam(value = "saturdayFrom2") String saturdayFrom2,
                                      @RequestParam(value = "saturdayUntil") String saturdayUntil,
                                      @RequestParam(value = "saturdayUntil2") String saturdayUntil2,
                                      @RequestParam(value = "sundayFrom") String sundayFrom,
                                      @RequestParam(value = "sundayFrom2") String sundayFrom2,
                                      @RequestParam(value = "sundayUntil") String sundayUntil,
                                      @RequestParam(value = "sundayUntil2") String sundayUntil2,
                                      @RequestParam(value = "_csrf") String token) {

        // timeslots monday: 1 - 56
        if (!mondayFrom.isBlank() && !mondayUntil.isBlank() && !mondayFrom.equalsIgnoreCase(mondayUntil)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(mondayFrom.substring(0, 2));
            minutes = Integer.parseInt(mondayFrom.substring(3));
            long fromTimeSlot = timeSlotId(0, hours, minutes);
            hours = Integer.parseInt(mondayUntil.substring(0, 2));
            minutes = Integer.parseInt(mondayUntil.substring(3));
            long untilTimeSlot = timeSlotId(0, hours, minutes);
            timeSlotUpdater(0, 1, fromTimeSlot, untilTimeSlot);
        }
        if ((!mondayFrom2.isBlank() && !mondayUntil2.isBlank()) && !mondayFrom2.equalsIgnoreCase(mondayUntil2)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(mondayFrom2.substring(0, 2));
            minutes = Integer.parseInt(mondayFrom2.substring(3));
            long fromTimeSlot = timeSlotId(0, hours, minutes);
            hours = Integer.parseInt(mondayUntil2.substring(0, 2));
            minutes = Integer.parseInt(mondayUntil2.substring(3));
            long untilTimeSlot = timeSlotId(0, hours, minutes);
            timeSlotUpdater(0, 2, fromTimeSlot, untilTimeSlot);

        }
        // timeslots tuesday: 57 - 112
        if (!tuesdayFrom.isBlank() && !tuesdayUntil.isBlank() && !tuesdayFrom.equalsIgnoreCase(tuesdayUntil)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(tuesdayFrom.substring(0, 2));
            minutes = Integer.parseInt(tuesdayFrom.substring(3));
            long fromTimeSlot = timeSlotId(1, hours, minutes);
            hours = Integer.parseInt(tuesdayUntil.substring(0, 2));
            minutes = Integer.parseInt(tuesdayUntil.substring(3));
            long untilTimeSlot = timeSlotId(1, hours, minutes);
            timeSlotUpdater(1, 1, fromTimeSlot, untilTimeSlot);

        }
        if (!tuesdayFrom2.isBlank() && !tuesdayUntil2.isBlank() && !tuesdayFrom2.equalsIgnoreCase(tuesdayUntil2)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(tuesdayFrom2.substring(0, 2));
            minutes = Integer.parseInt(tuesdayFrom2.substring(3));
            long fromTimeSlot = timeSlotId(1, hours, minutes);
            hours = Integer.parseInt(tuesdayUntil2.substring(0, 2));
            minutes = Integer.parseInt(tuesdayUntil2.substring(3));
            long untilTimeSlot = timeSlotId(1, hours, minutes);
            timeSlotUpdater(1, 2, fromTimeSlot, untilTimeSlot);

        }
        // timeslots wednesday: 113 - 168
        if (!wednesdayFrom.isBlank() && !wednesdayUntil.isBlank() && !wednesdayFrom.equalsIgnoreCase(wednesdayUntil)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(wednesdayFrom.substring(0, 2));
            minutes = Integer.parseInt(wednesdayFrom.substring(3));
            long fromTimeSlot = timeSlotId(2, hours, minutes);
            hours = Integer.parseInt(wednesdayUntil.substring(0, 2));
            minutes = Integer.parseInt(wednesdayUntil.substring(3));
            long untilTimeSlot = timeSlotId(2, hours, minutes);
            timeSlotUpdater(2, 1, fromTimeSlot, untilTimeSlot);

        }
        if (!wednesdayFrom2.isBlank() && !wednesdayUntil2.isBlank() && !wednesdayFrom2.equalsIgnoreCase(wednesdayUntil2)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(wednesdayFrom2.substring(0, 2));
            minutes = Integer.parseInt(wednesdayFrom2.substring(3));
            long fromTimeSlot = timeSlotId(2, hours, minutes);
            hours = Integer.parseInt(wednesdayUntil2.substring(0, 2));
            minutes = Integer.parseInt(wednesdayUntil2.substring(3));
            long untilTimeSlot = timeSlotId(2, hours, minutes);
            timeSlotUpdater(2, 2, fromTimeSlot, untilTimeSlot);
        }
        // timeslots thursday: 169 - 224
        if (!thursdayFrom.isBlank() && !thursdayUntil.isBlank() && !thursdayFrom.equalsIgnoreCase(thursdayUntil)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(thursdayFrom.substring(0, 2));
            minutes = Integer.parseInt(thursdayFrom.substring(3));
            long fromTimeSlot = timeSlotId(3, hours, minutes);
            hours = Integer.parseInt(thursdayUntil.substring(0, 2));
            minutes = Integer.parseInt(thursdayUntil.substring(3));
            long untilTimeSlot = timeSlotId(3, hours, minutes);
            timeSlotUpdater(3, 1, fromTimeSlot, untilTimeSlot);

        }
        if (!thursdayFrom2.isBlank() && !thursdayUntil2.isBlank() && !thursdayFrom2.equalsIgnoreCase(thursdayUntil2)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(thursdayFrom2.substring(0, 2));
            minutes = Integer.parseInt(thursdayFrom2.substring(3));
            long fromTimeSlot = timeSlotId(3, hours, minutes);
            hours = Integer.parseInt(thursdayUntil2.substring(0, 2));
            minutes = Integer.parseInt(thursdayUntil2.substring(3));
            long untilTimeSlot = timeSlotId(3, hours, minutes);
            timeSlotUpdater(3, 2, fromTimeSlot, untilTimeSlot);

        }
        // timeslots friday: 225 - 280
        if (!fridayFrom.isBlank() && !fridayUntil.isBlank() && !fridayFrom.equalsIgnoreCase(fridayUntil)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(fridayFrom.substring(0, 2));
            minutes = Integer.parseInt(fridayFrom.substring(3));
            long fromTimeSlot = timeSlotId(4, hours, minutes);
            hours = Integer.parseInt(fridayUntil.substring(0, 2));
            minutes = Integer.parseInt(fridayUntil.substring(3));
            long untilTimeSlot = timeSlotId(4, hours, minutes);
            timeSlotUpdater(4, 1, fromTimeSlot, untilTimeSlot);

        }
        if (!fridayFrom2.isBlank() && !fridayUntil2.isBlank() && !fridayFrom2.equalsIgnoreCase(fridayUntil2)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(fridayFrom2.substring(0, 2));
            minutes = Integer.parseInt(fridayFrom2.substring(3));
            long fromTimeSlot = timeSlotId(4, hours, minutes);
            hours = Integer.parseInt(fridayUntil2.substring(0, 2));
            minutes = Integer.parseInt(fridayUntil2.substring(3));
            long untilTimeSlot = timeSlotId(4, hours, minutes);
            timeSlotUpdater(4, 2, fromTimeSlot, untilTimeSlot);

        }
        // timeslots saturday: 281 - 336
        if (!saturdayFrom.isBlank() && !saturdayUntil.isBlank() && !saturdayFrom.equalsIgnoreCase(saturdayUntil)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(saturdayFrom.substring(0, 2));
            minutes = Integer.parseInt(saturdayFrom.substring(3));
            long fromTimeSlot = timeSlotId(5, hours, minutes);
            hours = Integer.parseInt(saturdayUntil.substring(0, 2));
            minutes = Integer.parseInt(saturdayUntil.substring(3));
            long untilTimeSlot = timeSlotId(5, hours, minutes);
            timeSlotUpdater(5, 1, fromTimeSlot, untilTimeSlot);

        }
        if (!saturdayFrom2.isBlank() && !saturdayUntil2.isBlank() && !saturdayFrom2.equalsIgnoreCase(saturdayUntil2)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(saturdayFrom2.substring(0, 2));
            minutes = Integer.parseInt(saturdayFrom2.substring(3));
            long fromTimeSlot = timeSlotId(5, hours, minutes);
            hours = Integer.parseInt(saturdayUntil2.substring(0, 2));
            minutes = Integer.parseInt(saturdayUntil2.substring(3));
            long untilTimeSlot = timeSlotId(5, hours, minutes);
            timeSlotUpdater(5, 2, fromTimeSlot, untilTimeSlot);

        }
        // timeslots sunday: 337 - 392
        if (!sundayFrom.isBlank() && !sundayUntil.isBlank() && !sundayFrom.equalsIgnoreCase(sundayUntil)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(sundayFrom.substring(0, 2));
            minutes = Integer.parseInt(sundayFrom.substring(3));
            long fromTimeSlot = timeSlotId(6, hours, minutes);
            hours = Integer.parseInt(sundayUntil.substring(0, 2));
            minutes = Integer.parseInt(sundayUntil.substring(3));
            long untilTimeSlot = timeSlotId(6, hours, minutes);
            timeSlotUpdater(6, 1, fromTimeSlot, untilTimeSlot);

        }
        if (!sundayFrom2.isBlank() && !sundayUntil2.isBlank() && !sundayFrom2.equalsIgnoreCase(sundayUntil2)) {
            int hours;
            int minutes;
            hours = Integer.parseInt(sundayFrom2.substring(0, 2));
            minutes = Integer.parseInt(sundayFrom2.substring(3));
            long fromTimeSlot = timeSlotId(6, hours, minutes);
            hours = Integer.parseInt(sundayUntil2.substring(0, 2));
            minutes = Integer.parseInt(sundayUntil2.substring(3));
            long untilTimeSlot = timeSlotId(6, hours, minutes);
            timeSlotUpdater(6, 2, fromTimeSlot, untilTimeSlot);

        }
        return navigateToAdminSettingsView(settings);
    }

    @RequestMapping("Admin/Settings")
    public String navigateToAdminSettingsView(Model settings) {

        List<Vacation> allVacation = vacationRepository.findAll();
        settings.addAttribute("pageTitle", "Orders");
        settings.addAttribute("shopStatus", isInVacation());
        settings.addAttribute("logo", "/images/u101.png");
        settings.addAttribute("plannedVacation", allVacation);
        return "Admin/AdminSettingsView";
    }


    @PostMapping(path = "Admin/Settings/AddVacation")
    public String addVacationPeriod(Model settings,
                                    @RequestBody @RequestParam(value = "from") String from,
                                    @RequestParam(value = "untill") String untill,
                                    @RequestParam(value = "_csrf") String token) {
        Vacation Vacation = new Vacation(from, untill);
        vacationRepository.saveAndFlush(Vacation);
        List<Vacation> allVacation = vacationRepository.findAll();
        inVacation = isInVacation();

        settings.addAttribute("pageTitle", "Instellingen");
        settings.addAttribute("shopStatus", inVacation);
        settings.addAttribute("logo", "/images/u101.png");
        settings.addAttribute("plannedVacation", allVacation);
        return navigateToAdminSettingsView(settings);
    }

    @RequestMapping(value = "Admin/Settings/Vacation/Delete", method = RequestMethod.GET)
    public String deleteVacation(Model settings, @PathParam("id") String id) {
        settings.addAttribute("pageTitle", "Producten");
        Vacation vac = vacationRepository.getById(Long.parseLong(id));
        vacationRepository.delete(vac);
        List<Vacation> allVacation = vacationRepository.findAll();
        inVacation = isInVacation();

        settings.addAttribute("pageTitle", "Instellingen");
        settings.addAttribute("shopStatus", inVacation);
        settings.addAttribute("logo", "/images/u101.png");
        settings.addAttribute("plannedVacation", allVacation);
        return navigateToAdminSettingsView(settings);
    }

    public long nrOfOpenOrders() {
        return orderRepository.findAll()
                .stream().filter(x -> x.getStatus().equalsIgnoreCase("open") && x.getOrderDate().equalsIgnoreCase(today)).count();
    }

    public long nrOfOrdersReadyToPickUp() {
        return orderRepository.findAll()
                .stream().filter(x -> x.getStatus().equalsIgnoreCase("ready") && x.getOrderDate().equalsIgnoreCase(today)).count();
    }

    public long picked() {

         return orderRepository.findAll()
                .stream().filter(x -> x.getStatus().equalsIgnoreCase("picked") && x.getOrderDate().equalsIgnoreCase(today)).count();
    }

    public void timeSlotUpdater(int day, int option, long start, long end) {
        if (start != end) {
            switch (day) {
                case 0:
                    if (option == 1) {
                        for (long x = 56; x > 0; x--) {
                            TimeSlot slot = timeSlotRepository.getById(x);
                            slot.setIsActive(false);
                            timeSlotRepository.saveAndFlush(slot);
                        }
                    }
                    activateTimeSlots(start, end);
                    break;
                case 1:
                    if (option == 1) {
                        for (long x = 112; x > 56; x--) {
                            TimeSlot slot = timeSlotRepository.getById(x);
                            slot.setIsActive(false);
                            timeSlotRepository.saveAndFlush(slot);
                        }
                    }
                    activateTimeSlots(start, end);
                    break;
                case 2:
                    if (option == 1) {
                        for (long x = 168; x > 112; x--) {
                            TimeSlot slot = timeSlotRepository.getById(x);
                            slot.setIsActive(false);
                            timeSlotRepository.saveAndFlush(slot);
                        }
                    }
                    activateTimeSlots(start, end);
                    break;
                case 3:
                    if (option == 1) {

                        for (long x = 224; x > 168; x--) {
                            TimeSlot slot = timeSlotRepository.getById(x);
                            slot.setIsActive(false);
                            timeSlotRepository.saveAndFlush(slot);
                        }
                    }
                    activateTimeSlots(start, end);
                    break;
                case 4:
                    if (option == 1) {

                        for (long x = 280; x > 224; x--) {
                            TimeSlot slot = timeSlotRepository.getById(x);
                            slot.setIsActive(false);
                            timeSlotRepository.saveAndFlush(slot);
                        }
                    }
                    activateTimeSlots(start, end);
                    break;
                case 5:
                    if (option == 1) {
                        for (long x = 336; x > 280; x--) {
                            TimeSlot slot = timeSlotRepository.getById(x);
                            slot.setIsActive(false);
                            timeSlotRepository.saveAndFlush(slot);
                        }
                    }
                    activateTimeSlots(start, end);
                    break;
                case 6:
                    if (option == 1) {
                        for (long x = 392; x > 336; x--) {
                            TimeSlot slot = timeSlotRepository.getById(x);
                            slot.setIsActive(false);
                            timeSlotRepository.saveAndFlush(slot);
                        }
                    }
                    activateTimeSlots(start, end);
                    break;
                default:
            }
        }

    }

    public void activateTimeSlots(long start, long end) {
        for (long x = start; x < end; x++) {
            TimeSlot slot = timeSlotRepository.getById(x);
            slot.setIsActive(true);
            timeSlotRepository.saveAndFlush(slot);
        }
    }

    public long timeSlotId(int day, int hours, int minutes) {
        long timeSlotId = (hours - 10) * 4;
        if (minutes == 15) {
            timeSlotId = timeSlotId + 1;
        } else if (minutes == 30) {
            timeSlotId = timeSlotId + 2;
        } else if (minutes == 45) {
            timeSlotId = timeSlotId + 3;
        }
        switch (day) {
            case 1:
                return timeSlotId + 56;
            case 2:
                return timeSlotId + 112;
            case 3:
                return timeSlotId + 168;
            case 4:
                return timeSlotId + 224;
            case 5:
                return timeSlotId + 280;
            case 6:
                return timeSlotId + 336;
            default:
                return timeSlotId;
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

    public List<OrderDetail> getOrderDetailList(String category) {
        if (category == null){
            return orderDetailRepository.findAll();
        }
       return orderDetailRepository.findAll().stream().filter(od -> od.getOrder().getStatus().equalsIgnoreCase(category)).collect(Collectors.toList());
    }
    public List<Order> getOrderList(String category) {
        if (category == null){
            return orderRepository.findAll().stream().filter(x -> x.getOrderDate().equalsIgnoreCase(today)).collect(Collectors.toList());
        }
        return orderRepository.findAll().stream().filter(o -> o.getStatus().equalsIgnoreCase(category) && o.getOrderDate().equalsIgnoreCase(today)).collect(Collectors.toList());
    }
}
