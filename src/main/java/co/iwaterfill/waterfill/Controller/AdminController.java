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

import co.iwaterfill.waterfill.Model.Admin;
import co.iwaterfill.waterfill.NotFoundException.AdminNotFoundException;
import co.iwaterfill.waterfill.Repository.AdminRepository;

@RestController
@RequestMapping("/admin")
public class AdminController {

     final AdminRepository repo;

    public AdminController(AdminRepository repo) {
        this.repo = repo;
    }

    @GetMapping("/admins")
    public List<Admin> getAdmins() {
        return repo.findAll();
    }

    @GetMapping("/admins/{id}")
    public Admin getAdminById(@PathVariable Long id) {
        return repo.findById(id)
                   .orElseThrow(() -> new AdminNotFoundException(id));
    }

    @PostMapping("/admins")
    public String addAdmin(@RequestBody Admin newAdmin) {
        repo.save(newAdmin);
        return "Admin added successfully!";
    }

    @PutMapping("/admins/{id}")
    public Admin updateAdmin(@PathVariable Long id, @RequestBody Admin updatedAdmin) {
        return repo.findById(id)
                   .map(admin -> {
                       admin.setName(updatedAdmin.getName());
                       admin.setEmail(updatedAdmin.getEmail());
                       admin.setUsername(updatedAdmin.getUsername());
                       admin.setPassword(updatedAdmin.getPassword());
                       admin.setPhoneNumber(updatedAdmin.getPhoneNumber());
                       return repo.save(admin);
                   })
                   .orElseThrow(() -> new AdminNotFoundException(id));
    }

    @DeleteMapping("/admins/{id}")
    public String deleteAdmin(@PathVariable Long id) {
        repo.deleteById(id);
        return "Admin deleted successfully!";
    }
}

