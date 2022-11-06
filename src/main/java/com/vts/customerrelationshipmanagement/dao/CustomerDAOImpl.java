package com.vts.customerrelationshipmanagement.dao;


import com.vts.customerrelationshipmanagement.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CustomerDAOImpl implements CustomerDAO {
    private final SessionFactory sessionFactory;

    @Autowired
    public CustomerDAOImpl(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public List<Customer> getCustomers() {
        Session session = sessionFactory.getCurrentSession();

        Query<Customer> query = session.createQuery("from Customer order by lastName");

        return query.getResultList();
    }

    @Override
    public Customer getCustomerByID(long theID) {
        Session session = sessionFactory.getCurrentSession();

        return session.get(Customer.class, theID);
    }

    @Override
    public void saveCustomer(Customer theCustomer) {
        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(theCustomer);
    }

    @Override
    public void deleteCustomer(long theID) {
        Session session = sessionFactory.getCurrentSession();

        Customer theCustomer = session.get(Customer.class, theID);

        session.delete(theCustomer);
    }
}
