package co.iwaterfill.waterfill.ExceptionHandler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import co.iwaterfill.waterfill.NotFoundException.PaymentNotFoundException;

@RestController
public class PaymentExceptionHandler {
    @ExceptionHandler(PaymentNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)

    String PaymentNotFoundHandler
    (PaymentNotFoundException e){
        return e.getMessage();
    }
    
}
