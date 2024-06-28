package co.iwaterfill.waterfill.Controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import co.iwaterfill.waterfill.Model.Employee;
import co.iwaterfill.waterfill.Repository.EmpolyeeRepository;

@RestController
public class EmployeeController {
    EmpolyeeRepository repo;

    public EmployeeController(EmpolyeeRepository repo){
        this.repo = repo;
       }

       @GetMapping("/employee")
        public List<Employee> getEmployees(){
            return repo.findAll();
        }

        @GetMapping("/Emplooyee/{id}")
    
}
