package com.file.beans;

/**
 * The Class JsonResponse.
 */
public class JsonResponse {

	/** The status. */
	private String status = "200";

	/** The result. */
	private String result;

	/**
	 * Instantiates a new json response.
	 */
	public JsonResponse() {

	}

	/**
	 * Instantiates a new json response.
	 *
	 * @param status the status
	 * @param result the result
	 */
	public JsonResponse(String status, String result) {
		this.status = status;
		this.result = result;
	}

	/**
	 * Gets the status.
	 *
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * Sets the status.
	 *
	 * @param status the new status
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * Gets the result.
	 *
	 * @return the result
	 */
	public String getResult() {
		return result;
	}

	/**
	 * Sets the result.
	 *
	 * @param result the new result
	 */
	public void setResult(String result) {
		this.result = result;
	}

}