package be.thomasmore.graduaten.hellospring.controllers;

import be.thomasmore.graduaten.hellospring.entities.Product;
import be.thomasmore.graduaten.hellospring.repositories.ProductRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class MainController {

    private ProductRepository productRepository;

    public MainController(ProductRepository productRepository){
        this.productRepository = productRepository;
    }

    @RequestMapping("/")
    public String navigateToIndex(){
        return "index";
    }

}