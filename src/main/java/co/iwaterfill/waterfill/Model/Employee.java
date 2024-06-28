package co.iwaterfill.waterfill.Model;

import jakarta.persistence.Entity;

@Entity
public class Employee {
    private Long id;
    private String Name;
    private String Address;
    private String Email;
    private String Username;
    private String Password;
    private String PhoneNumber;

    Employee(){}

    public Employee(String name, String address, String email, String username, String password, String phonenumber){
        Name = name;
        Address =address;
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

    public String getAddress() {
        return Address;
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

    public void setAddress(String address) {
        Address = address;
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
