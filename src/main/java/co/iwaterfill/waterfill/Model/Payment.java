package co.iwaterfill.waterfill.Model;

import java.util.Date;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;

@Entity
public class Payment {

    @Id
    @GeneratedValue
    private Long id;
    private String PaymentId;
    private String Quantity;
    private Date PaymentDate;

    Payment(){}

   

public Payment(String paymentId, String quantity, Date paymentDate) {
        PaymentId = paymentId;
        Quantity = quantity;
        PaymentDate = paymentDate;
    }



public String getPaymentId() {
    return PaymentId;
}

public Long getId() {
    return id;
}

public void setPaymentId(String paymentId) {
    PaymentId = paymentId;
}

public String getQuantity() {
    return Quantity;
}

public void setQuantity(String quantity) {
    Quantity = quantity;
}

public Date getPaymentDate() {
    return PaymentDate;
}

public void setPaymentDate(Date paymentDate) {
    PaymentDate = paymentDate;
}


   
}
