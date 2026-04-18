package epaw.lab2.validator;

import jakarta.validation.Constraint;
import jakarta.validation.Payload;
import java.lang.annotation.*;

@Documented
@Constraint(validatedBy = UserExistsValidator.class)
@Target({ ElementType.FIELD, ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
public @interface UserExists {
	String message() default "This user already exists on our database.";
    Class<?>[] groups() default {};
    Class<? extends Payload>[] payload() default {};
}
