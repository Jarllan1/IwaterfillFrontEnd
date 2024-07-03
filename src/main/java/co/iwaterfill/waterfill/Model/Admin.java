package co.iwaterfill.waterfill.Model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class Admin {
    @Id
    @GeneratedValue
    private Long id;
    private String Name;
    private String Email;
    private String Username;
    private String Password;
    private String PhoneNumber;

    Admin(){}

    public Admin(String name, String email, String username, String password, String phonenumber){
        Name = name;
        Email = email;
        Username = username;
        Password = password ;
        PhoneNumber = phonenumber;
    }
    

    public Long getId() {
        return id;
    }

    public String getName() {
        return Name;
    }

    public String getEmail() {
        return Email;
    }

    public String getUsername() {
        return Username;
    }

    public String getPassword() {
        return Password;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setName(String name) {
        Name = name;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public void setUsername(String username) {
        Username = username;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public void setPhoneNumber(String phoneNumber) {
        PhoneNumber = phoneNumber;
    }

    
}
