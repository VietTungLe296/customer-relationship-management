package com.vts.customerrelationshipmanagement.dao;

import com.vts.customerrelationshipmanagement.entity.Customer;

import java.util.List;

public interface CustomerDAO {
    List<Customer> getCustomers();
    Customer getCustomerByID(long theID);
    void saveCustomer(Customer theCustomer);
    void deleteCustomer(long theID);
}
