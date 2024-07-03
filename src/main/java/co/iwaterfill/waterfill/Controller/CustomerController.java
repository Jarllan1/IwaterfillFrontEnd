package co.iwaterfill.waterfill.Controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import co.iwaterfill.waterfill.Model.Customer;
import co.iwaterfill.waterfill.NotFoundException.CustomerNotFoundException;
import co.iwaterfill.waterfill.Repository.CustomerRepository;

@RestController
@RequestMapping("/customers")
public class CustomerController {

    final CustomerRepository repo;

    public CustomerController(CustomerRepository repo) {
        this.repo = repo;
    }

    @GetMapping
    public List<Customer> getCustomers() {
        return repo.findAll();
    }

    @GetMapping("/{id}")
    public Customer getCustomerById(@PathVariable Long id) {
        return repo.findById(id)
                   .orElseThrow(() -> new CustomerNotFoundException(id));
    }

    @PostMapping("/new")
    public String addCustomer(@RequestBody Customer newCustomer) {
        repo.save(newCustomer);
        return "Customer added successfully!";
    }

    @PutMapping("/{id}")
    public Customer updateCustomer(@PathVariable Long id, @RequestBody Customer updatedCustomer) {
        return repo.findById(id)
                   .map(customer -> {
                       customer.setName(updatedCustomer.getName());
                       customer.setEmail(updatedCustomer.getEmail());
                       customer.setUsername(updatedCustomer.getUsername());
                       customer.setPassword(updatedCustomer.getPassword());
                       customer.setPhoneNumber(updatedCustomer.getPhoneNumber());
                       return repo.save(customer);
                   })
                   .orElseThrow(() -> new CustomerNotFoundException(id));
    }

    @DeleteMapping("/{id}")
    public String deleteCustomer(@PathVariable Long id) {
        repo.deleteById(id);
        return "Customer deleted successfully!";
    }
}

