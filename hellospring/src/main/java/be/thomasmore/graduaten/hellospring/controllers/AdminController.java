package be.thomasmore.graduaten.hellospring.controllers;

import be.thomasmore.graduaten.hellospring.entities.*;
import be.thomasmore.graduaten.hellospring.repositories.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.websocket.server.PathParam;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class AdminController {

    private final OpeninghoursRepository openinghoursRepository;
    private final ProductRepository productRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final OrderRepository orderRepository;
    private final TimeSlotRepository timeSlotRepository;
    private final VacationRepository vacationRepository;
    private final CondimentRepository condimentRepository;
    private final ProductCondimentRepository productCondimentRepository;

    public AdminController(OpeninghoursRepository openinghoursRepository, VacationRepository vacationRepository, ProductRepository productRepository,
                           OrderDetailRepository orderDetailRepository, OrderRepository orderRepository,
                           TimeSlotRepository timeSlotRepository, CondimentRepository condimentRepository, ProductCondimentRepository productCondimentRepository) {
        this.openinghoursRepository = openinghoursRepository;
        this.productRepository = productRepository;
        this.orderDetailRepository = orderDetailRepository;
        this.orderRepository = orderRepository;
        this.timeSlotRepository = timeSlotRepository;
        this.vacationRepository = vacationRepository;
        this.condimentRepository = condimentRepository;
        this.productCondimentRepository = productCondimentRepository;
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

    @RequestMapping("/Admin/Check")
    public String navigateToCheck(Model check) {
        check.addAttribute("nrOfOpenOrders", nrOfOpenOrders());
        return "Admin/CheckForNewOpenOrdersNoContent";
    }

    @RequestMapping("Admin/Dashboard")
    public String navigateToIndex(Model dashboard) {
        Map<Product, Long> bestsellers = orderDetailRepository.findAll().stream().collect(Collectors.groupingBy(OrderDetail::getProduct, Collectors.summingLong(OrderDetail::getNumberOfProducts)));
        bestsellers.forEach((k, v) -> System.out.println(k + "=" + v));
        System.out.println("After Sorting by value");
        List<Map.Entry<Product, Long>> list = new ArrayList<>(bestsellers.entrySet());
        list.sort(Map.Entry.comparingByValue());
        Collections.reverse(list);
        dashboard.addAttribute("list", list);
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
    public String updateOrder(Model orders,
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
        List<Condiment> allcondiments = condimentRepository.findAll();
        products.addAttribute("allCondiments", allcondiments);
        List<ProductCondiment> allProductCondiments = productCondimentRepository.findAll();
        products.addAttribute("allProductCondiments", allProductCondiments);
        return "Admin/AdminProductView";
    }

    @RequestMapping(value = "Admin/Product/Pause", method = RequestMethod.GET)
    public String pauseProduct(Model products, @PathParam("id") String id) {
        products.addAttribute("pageTitle", "Producten");
        Product product = productRepository.getById(Long.parseLong(id));
        product.setStatus(false);
        productRepository.save(product);
        return navigateToAdminProductView(products);

    }

    @RequestMapping(value = "Admin/Product/Restart", method = RequestMethod.GET)
    public String restartProduct(Model products, @PathParam("id") String id) {
        products.addAttribute("pageTitle", "Producten");
        Product product = productRepository.getById(Long.parseLong(id));
        product.setStatus(true);
        productRepository.save(product);
        return navigateToAdminProductView(products);
    }

    @RequestMapping(value = "Admin/Product/Delete", method = RequestMethod.GET)
    public String deleteProduct(Model products, @PathParam("id") String id) {

        List<ProductCondiment> pc = productCondimentRepository.findAll().stream().filter(p -> p.getProduct().getId() == Long.parseLong(id)).collect(Collectors.toList());
            if (pc.size() > 0) {
                productCondimentRepository.deleteAll(pc);
            }

        products.addAttribute("pageTitle", "Producten");
        Product product = productRepository.getById(Long.parseLong(id));
        productRepository.delete(product);
        return navigateToAdminProductView(products);
    }

    @RequestMapping(value = "Admin/Products/Condiments/Delete", method = RequestMethod.GET)
    public String deleteProductCondiment(Model products, @PathParam("id") String id) {

        List<ProductCondiment> pc = productCondimentRepository.findAll().stream().filter(c -> c.getCondiment().getId() == Long.parseLong(id)).collect(Collectors.toList());

            if (pc.size() > 0) {
                productCondimentRepository.deleteAll(pc);
            }


        products.addAttribute("pageTitle", "Producten");
        Condiment productCondiment = condimentRepository.getById(Long.parseLong(id));
        condimentRepository.delete(productCondiment);
        return navigateToAdminProductView(products);

    }


    @PostMapping(path = "/Admin/Products")
    public String updateProduct(Model products,
                                @RequestBody @RequestParam(value = "productId", required = false) String id,
                                @RequestParam(value = "productName") String name,
                                @RequestParam(value = "productCategory") String productCategory,
                                @RequestParam(value = "productPrice") float price,
                                @RequestParam(value = "condimenten") Long[] condimenten,
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
            product.setPrice(price);
            if (!name.equals(""))
                product.setDescription(name);
            if (!productCategory.equals(""))
                product.setCategory(productCategory);
            productRepository.save(product);

        } else {
            product = new Product(name, price, productCategory, true);
            productRepository.saveAndFlush(product);
        }

        if (condimenten != null && condimenten.length > 0) {
            for (Long x : condimenten) {
                Condiment condiment = condimentRepository.getById(x);

                List<ProductCondiment> productCondiment = productCondimentRepository.findAll().stream().filter(prc -> prc.getProduct().getId() == product.getId() && prc.getCondiment().getId() == condiment.getId()).collect(Collectors.toList());
                if (productCondiment.size() == 0) {
                    ProductCondiment newProductCondiment = new ProductCondiment();
                    newProductCondiment.setProduct(product);
                    newProductCondiment.setCondiment(condiment);
                    productCondimentRepository.saveAndFlush(newProductCondiment);
                }
            }
        }

        return navigateToAdminProductView(products);
    }

    @RequestMapping("Admin/Products/Condiments")
    public String navigateToAdminCondimentsView(Model condiments) {
        List<Condiment> allcondiments = condimentRepository.findAll();
        condiments.addAttribute("pageTitle", "Condimenten");
        condiments.addAttribute("allcondiments", allcondiments);
        return "Admin/AdminCondimentView";
    }

    @RequestMapping(value = "Admin/Products/DeleteCondiment", method = RequestMethod.GET)
    public String deleteCondiment(Model products, @PathParam("id") String id) {
        ProductCondiment productCondiment = productCondimentRepository.getById(Long.parseLong(id));

            productCondimentRepository.delete(productCondiment);
        return navigateToAdminProductView(products);
    }

    @PostMapping(path = "/Admin/Products/Condiments")
    public String updateCondiment(Model condiment,
                                  @RequestBody @RequestParam(value = "condimentId", required = false) String id,
                                  @RequestParam(value = "condimentName") String name,
                                  @RequestParam(value = "condimentPrice") float price,
                                  @RequestParam(value = "_csrf") String token) {
        condiment.addAttribute("pageTitle", "Condimenten");

        Condiment condi;
        if (!id.equals("")) {
            condi = condimentRepository.getById(Long.parseLong(id));
            condi.setDescription(name);
            condi.setPrice(price);
            condimentRepository.save(condi);
        } else {
            condi = new Condiment(name, price);
            condimentRepository.saveAndFlush(condi);
        }
        return navigateToAdminCondimentsView(condiment);
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
        return navigateToAdminTimeSlotsView(timeSlots);
    }

    @PostMapping(path = "Admin/Settings/Openinghours")
    public String changeOpeningshours(Model settings,
                                      @RequestBody
                                      @RequestParam(value = "fromHours") String fromHours,
                                      @RequestParam(value = "fromMinutes") String fromMinutes,
                                      @RequestParam(value = "untilHours") String untilHours,
                                      @RequestParam(value = "untilMinutes") String untilMinutes,
                                      @RequestParam(value = "fromHoursSecond") String fromHoursSecond,
                                      @RequestParam(value = "fromMinutesSecond") String fromMinutesSecond,
                                      @RequestParam(value = "untilHoursSecond") String untilHoursSecond,
                                      @RequestParam(value = "untilMinutesSecond") String untilMinutesSecond,
                                      @RequestParam(value = "dayOfTheWeek") String dayOfTheWeek,
                                      @RequestParam(value = "_csrf") String token) {
        int fromhours;
        int fromminutes;
        int untilhours;
        int untilminutes;
        long fromTimeSlot;
        long untilTimeSlot;
        String from;
        String until;
        OpeningHours openingHours;
        int day = 0;
        if (!dayOfTheWeek.isBlank()) {
            day = Integer.parseInt(dayOfTheWeek);
            // delete existing records for this day ...
            int finalDay = day;
            List<OpeningHours> open = openinghoursRepository.findAll().stream().filter(x -> x.getDayOfTheWeek() == finalDay).collect(Collectors.toList());
            if (open.size() > 0){
                openinghoursRepository.deleteAll(open);
            }
        }



        if (!fromHours.equals(untilHours)){
            if (!fromMinutes.isBlank() && !untilMinutes.isBlank() && !dayOfTheWeek.isBlank()) {
                from = fromHours + ":" + fromMinutes + ":00";
                until = untilHours + ":" + untilMinutes + ":00";
                openingHours = new OpeningHours(Integer.parseInt(dayOfTheWeek), from, until);
                openinghoursRepository.saveAndFlush(openingHours);
                fromhours = Integer.parseInt(fromHours);
                fromminutes = Integer.parseInt(fromMinutes);
                untilhours = Integer.parseInt(untilHours);
                untilminutes = Integer.parseInt(untilMinutes);
                fromTimeSlot = timeSlotId(day, fromhours, fromminutes);
                untilTimeSlot = timeSlotId(day, untilhours, untilminutes);
                timeSlotUpdater(day, 1, fromTimeSlot, untilTimeSlot);
            }
        }
        if (!fromHoursSecond.equals(untilHoursSecond)){
            if (!fromMinutesSecond.isBlank() && !untilMinutesSecond.isBlank() && !dayOfTheWeek.isBlank()) {
                from = fromHoursSecond + ":" + fromMinutesSecond + ":00";
                until = untilHoursSecond + ":" + untilMinutesSecond + ":00";
                openingHours = new OpeningHours(Integer.parseInt(dayOfTheWeek), from, until);
                openinghoursRepository.saveAndFlush(openingHours);
                fromhours = Integer.parseInt(fromHoursSecond);
                fromminutes = Integer.parseInt(fromMinutesSecond);
                untilhours = Integer.parseInt(untilHoursSecond);
                untilminutes = Integer.parseInt(untilMinutesSecond);
                fromTimeSlot = timeSlotId(day, fromhours, fromminutes);
                untilTimeSlot = timeSlotId(day, untilhours, untilminutes);
                timeSlotUpdater(day, 2, fromTimeSlot, untilTimeSlot);
            }
        }
        return navigateToAdminSettingsView(settings);
    }

    @RequestMapping("Admin/Settings")
    public String navigateToAdminSettingsView(Model settings) {
        List<Vacation> allVacation = vacationRepository.findAll();
        List <OpeningHours> openingHoursList = openinghoursRepository.findAllByOrderByDayOfTheWeekAsc();
        settings.addAttribute("pageTitle", "Orders");
        settings.addAttribute("shopStatus", isInVacation());
        settings.addAttribute("logo", "/images/u101.png");
        settings.addAttribute("plannedVacation", allVacation);
        settings.addAttribute("openingHoursList", openingHoursList);
        inVacation = isInVacation();
        settings.addAttribute("shopStatus", inVacation);
        return "Admin/AdminSettingsView";
    }

    @PostMapping(path = "Admin/Settings/AddVacation")
    public String addVacationPeriod(Model settings,
                                    @RequestBody @RequestParam(value = "from") String from,
                                    @RequestParam(value = "untill") String untill,
                                    @RequestParam(value = "_csrf") String token) {
        Vacation Vacation = new Vacation(from, untill);
        vacationRepository.saveAndFlush(Vacation);
        return navigateToAdminSettingsView(settings);

    }

    @RequestMapping(value = "Admin/Settings/Vacation/Delete", method = RequestMethod.GET)
    public String deleteVacation(Model settings, @PathParam("id") String id) {
        Vacation vac = vacationRepository.getById(Long.parseLong(id));
        vacationRepository.delete(vac);
        return navigateToAdminSettingsView(settings);

    }

    @RequestMapping(value = "Admin/Settings/Openinghours/Delete", method = RequestMethod.GET)
    public String deleteOpeninghours(Model settings, @PathParam("id") String id) {
        OpeningHours op = openinghoursRepository.getById(Long.parseLong(id));
        openinghoursRepository.delete(op);
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
        long timeSlotId = (hours - 10) * 4L;
        if (minutes == 15) {
            timeSlotId = timeSlotId + 1;
        } else if (minutes == 30) {
            timeSlotId = timeSlotId + 2;
        } else if (minutes == 45) {
            timeSlotId = timeSlotId + 3;
        }
        switch (day) {
            case 1:
                return timeSlotId + 57;
            case 2:
                return timeSlotId + 113;
            case 3:
                return timeSlotId + 169;
            case 4:
                return timeSlotId + 225;
            case 5:
                return timeSlotId + 281;
            case 6:
                return timeSlotId + 337;
            default:
                return timeSlotId + 1;
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
        if (category == null) {
            return orderDetailRepository.findAll();
        }
        return orderDetailRepository.findAll().stream().filter(od -> od.getOrder().getStatus().equalsIgnoreCase(category)).collect(Collectors.toList());
    }

    public List<Order> getOrderList(String category) {
        if (category == null) {
            return orderRepository.findAll().stream().filter(x -> x.getOrderDate().equalsIgnoreCase(today)).collect(Collectors.toList());
        }
        return orderRepository.findAll().stream().filter(o -> o.getStatus().equalsIgnoreCase(category) && o.getOrderDate().equalsIgnoreCase(today)).collect(Collectors.toList());
    }
}
