package com.file.beans;

/**
 * The Class CustomerBean.
 */
public class CustomerBean {

	/** The customer id. */
	private String customerId;
	
	/** The guid. */
	private String guid;
	
	/** The first name. */
	private String firstName;
	
	/** The last name. */
	private String lastName;
	
	/** The contact email. */
	private String contactEmail;
	
	/** The contact number. */
	private String contactNumber;
	
	/** The address. */
	private String address;
	
	/** The country. */
	private String country;

	/** The password. */
	private String password;
	
	/** The confirm password. */
	private String confirmPassword;
	
	/** The date. */
	private String date;
	
	/** The enabled. */
	private boolean enabled;
	
	/** The cart no. */
	private String cartNo;
	
/*	*//** The supplier id. *//*
	private String supplierId;*/
	
	/** The currencyu. */
	private String currencyu;
	
	/** The supplier bean. *//*
	private SupplierBean supplierBean;*/

	/**
	 * Gets the customer id.
	 *
	 * @return the customer id
	 */
	public String getCustomerId() {
		return customerId;
	}

	/**
	 * Sets the customer id.
	 *
	 * @param customerId the new customer id
	 */
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	/**
	 * Gets the guid.
	 *
	 * @return the guid
	 */
	public String getGuid() {
		return guid;
	}

	/**
	 * Sets the guid.
	 *
	 * @param guid the new guid
	 */
	public void setGuid(String guid) {
		this.guid = guid;
	}

	/**
	 * Gets the first name.
	 *
	 * @return the first name
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * Sets the first name.
	 *
	 * @param firstName the new first name
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * Gets the last name.
	 *
	 * @return the last name
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * Sets the last name.
	 *
	 * @param lastName the new last name
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * Gets the contact email.
	 *
	 * @return the contact email
	 */
	public String getContactEmail() {
		return contactEmail;
	}

	/**
	 * Sets the contact email.
	 *
	 * @param contactEmail the new contact email
	 */
	public void setContactEmail(String contactEmail) {
		this.contactEmail = contactEmail;
	}

	/**
	 * Gets the contact number.
	 *
	 * @return the contact number
	 */
	public String getContactNumber() {
		return contactNumber;
	}

	/**
	 * Sets the contact number.
	 *
	 * @param contactNumber the new contact number
	 */
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}

	/**
	 * Gets the address.
	 *
	 * @return the address
	 */
	public String getAddress() {
		return address;
	}

	/**
	 * Sets the address.
	 *
	 * @param address the new address
	 */
	public void setAddress(String address) {
		this.address = address;
	}

	/**
	 * Gets the country.
	 *
	 * @return the country
	 */
	public String getCountry() {
		return country;
	}

	/**
	 * Sets the country.
	 *
	 * @param country the new country
	 */
	public void setCountry(String country) {
		this.country = country;
	}

	/**
	 * Gets the password.
	 *
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * Sets the password.
	 *
	 * @param password the new password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * Gets the confirm password.
	 *
	 * @return the confirm password
	 */
	public String getConfirmPassword() {
		return confirmPassword;
	}

	/**
	 * Sets the confirm password.
	 *
	 * @param confirmPassword the new confirm password
	 */
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	/**
	 * Gets the date.
	 *
	 * @return the date
	 */
	public String getDate() {
		return date;
	}

	/**
	 * Sets the date.
	 *
	 * @param date the new date
	 */
	public void setDate(String date) {
		this.date = date;
	}

	/**
	 * Checks if is enabled.
	 *
	 * @return true, if is enabled
	 */
	public boolean isEnabled() {
		return enabled;
	}

	/**
	 * Sets the enabled.
	 *
	 * @param enabled the new enabled
	 */
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	/**
	 * Gets the cart no.
	 *
	 * @return the cart no
	 */
	public String getCartNo() {
		return cartNo;
	}

	/**
	 * Sets the cart no.
	 *
	 * @param cartNo the new cart no
	 */
	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}

	/**
	 * Gets the supplier id.
	 *
	 * @return the supplier id
	 *//*
	public String getSupplierId() {
		return supplierId;
	}

	*//**
	 * Sets the supplier id.
	 *
	 * @param supplierId the new supplier id
	 *//*
	public void setSupplierId(String supplierId) {
		this.supplierId = supplierId;
	}
*/
	/**
	 * Gets the currencyu.
	 *
	 * @return the currencyu
	 */
	public String getCurrencyu() {
		return currencyu;
	}

	/**
	 * Sets the currencyu.
	 *
	 * @param currencyu the new currencyu
	 */
	public void setCurrencyu(String currencyu) {
		this.currencyu = currencyu;
	}

	/**
	 * Gets the supplier bean.
	 *
	 * @return the supplier bean
	 *//*
	public SupplierBean getSupplierBean() {
		return supplierBean;
	}

	*//**
	 * Sets the supplier bean.
	 *
	 * @param supplierBean the new supplier bean
	 *//*
	public void setSupplierBean(SupplierBean supplierBean) {
		this.supplierBean = supplierBean;
	}
*/
	/**
	 * To string.
	 *
	 * @return the string
	 */
	@Override
	public String toString() {
		return "CustomerBean [customerId=" + customerId + ", guid=" + guid + ", firstName=" + firstName + ", lastName="
				+ lastName + ", contactEmail=" + contactEmail + ", contactNumber=" + contactNumber + ", address="
				+ address + ", country=" + country + ", password=" + password + ", confirmPassword=" + confirmPassword
				+ ", date=" + date + ", enabled=" + enabled + ", cartNo=" + cartNo
				+ ", currencyu=" + currencyu +"]";
	}

}
