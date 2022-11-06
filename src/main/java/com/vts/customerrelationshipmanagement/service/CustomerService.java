package com.vts.customerrelationshipmanagement.service;

import com.vts.customerrelationshipmanagement.entity.Customer;

import java.util.List;

public interface CustomerService {
    List<Customer> getCustomers();
    Customer getCustomerByID(long theID);
    void saveCustomer(Customer theCustomer);
    void deleteCustomer(long theID);
}
