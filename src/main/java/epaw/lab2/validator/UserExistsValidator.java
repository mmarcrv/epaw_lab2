package epaw.lab2.validator;

import jakarta.validation.ConstraintValidator;
import jakarta.validation.ConstraintValidatorContext;
import epaw.lab2.repository.UserRepository;


public class UserExistsValidator implements ConstraintValidator<UserExists, String> {

	private UserRepository userRepository;
	
	@Override
    public void initialize(UserExists constraintAnnotation) {
        this.userRepository = UserRepository.getInstance();
    }
	
    @Override
    public boolean isValid(String username, ConstraintValidatorContext context) {
    	if (username == null || username.isEmpty()) {
    		return false; // Invalid if username is null or empty
        }
        // Use the repository to check the existence of the username
        return !userRepository.existsByUsername(username); 
    }
}