package com.api.rest.clase.asignacion;

public class TarjetasAs {

	private String transactionID;
	private String transactionDate;
	private String transactionTime;
	private String nroCuentaPrimaria;
	private String verificacionPIN;

	public String getTransactionID() {
		return transactionID;
	}

	public void setTransactionID(String transactionID) {
		this.transactionID = transactionID;
	}

	public String gettransactionDate() {
		return transactionDate;
	}

	public void settransactionDate(String transactionDate) {
		this.transactionDate = transactionDate;
	}

	public String getTransactionTime() {
		return transactionTime;
	}

	public void setTransactionTime(String transactionTime) {
		this.transactionTime = transactionTime;
	}

	public String getnroCuentaPrimaria() {
		return nroCuentaPrimaria;
	}

	public void setnroCuentaPrimaria(String nroCuentaPrimaria) {
		this.nroCuentaPrimaria = nroCuentaPrimaria;
	}

	public String getVerificacionPIN() {
		return verificacionPIN;
	}

	public void setVerificacionPIN(String verificacionPIN) {
		this.verificacionPIN = verificacionPIN;
	}



}