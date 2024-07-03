package co.iwaterfill.waterfill.Controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import co.iwaterfill.waterfill.Model.Employee;
import co.iwaterfill.waterfill.NotFoundException.EmployeeNotFoundException;
import co.iwaterfill.waterfill.Repository.EmpolyeeRepository;

@RestController
public class EmployeeController {

    EmpolyeeRepository repo;

    public EmployeeController(EmpolyeeRepository repo) {
        this.repo = repo;
    }

    @GetMapping("/employees")
    public List<Employee> getEmployees() {
        return repo.findAll();
    }

    @GetMapping("/employees/{id}")
    public Employee getEmployeeById(@PathVariable Long id) {
        return repo.findById(id)
                   .orElseThrow(() -> new EmployeeNotFoundException(id));
    }

    @PostMapping("/employees")
    public String addEmployee(@RequestBody Employee newEmployee) {
        repo.save(newEmployee);
        return "Employee added successfully!";
    }

    @PutMapping("/employees/{id}")
    public Employee updateEmployee(@PathVariable Long id, @RequestBody Employee updatedEmployee) {
        return repo.findById(id)
                   .map(employee -> {
                       employee.setName(updatedEmployee.getName());
                       employee.setAddress(updatedEmployee.getAddress());
                       employee.setEmail(updatedEmployee.getEmail());
                       employee.setUsername(updatedEmployee.getUsername());
                       employee.setPassword(updatedEmployee.getPassword());
                       employee.setPhoneNumber(updatedEmployee.getPhoneNumber());
                       return repo.save(employee);
                   })
                   .orElseThrow(() -> new EmployeeNotFoundException(id));
    }

    @DeleteMapping("/employees/{id}")
    public String deleteEmployee(@PathVariable Long id) {
        repo.deleteById(id);
        return "Employee deleted successfully!";
    }
}
