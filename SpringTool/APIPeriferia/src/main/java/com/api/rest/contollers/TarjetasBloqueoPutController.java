package com.api.rest.contollers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.rest.clase.bloqueo.TarjetasBl;
import com.api.rest.clase.bloqueo.TarjetasBloqueadas;

@Controller
public class TarjetasBloqueoPutController {
	
@RequestMapping(method = RequestMethod.PUT, value="/ServicioAdministrativosMockAPI/Bloqueo/Update")

	
	@ResponseBody
	public String updateStudentRecord(@RequestBody TarjetasBl stdn) {		
		System.out.println("Realizando Busqueda para actualizar for transactionID");	   
	    return TarjetasBloqueadas.getInstance().upDateTarjetaBloqueo(stdn);		
	}	

}
