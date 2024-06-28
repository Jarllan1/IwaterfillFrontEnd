package co.iwaterfill.waterfill.NotFoundException;

public class EmployeeNotFoundException extends RuntimeException{

    public EmployeeNotFoundException(Long id){
        super("Employee not found" + id);
    }
}
