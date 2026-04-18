package epaw.lab2.service;

import java.util.Set;

import jakarta.validation.ConstraintViolation;
import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;
import epaw.lab2.model.User;
import epaw.lab2.repository.UserRepository;

public class UserService {
	
	private static UserService instance;
	private UserRepository userRepository;
    private Validator validator;

	private UserService() {
		this.userRepository = UserRepository.getInstance();
		ValidatorFactory factory = Validation.buildDefaultValidatorFactory();
        this.validator = factory.getValidator();
	}

	public static synchronized UserService getInstance() {
		if (instance == null) {
			instance = new UserService();
		}
		return instance;
	}

	public Set<ConstraintViolation<User>> validate(User user) {
		return validator.validate(user);
	}

	public Set<ConstraintViolation<User>> register(User user) {
		Set<ConstraintViolation<User>> errors = validate(user);
		if (errors.isEmpty()) {
			userRepository.save(user);
		}
		return errors;
	}
}
