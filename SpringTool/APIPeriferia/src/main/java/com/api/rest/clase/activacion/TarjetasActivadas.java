package com.api.rest.clase.activacion;

import java.util.ArrayList;
import java.util.List;

public class TarjetasActivadas {
	
	private List<TarjetasAc> tarjetasRecords;
	
	private static TarjetasActivadas stdregd = null;
	
	private TarjetasActivadas(){
		tarjetasRecords = new ArrayList<TarjetasAc>();
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
	public void add(TarjetasAc std) {
		tarjetasRecords.add(std);
	}
	
//get
	public List<TarjetasAc>getTarjetasRecords(){
		return tarjetasRecords;
	}
}
