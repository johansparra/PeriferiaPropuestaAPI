package com.api.rest.contollers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


import com.api.rest.clase.bloqueo.TarjetasBl;
import com.api.rest.clase.bloqueo.TarjetasBloqueadas;


@Controller
public class TarjetasBloqueoController {

	@RequestMapping(method = RequestMethod.POST, value = "/ServicioAdministrativosMockAPI/Bloqueo")

	@ResponseBody
	TarjetasResponse registrarTarjeta(@RequestBody TarjetasBl tarjetas) {

		System.out.println("Tarjeta Bloqueada");
		TarjetasResponse stdregreply = new TarjetasResponse();

		TarjetasBloqueadas.getInstance().add(tarjetas);

		stdregreply.setNroAutorizacion(tarjetas.getTransactionID());
		stdregreply.setEstado("Bloqueada");
		stdregreply.setFecha(tarjetas.gettransactionDate());
		stdregreply.setHora(tarjetas.getTransactionTime());
		stdregreply.setCodRespuesta("020");
		stdregreply.setDescRespuesta("Transaccion Exitosa");
		return stdregreply;

	}

}
