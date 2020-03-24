package com.api.rest.contollers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.rest.clases.Tarjetas;
import com.api.rest.clases.TarjetasActivadas;
import com.api.rest.clases.TarjetasActivadasResponse;

@Controller
public class TarjetasActivadasController {
	
	@RequestMapping(method = RequestMethod.POST, value="/register/tarjeta")

	
	@ResponseBody
	TarjetasActivadasResponse registrarTarjeta(@RequestBody Tarjetas tarjetas) {
		
		System.out.println("Tarjeta agregada");
		TarjetasActivadasResponse stdregreply = new TarjetasActivadasResponse();           

		TarjetasActivadas.getInstance().add(tarjetas);
		
	//	stdregreply.setNroAutorizacion(tarjetas.getTransactionID());
        stdregreply.setNroAutorizacion(tarjetas.getTransactionID());
        stdregreply.setEstado("Activado");
        stdregreply.setFecha(tarjetas.gettransactionDate());
        stdregreply.setHora(tarjetas.getTransactionTime());
        stdregreply.setCodRespuesta("000");
        stdregreply.setDescRespuesta("Transaccion Exitosa");
        return stdregreply;
        
	}

}
