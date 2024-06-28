package co.iwaterfill.waterfill.Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import co.iwaterfill.waterfill.Model.Payment;

public interface PaymentRepository extends JpaRepository <Payment, Long>{

}  
