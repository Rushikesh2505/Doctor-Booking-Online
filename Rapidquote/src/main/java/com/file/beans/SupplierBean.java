package com.file.beans;

public class SupplierBean {

	private String supplierId;

	private String companyName;

	private String firstName;

	private String lastName;
	
	private String address;
	
	private String country;
	
	private String contactNumber;
	
	 private String password;
	private String contactEmail;

	
	private String expiryStatus;
	
	
	public SupplierBean() {

	}

	public SupplierBean(String supplierId, String companyName, String firstName, String lastName) {
		super();
		this.supplierId = supplierId;
		this.companyName = companyName;
		this.firstName = firstName;
		this.lastName = lastName;
	}

	public SupplierBean(String supplierId, String companyName, String firstName, String lastName, String address,
			String country, String contact, String email, String expiryStatus) {
		super();
		this.supplierId = supplierId;
		this.companyName = companyName;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.country = country;
		this.contactNumber = contactNumber;
		this.password = password;
		this.contactEmail = contactEmail;
		this.expiryStatus = expiryStatus;
	}

	public String getSupplierId() {
		return supplierId;
	}

	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}


	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getExpiryStatus() {
		return expiryStatus;
	}

	public void setExpiryStatus(String expiryStatus) {
		this.expiryStatus = expiryStatus;
	}

	@Override
	public String toString() {
		return "SupplierBean [supplierId=" + supplierId + ", companyName=" + companyName + ", firstName=" + firstName
				+ ", lastName=" + lastName + ", address=" + address + ", country=" + country + ", contactNumber="
				+ contactNumber + ", password=" + password + ", contactEmail=" + contactEmail + ", expiryStatus="
				+ expiryStatus + "]";
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	

	
}
