package com.vts.customerrelationshipmanagement.controller;


import com.vts.customerrelationshipmanagement.entity.Customer;
import com.vts.customerrelationshipmanagement.service.CustomerService;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;


@Controller
@RequestMapping("/customer")
public class CustomerController {
    //trim the space in form
    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    private final CustomerService customerService;

    public CustomerController(CustomerService customerService) {
        this.customerService = customerService;
    }

    @GetMapping("/list")
    public String listCustomers(Model model) {
        //get customers from DAO
        List<Customer> customers = customerService.getCustomers();

        model.addAttribute("customers", customers);
        //add customers to model
        return "list-customers";
    }

    @GetMapping("/showFormForAdd")
    public String showFormForAdd(Model model) {
        Customer theCustomer = new Customer();

        model.addAttribute("customer", theCustomer);

        return "add-customer-form";
    }

    @PostMapping("/showFormForUpdate")
    public String showFormForUpdate(@RequestParam("customerID") long theID, Model model) {
        Customer theCustomer = customerService.getCustomerByID(theID);

        model.addAttribute("customer", theCustomer);

        return "update-customer-form";
    }

    @PostMapping("/saveNewCustomer")
    public String saveNewCustomer(@Valid @ModelAttribute("customer") Customer theCustomer, BindingResult result) {
        if (result.hasErrors()) {
            return "add-customer-form";
        }

        customerService.saveCustomer(theCustomer);
        return "redirect:/customer/list";
    }

    @GetMapping("/saveNewCustomer")
    public String invalidAddRequest() {
        return "redirect:/customer/showFormForAdd";
    }

    @PostMapping("/saveUpdateCustomer")
    public String saveUpdateCustomer(@Valid @ModelAttribute("customer") Customer theCustomer, BindingResult result) {
        if (result.hasErrors()) {
            return "update-customer-form";
        }

        customerService.saveCustomer(theCustomer);
        return "redirect:/customer/list";
    }

    @GetMapping("/saveUpdateCustomer")
    public String invalidUpdateRequest() {
        return "redirect:/customer/list";
    }

    @PostMapping("/deleteCustomer")
    public String deleteCustomer(@RequestParam("customerID") long theID) {
        customerService.deleteCustomer(theID);

        return "redirect:/customer/list";
    }
}
