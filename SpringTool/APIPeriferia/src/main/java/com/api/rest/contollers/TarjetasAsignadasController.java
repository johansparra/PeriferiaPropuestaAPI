package com.api.rest.contollers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.api.rest.clase.asignacion.TarjetasAs;
import com.api.rest.clase.asignacion.TarjetasAsignadas;

@Controller
public class TarjetasAsignadasController {

	@RequestMapping(method = RequestMethod.POST, value = "/ServicioAdministrativosMockAPI/Asignacion")

	@ResponseBody
	TarjetasResponse registrarTarjeta(@RequestBody TarjetasAs tarjetas) {

		System.out.println("Tarjeta Asignada");
		TarjetasResponse stdregreply = new TarjetasResponse();

		TarjetasAsignadas.getInstance().add(tarjetas);

		stdregreply.setNroAutorizacion(tarjetas.getTransactionID());
		stdregreply.setEstado("Asignada");
		stdregreply.setFecha(tarjetas.gettransactionDate());
		stdregreply.setHora(tarjetas.getTransactionTime());
		stdregreply.setCodRespuesta("010");
		stdregreply.setDescRespuesta("Transaccion Exitosa");
		return stdregreply;

	}

}
