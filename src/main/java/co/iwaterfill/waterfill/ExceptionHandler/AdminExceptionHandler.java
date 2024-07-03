package co.iwaterfill.waterfill.ExceptionHandler;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

import co.iwaterfill.waterfill.NotFoundException.AdminNotFoundException;

public class AdminExceptionHandler {
    @RestController
    public class  EmployeeExceptionHandler {
        @ExceptionHandler(AdminNotFoundException.class)
        @ResponseStatus(HttpStatus.NOT_FOUND)

        String AdminNotFoundHandler
        (AdminNotFoundException e){
            return e.getMessage();
        }
    
        
    }
}
