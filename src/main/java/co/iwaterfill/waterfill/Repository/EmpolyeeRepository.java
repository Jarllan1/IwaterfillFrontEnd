package co.iwaterfill.waterfill.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import co.iwaterfill.waterfill.Model.Employee;

public interface EmpolyeeRepository extends JpaRepository<Employee, Long> {

    
} 