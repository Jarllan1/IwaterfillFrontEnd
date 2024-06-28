package co.iwaterfill.waterfill.NotFoundException;

public class PaymentNotFoundException extends RuntimeException {

public PaymentNotFoundException(Long id){
    super("Payment Error" + id);
}
}
