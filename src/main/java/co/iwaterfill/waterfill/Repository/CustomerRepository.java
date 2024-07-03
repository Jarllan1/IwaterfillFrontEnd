package co.iwaterfill.waterfill.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import co.iwaterfill.waterfill.Model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long> {

    

}
