package epaw.lab2.model;

import java.io.Serializable;


public class User implements Serializable {

	private static final long serialVersionUID = -8465990321138923924L;
	
	private int id;

	private String name;
	
	private String password;
	
	private String firstName;
	
	private String lastName;
	
	private String email;
	
	private String dateOfBirth;
	
	private String comarca;
	
	
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
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	
	public String getComarca() {
		return comarca;
	}
	public void setComarca(String comarca) {
		this.comarca = comarca;
	}
	
	
}