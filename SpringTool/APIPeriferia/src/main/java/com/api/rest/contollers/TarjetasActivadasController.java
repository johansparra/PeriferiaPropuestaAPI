package com.api.rest.contollers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.rest.clase.activacion.TarjetasAc;
import com.api.rest.clase.activacion.TarjetasActivadas;

@Controller
public class TarjetasActivadasController {
	
	@RequestMapping(method = RequestMethod.POST, value="/ServicioAdministrativosMockAPI/Activacion")

	
	@ResponseBody
	TarjetasResponse registrarTarjeta(@RequestBody TarjetasAc tarjetas) {
		
		System.out.println("Tarjeta Activada");
		TarjetasResponse stdregreply = new TarjetasResponse();           

		TarjetasActivadas.getInstance().add(tarjetas);
		
        stdregreply.setNroAutorizacion(tarjetas.getTransactionID());
        stdregreply.setEstado("Activada");
        stdregreply.setFecha(tarjetas.gettransactionDate());
        stdregreply.setHora(tarjetas.getTransactionTime());
        stdregreply.setCodRespuesta("000");
        stdregreply.setDescRespuesta("Transaccion Exitosa");
        return stdregreply;
        
	}
	
}
