package org.example.controller;

import org.example.dao.CustomerDAO;
import org.example.model.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    @GetMapping("/checkUsername")
    @ResponseBody
    public String checkUsername(String userName) {
        Customer customer = customerDAO.getCustomerByUsername(userName);
        if (customer != null && customer.getUserName() != null) {
            return "taken";
        } else {
            return "available";
        }
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
        Customer dbCustomer = customerDAO.getCustomerByCredentials(customer.getUserName(), customer.getPassword());

        if (dbCustomer.getName() != null) {
            model.addAttribute("customerDetails", dbCustomer);
            return "home"; // ✅ NEW JSP PAGE
        } else {
            model.addAttribute("errorMessage", "Invalid username or password");
            return "login";
        }
    }


}


