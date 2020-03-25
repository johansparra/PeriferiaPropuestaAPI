package com.api.rest.clase.bloqueo;

public class TarjetasBl {

	private String transactionID;
	private String transactionDate;
	private String transactionTime;
	private String nroCuentaPrimaria;

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


}