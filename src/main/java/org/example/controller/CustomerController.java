package org.example.controller;

import org.example.dao.CustomerDAO;
import org.example.model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class CustomerController {

    @Autowired
    private CustomerDAO customerDAO;

    @RequestMapping("/signup")
    public String signup(Model model) {

        model.addAttribute("custAtt", new Customer());
        return "signup";
    }

    //saving customer to database
    @RequestMapping(value = "/savecustomer", method = RequestMethod.POST)
    public String saveStudent(@ModelAttribute("custAtt") Customer customer, Model model) {
        customerDAO.saveCustomer(customer);
        model.addAttribute("customerDetails", customer);
        return "customer";
    }

    @RequestMapping("/login")
    public String login(Model model) {
        Customer c = new Customer();
        model.addAttribute("custAtt", new Customer());
        return "login";
    }

    @RequestMapping(value = "/authentication", method = RequestMethod.POST)
    public String authentication(@ModelAttribute("custAtt") Customer customer, Model model) {
        if (customerDAO.getCustomerByCredentials(customer.getUserName(), customer.getPassword()).getName() != null) {
            model.addAttribute("customerDetails", customerDAO.getCustomerByCredentials(customer.getUserName(), customer.getPassword()));
            return "customer";
        } else {
            String str="User name or password is invalid";
         model.addAttribute("message", str);
         return "invalid";
        }
    }
}


