package co.iwaterfill.waterfill.ExceptionHandler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import co.iwaterfill.waterfill.NotFoundException.CustomerNotFoundException;

@RestController
public class CustomerExceptionHandler {
@ExceptionHandler(CustomerNotFoundException.class)
@ResponseStatus(HttpStatus.NOT_FOUND)

String CustomerNotFoundHandler
(CustomerNotFoundException e){
    return e.getMessage();
}
}
