package com.vts.customerrelationshipmanagement.service.impl;


import com.vts.customerrelationshipmanagement.dao.CustomerDAO;
import com.vts.customerrelationshipmanagement.entity.Customer;
import com.vts.customerrelationshipmanagement.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
    private CustomerDAO customerDAO;

    @Autowired
    public CustomerServiceImpl(CustomerDAO customerDAO) {
        this.customerDAO = customerDAO;
    }

    @Override
    @Transactional
    public List<Customer> getCustomers() {
        return customerDAO.getCustomers();
    }

    @Override
    @Transactional
    public Customer getCustomerByID(long theID) {
        return customerDAO.getCustomerByID(theID);
    }

    @Override
    @Transactional
    public void saveCustomer(Customer theCustomer) {
        customerDAO.saveCustomer(theCustomer);
    }

    @Override
    @Transactional
    public void deleteCustomer(long theID) {
        customerDAO.deleteCustomer(theID);
    }
}
