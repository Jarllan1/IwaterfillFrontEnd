package co.iwaterfill.waterfill.NotFoundException;

public class AdminNotFoundException extends RuntimeException {

    public AdminNotFoundException(Long id){
        super("Admin not found" + id);
    }

}
