package co.iwaterfill.waterfill.ExceptionHandler;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import co.iwaterfill.waterfill.NotFoundException.EmployeeNotFoundException;

@RestController
public class EmployeeExceptionHandler{
    @ExceptionHandler(EmployeeNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)

    String EmployeeNotFoundHandler
    (EmployeeNotFoundException e){
        return e.getMessage();
    }
   

}
