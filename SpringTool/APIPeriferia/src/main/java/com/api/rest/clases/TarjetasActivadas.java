package com.api.rest.clases;

import java.util.ArrayList;
import java.util.List;

public class TarjetasActivadas {
	
	private List<Tarjetas> tarjetasRecords;
	
	private static TarjetasActivadas stdregd = null;
	
	private TarjetasActivadas(){
		tarjetasRecords = new ArrayList<Tarjetas>();
	}
	
	public static TarjetasActivadas getInstance() {
		
		if(stdregd == null) {
			stdregd = new TarjetasActivadas();
			return stdregd;
		}
		else {
			return stdregd;
		}
	}
	
	//post
	public void add(Tarjetas std) {
		tarjetasRecords.add(std);
	}
	
//get
	public List<Tarjetas>getTarjetasRecords(){
		return tarjetasRecords;
	}
}
