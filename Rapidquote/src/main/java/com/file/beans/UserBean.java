package com.file.beans;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;


public class UserBean {

	private String userId;

	
	private String guid;

	@NotNull
	private String firstName;

	@NotNull
	private String age;

	private MultipartFile report;
	
	@NotNull
	private String lastName;

	
	private String contactEmail;

	@NotNull
	private String contactNumber;

	@NotNull
	private String address;


	private String booking;

	private String birthdate;

	@NotNull
	private String date;

	private String imageFile;
	
	
	
	public String getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getImageFile() {
		return imageFile;
	}

	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}

	/** The supplier bean. */
	private SupplierBean supplierBean;
	
	public SupplierBean getSupplierBean() {
		return supplierBean;
	}

	public void setSupplierBean(SupplierBean supplierBean) {
		this.supplierBean = supplierBean;
	}

	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	
	public String getGuid() {
		return guid;
	}

	public void setGuid(String guid) {
		this.guid = guid;
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

	public String getContactEmail() {
		return contactEmail;
	}

	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	public String getContactNumber() {
		return contactNumber;
	}

	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public MultipartFile getReport() {
		return report;
	}

	public void setReport(MultipartFile report) {
		this.report = report;
	}

	public String getBooking() {
		return booking;
	}

	public void setBooking(String booking) {
		this.booking = booking;
	}

	@Override
	public String toString() {
		return "UserBean [userId=" + userId + ", guid=" + guid + ", firstName=" + firstName + ", age=" + age
				+ ", report=" + report + ", lastName=" + lastName + ", contactEmail=" + contactEmail
				+ ", contactNumber=" + contactNumber + ", address=" + address + ", booking=" + booking + ", birthdate="
				+ birthdate + ", date=" + date + ", imageFile=" + imageFile + ", supplierBean=" + supplierBean + "]";
	}


}
