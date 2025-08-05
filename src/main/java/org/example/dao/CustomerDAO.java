package org.example.dao;

import org.example.model.Customer;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class CustomerDAO {
    private JdbcTemplate jdbcTemplate;

    @Autowired
    public CustomerDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

//    public List<Customer> getAllCustomer() {
//        String sql = "SELECT * FROM students ";
//        return jdbcTemplate.query(sql, new RowMapper<Customer>() {
//            public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
//                Customer c = new Customer();
//                c.setName(rs.getString("name"));
//                c.setUserName(rs.getString("userName"));
//                c.setPassword(rs.getString("password"));
//                c.setGender(rs.getString("gender"));
//                return c;
//            }
//        });
//    }

    public void saveCustomer(Customer customer) {

        String sql = "INSERT INTO customer(name,userName, password, gender) VALUES (?, ?, ?,?)";

        jdbcTemplate.update(sql, customer.getName(), customer.getUserName(),customer.getPassword(), customer.getGender());
    }
    public Customer getCustomerByCredentials(String userName, String password) {
        try {
            String sql = "SELECT * FROM customer WHERE username = ? AND password = ?";

            return jdbcTemplate.queryForObject(sql, new Object[]{userName, password}, new RowMapper<Customer>() {
                public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
                    Customer c = new Customer();
                    c.setName(rs.getString("name"));
                    c.setUserName(rs.getString("username"));
                    c.setPassword(rs.getString("password"));
                    c.setGender(rs.getString("gender"));
                    return c;
                }
            });
        }
        catch(Exception NestedServletException) {
            Customer newcust=new Customer();
            newcust.setUserName(userName);
            newcust.setPassword(password);
        return newcust;
        }

    }

    public Customer getCustomerByUsername(String userName) {
        try {
            String sql = "SELECT * FROM customer WHERE username = ?";
            return jdbcTemplate.queryForObject(sql, new Object[]{userName}, new RowMapper<Customer>() {
                public Customer mapRow(ResultSet rs, int rowNum) throws SQLException {
                    Customer c = new Customer();
                    c.setName(rs.getString("name"));
                    c.setUserName(rs.getString("username"));
                    c.setPassword(rs.getString("password"));
                    c.setGender(rs.getString("gender"));
                    return c;
                }
            });
        } catch (Exception e) {
            return null; // user not found
        }
    }

}
