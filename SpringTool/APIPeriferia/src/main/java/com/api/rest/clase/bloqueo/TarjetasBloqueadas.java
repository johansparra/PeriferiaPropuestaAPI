package com.api.rest.clase.bloqueo;

import java.util.ArrayList;
import java.util.List;

public class TarjetasBloqueadas {
	private List<TarjetasBl> tarjetasRecords;
	
	private static TarjetasBloqueadas stdregd = null;
	
	private TarjetasBloqueadas(){
		tarjetasRecords = new ArrayList<TarjetasBl>();
	}
	
	public static TarjetasBloqueadas getInstance() {
		
		if(stdregd == null) {
			stdregd = new TarjetasBloqueadas();
			return stdregd;
		}
		else {
			return stdregd;
		}
	}
	
	//post
	public void add(TarjetasBl std) {
		tarjetasRecords.add(std);
	}
	
			public String upDateTarjetaBloqueo(TarjetasBl std) {
		
		for(int i=0; i<tarjetasRecords.size(); i++)
        {
			TarjetasBl stdn = tarjetasRecords.get(i);

            System.out.println("Busqueda " + std.getTransactionID());
            if(stdn.getTransactionID().equals(std.getTransactionID())) {
            	tarjetasRecords.set(i, std);//update the new record
            	
            	return "Update successful";
            }
        }
		
		return "Update un-successful";
		
	}
	
//get
	public List<TarjetasBl>getTarjetasRecords(){
		return tarjetasRecords;
	}
}
