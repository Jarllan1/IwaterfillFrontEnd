package co.iwaterfill.waterfill.Controller;

import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import co.iwaterfill.waterfill.Model.Payment;
import co.iwaterfill.waterfill.NotFoundException.PaymentNotFoundException;
import co.iwaterfill.waterfill.Repository.PaymentRepository;


@RestController
public class PaymentController {
    PaymentRepository repo;

    public PaymentController(PaymentRepository repo) {
        this.repo = repo;
    }

 @GetMapping("/payment")
    public List<Payment> getPaymentId() {
        return repo.findAll();


}

@GetMapping("/payment/{id}")
    public Payment getPaymentId(@PathVariable Long id) {
        return repo.findById(id).orElseThrow(() -> new PaymentNotFoundException(id));
    }

     @PostMapping("/payment/new")
    public String addPaymentId(@RequestBody Payment newPaymentId) {
        repo.save(newPaymentId);
        return "Payment Accepted";
    }

    @PutMapping("/paymenent/edit/{id}")
    public Payment updatePaymentId(@PathVariable Long id, @RequestBody Payment newPaymentId) {
        return repo.findById(id)
                .map(payment -> {
                    payment.setPaymentId(newPaymentId.getPaymentId());
                    payment.setQuantity(newPaymentId.getQuantity());
                    payment.setPaymentDate(newPaymentId.getPaymentDate());
                    return repo.save(payment);
                })
                .orElseGet(() -> {
                    
                    return repo.save(newPaymentId);
                });
    }
    

    @DeleteMapping("/gallon/delete/{id}")
    public String deleteGallon(@PathVariable Long id){
        repo.deleteById(id);
        return"Payment Remove!";
    }
}