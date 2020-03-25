package com.api.rest.clase.asignacion;

import java.util.ArrayList;
import java.util.List;

public class TarjetasAsignadas {
	private List<TarjetasAs> tarjetasRecords;
	
	private static TarjetasAsignadas stdregd = null;
	
	private TarjetasAsignadas(){
		tarjetasRecords = new ArrayList<TarjetasAs>();
	}
	
	public static TarjetasAsignadas getInstance() {
		
		if(stdregd == null) {
			stdregd = new TarjetasAsignadas();
			return stdregd;
		}
		else {
			return stdregd;
		}
	}
	
	//post
	public void add(TarjetasAs std) {
		tarjetasRecords.add(std);
	}
	
//get
	public List<TarjetasAs>getTarjetasRecords(){
		return tarjetasRecords;
	}
}
