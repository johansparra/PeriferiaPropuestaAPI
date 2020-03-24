package com.api.rest.clases;

public class TarjetasActivadasResponse {
	
	   private String nroAutorizacion;
	   private String estado;
	   private String fecha;
	   private String hora;
	   private String codRespuesta;
	   private String descRespuesta;
	   

	public String getEstado() {
		return estado;
	}
	public void setEstado(String estado) {
		this.estado = estado;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
	public String getCodRespuesta() {
		return codRespuesta;
	}
	public void setCodRespuesta(String codRespuesta) {
		this.codRespuesta = codRespuesta;
	}
	public String getDescRespuesta() {
		return descRespuesta;
	}
	public void setDescRespuesta(String descRespuesta) {
		this.descRespuesta = descRespuesta;
	}
	public String getNroAutorizacion() {
		return nroAutorizacion;
	}
	public void setNroAutorizacion(String nroAutorizacion) {
		this.nroAutorizacion = nroAutorizacion;
	}

}
