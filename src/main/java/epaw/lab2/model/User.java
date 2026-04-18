package epaw.lab2.model;

import java.io.Serializable;
import jakarta.validation.constraints.*;
import epaw.lab2.validator.UserExists;


public class User implements Serializable {

	private static final long serialVersionUID = -8465990321138923924L;
	
	private int id;

	@NotBlank(message = "Username can not be empty.")
	@Size(min = 5, max=20, message="Server: Username must be beetween 5 and 20 characters.")
	@UserExists
	private String name;
	
	@NotBlank(message = "Password can not be empty.")
	@Pattern(
	        regexp = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[!@#$%^&*]).{8,}$",
	        message = "Server: Minimum 8 characters, including uppercase, number, and special character: *[!@#$%^&*]"
	    )
	private String password;
	
	
	public User() {
		super();
	}
	
	public Integer getId() {
		return this.id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
}